package com.crm.service;

import com.crm.entity.Fenye;
import com.crm.entity.Students;

public interface StudentsService {
	Fenye<Students> selectStu(Fenye<Students> fenye);
	
	Integer deleteStu(Integer s_id);
	
	Integer updateStu(Students students);
	
	Integer insertStu(Students students);
}
