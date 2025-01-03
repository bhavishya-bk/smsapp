package org.cjc.studentmanagementsystem.app.servicei;

import java.util.List;

import org.cjc.studentmanagementsystem.app.model.Student;

public interface StudentServiceI {

public	List<Student> addStudent(Student s);

public List<Student> viewStudent();

public List<Student> searchStudentByBatch(String batchNumber, String bmode);

public Student getSingleStudent(int id);

public List<Student> payFees(int id, int amt);

public List<Student> removeStudent(int id);

public List<Student> changeBatch(int id, String batchNumber, String bmode);

}
