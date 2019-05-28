package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Students;

public interface StudentsMapper {
	//下面是网络咨询师
	List<Students> selectStu(Fenye<Students> fenye);
	
	Integer selectCount(Fenye<Students> fenye);
	
	Integer deleteStu(Integer s_id);
	
	Integer updateStu(Students students);
	
	Integer insertStu(Students students);

	
	//咨询师经理
	List<Students> selectStudent(Fenye<Students> fenye);
	
	Integer selectStudentTotal(Fenye<Students> fenye);
	
	Integer updateStudent(Students  students);
	/**
	 * 查询所有等待分配的客户
	 * @return
	 */
	List<Students> selectStudenteNotAsker(Fenye<Students> fenye);
	Integer selectStudenteNotAskerTotal(Fenye<Students> fenye);

	//下面是咨询师
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	List<Students> SelectStu(Fenye<Students> fenye);
	/**
	 * 多条件分页查询总条数
	 * @param fenye
	 * @return
	 */
	
	Integer SelectStuCount(Fenye<Students> fenye);
	
	
	/**
	 * 修改
	 * @param students
	 * @return
	 */
	Integer UpdateStu(Students students);
	
	List<Students> SelectTongJi();
	Integer selectTongJiCount(Students students);
}
