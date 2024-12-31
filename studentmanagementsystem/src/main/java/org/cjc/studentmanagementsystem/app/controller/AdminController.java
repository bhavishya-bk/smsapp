package org.cjc.studentmanagementsystem.app.controller;

import java.util.List;

import org.cjc.studentmanagementsystem.app.model.Student;
import org.cjc.studentmanagementsystem.app.servicei.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Autowired
	StudentServiceI ssi;
	
	@RequestMapping("/")
	public String prelogin() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam("username") String u,@RequestParam("password") String p,Model m) {
		if(u.equals("admin@gmail.com") && p.equals("admin123")){
			List<Student> list=ssi.viewStudent();
			m.addAttribute("data", list);
			return "adminscreen";
			
			
		}
		else {
			m.addAttribute("loginfail", "Enter valid login Details");
			return "login";
		}
		
		
		
	}
	
	@RequestMapping("/enroll_student")
	public String addStudent(@ModelAttribute Student s,Model m) {
		List<Student> list=ssi.addStudent(s);
		
		m.addAttribute("data", list);
		return "adminscreen";
		
		 
	}
	
	public String searchStudent() {
		return "adminscreen";
	}

}
