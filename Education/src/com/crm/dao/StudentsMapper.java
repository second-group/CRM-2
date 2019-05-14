package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Students;

public interface StudentsMapper {
	List<Students> selectStu(Fenye<Students> fenye);
	
	Integer selectCount(Fenye<Students> fenye);
	
	Integer deleteStu(Integer s_id);
	
	Integer updateStu(Students students);
	
	Integer insertStu(Students students);
	
	//咨询师经理
	List<Students> selectStudent(Fenye<Students> fenye);
	
	Integer selectStudentTotal(Fenye<Students> fenye);
	
	Integer updateStudent(Students  students);
	
}
