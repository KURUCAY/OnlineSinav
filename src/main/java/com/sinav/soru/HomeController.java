package com.sinav.soru;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Enum.cevapEnum;
import Enum.soruEnum;
import Properties.CevaplarPro;
import Properties.SorularPro;
import Utils.Db;

@Controller
public class HomeController {

	@RequestMapping(value = "/sinavolustur", method = RequestMethod.GET)
	public String home(Model model) {

		List<SorularPro> sp = soruDoldur();
		if (sp.size() > 0) {
			model.addAttribute("sList", sp);
		}
		return "home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home1(Model model) {

		return "main";
	}

	@RequestMapping(value = "/anasayfa", method = RequestMethod.GET)
	public String home2(Model model) {

		return "main";
	}

	@RequestMapping(value = "/ekle", method = RequestMethod.POST)
	public String soruKaydet(@RequestParam(defaultValue = "") String soru, Model model) {
		if (soru.equals("")) {
			model.addAttribute("hata", "lütfen soru oluþturma alanýný doldurunuz!");
		} else {

			try {
				PreparedStatement prs = db.preConnect("call s_ekle (?)");
				prs.setString(1, soru);
				prs.executeUpdate();

			} catch (Exception e) {
				System.out.println("ekleme hatasý" + e);
			}

		}
		List<SorularPro> sp = soruDoldur();
		if (sp.size() > 0) {
			model.addAttribute("sList", sp);
		}

		return "home";
	}

	@RequestMapping(value = "/sil/{id}", method = RequestMethod.GET)
	public String silme(@PathVariable String id, Model model) {
		List<SorularPro> soruList = soruDoldur();
		try {
			PreparedStatement prs = db.preConnect("call soru_sil(?)");
			prs.setInt(1, Integer.valueOf(id));
			int sonuc = prs.executeUpdate();
			if (sonuc > 0)
				System.out.println("silme basarili");
			

		} catch (Exception e) {

		}
		model.addAttribute("sList", soruList);
		return "redirect:/sinavolustur";
	}

	@RequestMapping(value = "/cevap_ekle", method = RequestMethod.GET)
	public String acil() {
		return "cevap_ekle";
	}

	@RequestMapping(value = "/cevap_ekle/{id}", method = RequestMethod.GET)
	public String acil2(@PathVariable String id, Model model) {
		List<CevaplarPro> cvpList = cevapDoldur(id);

		if (cvpList.size() >= 0) {
			model.addAttribute("cvpList", cvpList);
			model.addAttribute("soruid", id);
			System.out.println("cevap gonderme basarili");
		}
		return "cevap_ekle";
	}

	Db db = new Db("question_create", "root", "");

	public List<SorularPro> soruDoldur() {
		List<SorularPro> soruLs = new ArrayList<SorularPro>();
		try {
			String query = "select * from sorular";
			ResultSet rs = db.connect().executeQuery(query);

			while (rs.next()) {
				SorularPro sp = new SorularPro();
				sp.setSoru_id(rs.getString("" + soruEnum.soru_id));
				sp.setSoru(rs.getString("" + soruEnum.soru));
				// sp.setCevap(rs.getString(""+soruEnum.cevap));

				soruLs.add(sp);

			}
		} catch (Exception e) {
			System.err.println("soru doldurma hatasi :" + e);
		}

		return soruLs;
	}

	public List<CevaplarPro> cevapDoldur(String gelenId) {
		List<CevaplarPro> cevapLs = new ArrayList<CevaplarPro>();
		try {
			PreparedStatement prs = db.preConnect("call cevaplarSelect(?)");
			prs.setString(1, gelenId);
			ResultSet rs = prs.executeQuery();
			while (rs.next()) {
				CevaplarPro cp = new CevaplarPro();

				cp.setSoru(rs.getString("" + cevapEnum.soru));
				cp.setCsoru_id(rs.getString("" + cevapEnum.csoru_id));
				cp.setCevap(rs.getString("" + cevapEnum.cevap));
				cp.setCevap_id(rs.getString("" + cevapEnum.cevap_id));
				cp.setDurum(rs.getString("" + cevapEnum.durum));

				System.out.println(rs.getString(2));
				cevapLs.add(cp);

			}
		} catch (Exception e) {
			System.err.println("cevap doldurma hatasi :" + e);
		}

		return cevapLs;
	}
	
	
	

}
