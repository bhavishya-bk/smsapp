package org.cjc.studentmanagementsystem.app.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.cjc.studentmanagementsystem.app.model.Student;
import org.cjc.studentmanagementsystem.app.repository.StudentRepo;
import org.cjc.studentmanagementsystem.app.servicei.StudentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public List<Student> searchStudentByBatch(String batchNumber,String bmode) {
		List<Student> ls=sr.findAllByBatchNumberAndBatchMode(batchNumber,bmode);
		return ls;
	}

	@Override
	public Student getSingleStudent(int id) {
		
		return sr.findById(id).get();
	}

	@Override
	public List<Student> payFees(int id, int amt) {
		Optional<Student> byId = sr.findById(id);
		if(byId.isPresent()) {
			Student s = byId.get();
			s.setFeesPaid(s.getFeesPaid()+amt);
			sr.save(s);
			List<Student> all = sr.findAll();
			return all;
		}
		return null;
		
	}

	@Override
	public List<Student> removeStudent(int id) {
		sr.deleteById(id);
		return sr.findAll();
	}

	@Override
	public List<Student> changeBatch(int id,String batchNumber,String bmode) {
		Optional<Student> byId = sr.findById(id);
		if(byId.isPresent()) {
			Student s = byId.get();
			s.setBatchNumber(batchNumber);
			s.setBatchMode(bmode);
			sr.save(s);
			
		}
		return sr.findAll();
	}

	@Override
	public List<Student> paging(int pageNo, int pageSize) {
		Pageable pg=PageRequest.of(pageNo, pageSize,Sort.by("studentFullName").ascending() );
		List<Student> list = sr.findAll(pg).getContent();
		
		return list;
	}

}
