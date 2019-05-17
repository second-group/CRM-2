package com.crm.service;

import com.crm.entity.Fenye;
import com.crm.entity.UserChaecks;

public interface UserChaecksService {
	//查询所有的签到记录
	Fenye<UserChaecks> selectAllUserchaecks(Fenye<UserChaecks> fenye);
	Integer updateUserchaecks(UserChaecks chaecks);
	Integer insertUserchaecks(UserChaecks chaecks);
}
