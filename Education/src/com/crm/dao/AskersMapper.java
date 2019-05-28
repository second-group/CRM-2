package com.crm.dao;

import java.util.List;

import com.crm.entity.Askers;
import com.crm.entity.Fenye;
import com.crm.entity.Students;

public interface AskersMapper {
	/**
	 * 查询所有未分配学生
	 * @return
	 */
	List<Students> selectStudentsAskers();
	/**
	 * 
	 * 添加分量
	 * @param askers
	 * @return
	 */
	Integer insertAskers(Askers askers);
	/**
	 * 修改分量
	 * @param askers
	 * @return
	 */
	Integer updateAskers(Askers askers);
	/**
	 * 分页查询所有分量
	 * @param fenye
	 * @return
	 */
	List<Askers> selectAllAskers(Fenye<Askers> fenye);
	/**
	 * 分页查询所有分量总条数
	 * @param fenye
	 * @return
	 */
	Integer selectAllAskersAll(Fenye<Askers> fenye);
}
