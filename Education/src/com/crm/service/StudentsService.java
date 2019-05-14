package com.crm.service;

import com.crm.entity.Fenye;
import com.crm.entity.Students;

public interface StudentsService {
	Fenye<Students> selectStu(Fenye<Students> fenye);
	
	Integer deleteStu(Integer s_id);
	
	Integer updateStu(Students students);
	
	Integer insertStu(Students students);
<<<<<<< HEAD
	
	Fenye<Students> selectStudent(Fenye<Students> fenye);
=======
	//以下是咨询师
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	Fenye<Students> SelectStu(Fenye<Students> fenye);
	
	
	
	/**
	 * 修改
	 * @param students
	 * @return
	 */
	Integer UpdateStu(Students students);
>>>>>>> master
}
