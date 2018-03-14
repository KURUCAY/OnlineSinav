package com.sinav.soru;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Properties.SonucPro;
import Utils.Db;

@Controller
public class sonucController {

	Db db=new Db("question_create","root","");
	
	//sonuc ekraný 
	@RequestMapping(value="/sonuc" ,method=RequestMethod.GET)
	public String sonuc(Model model) {
		
		int kisiID=SinavController.kisiID;
		List<SonucPro> sonucList=new ArrayList<SonucPro>();
		try {

			ResultSet rs=db.connect().executeQuery("call sonuc_select('"+kisiID+"')");
			while(rs.next()){
				SonucPro sonucp=new SonucPro();
				sonucp.setCevap(rs.getString(1));
				sonucp.setSoru(rs.getString(3));
				sonucp.setAd(rs.getString(2));
				sonucp.setDurum(rs.getString(4));
				sonucList.add(sonucp);
				
			
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("sonucList", sonucList);
		
		
		return "sonuc";
	}
	
	
	
	
}
