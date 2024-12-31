package org.cjc.studentmanagementsystem.app.repository;

import org.cjc.studentmanagementsystem.app.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepo extends JpaRepository<Student,Integer> {

}
