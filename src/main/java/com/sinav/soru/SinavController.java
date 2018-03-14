package com.sinav.soru;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Enum.SinavEnum;
import Properties.CevaplarPro;
import Properties.SinavPro;
import Properties.SonucPro;
import Properties.SorularPro;
import Utils.Db;

@Controller
public class SinavController {

	static int kisiID = 0;
	static String kisiAd = "";

	int i = 0;

	@RequestMapping(value = "/basla", method = RequestMethod.GET)
	public String basla(Model model) {
	
		i = 0;
		List<SorularPro> soruList = sorugetir();
		List<SinavPro> cevapList = sinavDoldur(soruList.get(i).getSoru_id());

		model.addAttribute("cevaplist", cevapList);
		model.addAttribute("liste", soruList.get(i));
		
		return "sinav";
	}

	@RequestMapping(value = "/ileri", method = RequestMethod.POST)
	public String ileri(Model model, @RequestParam(defaultValue = "bos") String rdbkontrol) {

		List<SorularPro> soruList = sorugetir();

		sonucEkle(rdbkontrol, String.valueOf(kisiID), soruList.get(i).getSoru_id());
		i++;

		if (soruList.size() > i) {
			model.addAttribute("i", i + 1);
			model.addAttribute("liste", soruList.get(i));
			String soruId = soruList.get(i).getSoru_id();
			List<SinavPro> cevapList = sinavDoldur(soruId);

			if (cevapList.size() > 0) {
				model.addAttribute("cevaplist", cevapList);
			}

		}

		if (soruList.size() == i) {
			List<SonucPro> sonuclar = sonucEkraný(String.valueOf(kisiID));

			model.addAttribute("sonuclarLs", sonuclar);

		}
		return "sinav";
	}

	public void sonucEkle(String cevapid, String oturumid, String soruid) {
		try {
			PreparedStatement prs = db.preConnect("call sinavekle(?,?,?)");
			prs.setString(1, cevapid);
			prs.setString(2, oturumid);
			prs.setString(3, soruid);
			int sonuc = prs.executeUpdate();

			if (sonuc > 0) {

				System.out.println("sinav ekleme basarili");

			}
		} catch (Exception e) {
			System.out.println(cevapid);

			System.out.println(oturumid);

			System.out.println(soruid);
			System.out.println("sinav ekleme basarisiz" + e);
		}

	}

	public List<SorularPro> sorugetir() {
		List<SorularPro> splist = new ArrayList<SorularPro>();

		try {
			ResultSet rs = db.connect().executeQuery("call sorugetir()");
			while (rs.next()) {
				SorularPro sp = new SorularPro();
				sp.setSoru_id(rs.getString(1));

				sp.setSoru((rs.getString(2)));
				splist.add(sp);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return splist;
	}

	@RequestMapping(value = "/sinavsayfasi", method = RequestMethod.GET)
	public String degerAl(Model model) {
		model.addAttribute("i", i);
		model.addAttribute("giris", "deger");

		return "sinav";
	}

	@RequestMapping(value = "/sinav/giris", method = RequestMethod.POST)
	public String sinavAcil(Model model, @RequestParam String ad) {
		try {
			PreparedStatement prs = db.preConnect("call oturumekle(?)");
			prs.setString(1, ad);
			int sonuc = prs.executeUpdate();
			if (sonuc > 0)
				System.out.println("eklme basarili");
			db.disconnect();

			try {

				String query = "select  o.oturum_id  ,o.ad from oturum  as o ORDER BY oturum_id desc  limit 1";
				ResultSet rs = db.connect().executeQuery(query);
				while (rs.next()) {

					kisiID = rs.getInt(1);
					kisiAd = rs.getString(2);
					System.out.println(kisiID);
				}
			} catch (Exception e) {

			}

		} catch (Exception e) {

		}
		model.addAttribute("degerAl", "basarili");
		model.addAttribute("id", kisiID);
		model.addAttribute("ad", kisiAd);

		return "sinav";
	}

	// @RequestMapping(value = "/sinavol", method = RequestMethod.POST)
	// public String sinavSonraki(Model model) {

	// List<SinavPro> spList = sinavDoldur();
	// System.out.println(spList.get(0).getSoru());

	// model.addAttribute("slist", spList);

	// return "redirect:/sinav";
	// }

	Db db = new Db("question_create", "root", "");

	public List<SinavPro> sinavDoldur(String id) {
		List<SinavPro> sinavpro = new ArrayList<SinavPro>();

		try {
			ResultSet rs = db.connect().executeQuery("call cevaplarselect('" + id + "')");

			while (rs.next()) {

				SinavPro sp = new SinavPro();
				sp.setSoru(rs.getString(1));
				sp.setCevap(rs.getString(2));
				sp.setCevap_id((rs.getString("" + SinavEnum.cevap_id)));
				sp.setCsoru_id(rs.getString("" + SinavEnum.csoru_id));
				sp.setDurum(rs.getString("" + SinavEnum.durum));
				sinavpro.add(sp);

			}

		} catch (Exception e) {
			System.out.println("soru cevap doldurmada hata: " + e);
		}

		return sinavpro;
	}

	@RequestMapping(value = "/ara", method = RequestMethod.POST)
	public String sonuc(@RequestParam String ad, Model model) {
		String id = String.valueOf(sonucID(ad));
		List<SonucPro> sonucList = sonucEkraný(id);

		model.addAttribute("sonuclarLs", sonucList);
		model.addAttribute("ad", ad);
		return "main";
	}

	public List<SonucPro> sonucEkraný(String oid) {
		List<SonucPro> sonucList = new ArrayList<SonucPro>();

		try {
			PreparedStatement prs = db.preConnect("call sinavcek(?)");
			prs.setString(1, oid);
			System.out.println("sonuc ceke girdi");
			ResultSet rs = prs.executeQuery();
			while (rs.next()) {
				System.out.println("donguye girdi");
				SonucPro sonp = new SonucPro();
				sonp.setCevap(rs.getString(1));
				sonp.setAd(rs.getString(2));
				sonp.setSoru(rs.getString(3));
				sonp.setDurum(rs.getString(4));
				sonucList.add(sonp);
				for (SonucPro item : sonucList) {
					System.out.println("adýmýz"+item.getAd());
				}

			}

		} catch (Exception e) {
			System.err.println("sinav cekme hatasi: " + e);
		}

		return sonucList;
	}

	public static String ad = "";

	public int sonucID(String adi) {
		int id = 0;
System.out.println("fonksiyona girdi");
		try {

			String query = "select  o.oturum_id,o.ad   from oturum  as o   where o.ad= '" + adi
					+ "' ORDER BY oturum_id desc  limit 1";
			ResultSet rs = db.connect().executeQuery(query);
			while (rs.next()) {
				ad = rs.getString(2);
				System.out.println(ad);
				id = rs.getInt(1);
				System.out.println(id);
			}
		} catch (Exception e) {
			System.err.println("kisi id cekme hatasi");
		}

		return id;

	}

}
