package com.crm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Netrollows;
import com.crm.entity.Users;
import com.crm.service.NetrollowsService;

@Controller
public class NetrollowsController {
	@Autowired
	private NetrollowsService netrollowsService;

	@Autowired
	private Fenye<Netrollows> fenye;

	@RequestMapping(value = "/InsertNet", method = RequestMethod.POST)
	@ResponseBody
	private Integer InsertNet(Netrollows netrollows) {

		return netrollowsService.InsertNet(netrollows);
	}

	@RequestMapping(value = "/SelectNet", method = RequestMethod.POST)
	@ResponseBody
	private Fenye<Netrollows> SelectNet(Netrollows netrollows, Integer page, Integer rows) {
		
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setNetrollows(netrollows);
		return netrollowsService.SelectNet(fenye);
	}
	@RequestMapping(value="/genzong",method = RequestMethod.GET)
	public String genzong() {
		return "genzong";
	}
	@RequestMapping(value = "/SelectNetAll", method = RequestMethod.POST)
	@ResponseBody
	private Fenye<Netrollows> SelectNetAll(Netrollows netrollows, Integer page, Integer rows) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setNetrollows(netrollows);
		return netrollowsService.selectNet(fenye);
	}
}
