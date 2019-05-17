package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.NetrollowsMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Netrollows;
@Service
public class NetrollowsServiceImpl implements NetrollowsService {

	@Autowired 
	private NetrollowsMapper netrollowsMapper;
	
	public Integer InsertNet(Netrollows netrollows) {
		
		return netrollowsMapper.InsertNet(netrollows);
	}

	
	public Fenye<Netrollows> SelectNet(Fenye<Netrollows> fenye) {
		List<Netrollows> selectNet = netrollowsMapper.SelectNet(fenye);
		Integer selectNetCount = netrollowsMapper.SelectNetCount(fenye);
		fenye.setRows(selectNet);
		fenye.setTotal(selectNetCount);
		
		return fenye;
	}


	@Override
	public Fenye<Netrollows> selectNet(Fenye<Netrollows> fenye) {
		List<Netrollows> selectNet = netrollowsMapper.selectNet(fenye);
		Integer selectNetCount = netrollowsMapper.SelectNetALLCount(fenye);
		fenye.setRows(selectNet);
		fenye.setTotal(selectNetCount);
		return fenye;
	}

}
