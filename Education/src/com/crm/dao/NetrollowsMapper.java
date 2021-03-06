package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Netrollows;

public interface NetrollowsMapper {
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	List<Netrollows> SelectNet(Fenye<Netrollows> fenye);
	/**
	 * 多条件分页查询总条数
	 * @param fenye
	 * @return
	 */
	
	Integer SelectNetCount(Fenye<Netrollows> fenye);
	
	Integer InsertNet(Netrollows netrollows);
	/**
	 * 咨询师经理查询所有的回访记录
	 * @param fenye
	 * @return
	 */
	List<Netrollows> selectNet(Fenye<Netrollows> fenye);
	
	/**
	 * 查询所有跟踪条数
	 */
	Integer SelectNetALLCount(Fenye<Netrollows> fenye);
}
