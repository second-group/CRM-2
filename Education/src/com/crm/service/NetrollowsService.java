package com.crm.service;

import com.crm.entity.Fenye;
import com.crm.entity.Netrollows;

public interface NetrollowsService {
	
	Fenye<Netrollows> SelectNet(Fenye<Netrollows> fenye);
	
	Integer InsertNet(Netrollows netrollows);
	
	Fenye<Netrollows> selectNet(Fenye<Netrollows> fenye);
	
	
}
