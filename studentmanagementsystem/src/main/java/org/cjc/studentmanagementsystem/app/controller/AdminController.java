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
	
	@RequestMapping("/search")
	public String searchStudent(@RequestParam("batchNumber") String batchNumber, Model m) {
		List<Student> list = ssi.searchStudentByBatch(batchNumber);
		if (list.size() > 0) {
			m.addAttribute("data", list);

		} else {
			List<Student> ls = ssi.viewStudent();
			m.addAttribute("data", ls);
			m.addAttribute("message", "Student not found for:" + batchNumber);

		}
		return "adminscreen";

	}
	@RequestMapping("/fees")
	public String onFees(@RequestParam("id") int id,Model m) {
		Student s=ssi.getSingleStudent(id);
		m.addAttribute("st", s);
		return "fees";
		
	}
	
	@RequestMapping("/payfees")
	public String payFees(@RequestParam("studentid") int id,@RequestParam("ammount") int amt,Model m) {
		List<Student> list=ssi.payFees(id,amt);
		m.addAttribute("data", list);	
		return "adminscreen";
	}
	@RequestMapping("/remove")
	public String removeStudent(@RequestParam("id") int id,Model m) {
		List<Student> list=ssi.removeStudent(id);
		m.addAttribute("data", list);
		return "adminscreen";
		
	}
	@RequestMapping("/batch")
	public String onBatch(@RequestParam("id") int id,Model m) {
		Student s=ssi.getSingleStudent(id);
		m.addAttribute("st", s);
		return "onbatch";
	}
	
	@RequestMapping("/changeBatch")
	public String changeBatch(@RequestParam("studentId") int id,@RequestParam("batchNumber") String batchNumber,@RequestParam("batchMode") String bmode,Model m) {
		List<Student> list=ssi.changeBatch(id,batchNumber,bmode);
		m.addAttribute("data", list);
		return "adminscreen";
	}
	


}
