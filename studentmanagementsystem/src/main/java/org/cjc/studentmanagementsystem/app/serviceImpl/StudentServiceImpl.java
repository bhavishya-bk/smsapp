package org.cjc.studentmanagementsystem.app.serviceImpl;

import java.util.List;

import org.cjc.studentmanagementsystem.app.model.Student;
import org.cjc.studentmanagementsystem.app.repository.StudentRepo;
import org.cjc.studentmanagementsystem.app.servicei.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentServiceI{
	@Autowired
	StudentRepo sr;

	@Override
	public List<Student> addStudent(Student s) {
		sr.save(s);
		return sr.findAll();
	}

	@Override
	public List<Student> viewStudent() {
		return sr.findAll();
	}

}
