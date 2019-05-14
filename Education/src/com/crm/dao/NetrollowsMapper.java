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
}
