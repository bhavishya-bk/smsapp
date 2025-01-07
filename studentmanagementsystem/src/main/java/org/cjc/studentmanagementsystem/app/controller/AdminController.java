package org.cjc.studentmanagementsystem.app.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.cjc.studentmanagementsystem.app.model.Student;
import org.cjc.studentmanagementsystem.app.servicei.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value = "/enroll_student",method=RequestMethod.POST)
	public String addStudent(@RequestParam("studentFullName") String name,@RequestParam("studentEmail") String email,
			@RequestParam("studentAge") int age,@RequestParam("studentCollegeName") String cname,
			@RequestParam("studentCourse") String course,@RequestParam("batchNumber") String batch,
			@RequestParam("batchMode") String mode,@RequestParam("feesPaid") int fees,MultipartFile photo
			,Model m) throws IOException {
		
		Student s=new Student();
		s.setStudentFullName(name);
		s.setStudentEmail(email);
		s.setStudentAge(age);
		s.setStudentCollegeName(cname);
		s.setStudentCourse(course);
		s.setBatchNumber(batch);
		s.setBatchMode(mode);
		
		System.out.println(photo.getOriginalFilename());
		
		String image=Base64.getEncoder().encodeToString(photo.getBytes());
		s.setPhoto(image);
		
	
		List<Student> list=ssi.addStudent(s);
		
		m.addAttribute("data", list);
		return "adminscreen";
		
		 
	}
	
	@RequestMapping("/search")
	public String searchStudent(@RequestParam("batchNumber") String batchNumber,@RequestParam("batchMode") String bmode,Model m) {
		List<Student> list = ssi.searchStudentByBatch(batchNumber,bmode);
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
	
	@RequestMapping("/paging")
	public String paging(@RequestParam("pageNo") int pageNo,Model m) {
		List<Student> list=ssi.paging(pageNo,3);
		m.addAttribute("data", list);
		
		return "adminscreen";
	}
	


}
