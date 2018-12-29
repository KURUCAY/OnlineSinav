package com.sinav.soru;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Properties.CevaplarPro;
import Utils.Db;

@Controller
@RequestMapping("/cevaplar")
public class CevapController {

	Db db = new Db("question_create", "root", "");


HomeController hm=new HomeController();


	


	
	
	
@RequestMapping (value="/cevapsil/{id}",method=RequestMethod.GET)
public String cevapSil(@PathVariable String id ,Model model ) {
	
	try {
			PreparedStatement prs=db.preConnect("call cevapSil(?)");
			prs.setString(1, id);
			int sonuc=prs.executeUpdate();
			if(sonuc>0)
			{
				if(sonuc>0)
				{
					List<CevaplarPro> cpList = hm.cevapDoldur(id);
					
						model.addAttribute("cvpList", cpList);
					
				}
			}
		
		} catch (Exception e) {
		System.out.println("cevap silme i�lemi basarisiz+"+e);
		}
	
	
		
		return "redirect:/cevap_ekle/"+id;
	}


@RequestMapping (value= "/cevap/{id}",method=RequestMethod.POST)
public String cevapEkle(@RequestParam (defaultValue="")String cevaps,
		@RequestParam String cevapt ,@PathVariable String id,Model model){
	
	try {
		System.out.println("zcfzdfa");
		PreparedStatement prs=db.preConnect("call cevpekle(?,?,?)");
		prs.setString(1, id);
		prs.setString(2, cevapt);
		prs.setString(3, cevaps);
	int sonuc=	prs.executeUpdate();
		if(sonuc>0)
		{
			List<CevaplarPro> cpList = hm.cevapDoldur(id);
			
				model.addAttribute("cvpList", cpList);
			
	
		}
		
	} catch (Exception e) {
		System.out.println("cevap ekleme hatas�"+e);
	}
	
	
	return "redirect:/cevap_ekle/{id}";
}



	
	
	
	

}
