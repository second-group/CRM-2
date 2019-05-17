package com.crm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.UserChaecksMapper;
import com.crm.entity.Fenye;
import com.crm.entity.UserChaecks;
@Service
public class UserChaecksServiceImp  implements UserChaecksService{
	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private UserChaecksMapper mapper;
	@Override
	public Fenye<UserChaecks> selectAllUserchaecks(Fenye<UserChaecks> fenye) {
		List<UserChaecks> selectAllChaeck = mapper.selectAllChaeck(fenye);
		Integer selectUserChecksTotal = mapper.selectUserChecksTotal(fenye);
		fenye.setTotal(selectUserChecksTotal);
		fenye.setRows(selectAllChaeck);
		return fenye;
	}
	@Override
	public Integer updateUserchaecks(UserChaecks chaecks) {
		Date date = new Date();
		
		String uc_checkouttime = format.format(date);
		chaecks.setUc_checkouttime(uc_checkouttime);
		return mapper.updateUserChaecks(chaecks);
	}
	@Override
	public Integer insertUserchaecks(UserChaecks chaecks) {
		Date date=new Date();
		String uc_checkintime = format.format(date);
		chaecks.setUc_checkintime(uc_checkintime);
		
		return mapper.insertUserChecks(chaecks);
	}

}
