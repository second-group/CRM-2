package com.crm.Controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.UserChaecks;
import com.crm.service.UserChaecksService;

@Controller
public class UserChaecksController {
	@Autowired
	private UserChaecksService chaecksService;
	@RequestMapping(value="/AllUserchaecks",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectAllUserchaecks(Fenye<UserChaecks> fenye,UserChaecks userChaecks,Integer rows,Integer page){
		fenye.setUserChaecks(userChaecks);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		System.out.println(fenye.getUserChaecks());
		System.out.println(chaecksService.selectAllUserchaecks(fenye));
		Fenye<UserChaecks> selectAllUserchaecks = chaecksService.selectAllUserchaecks(fenye);
		return selectAllUserchaecks;
		
	}
	@RequestMapping(value="/updateUserchaecks",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUserchaecks(UserChaecks chaecks) {
		return chaecksService.updateUserchaecks(chaecks);
	}
	@RequestMapping(value="/insertUserchaecks",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUserchaecks(UserChaecks chaecks) {
		return chaecksService.insertUserchaecks(chaecks);
	}
	@RequestMapping(value="/userscheck",method = RequestMethod.GET)
	public String userscheck() {
		return "userscheck";
	}
}
