package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.UserChaecks;

public interface UserChaecksMapper {
	/**
	 * 查询所有签到记录
	 * @param fenye
	 * @return
	 */
	List<UserChaecks> selectAllChaeck(Fenye<UserChaecks> fenye);
	/**
	 * 修改签到表记录
	 * @param chaecks
	 * @return
	 */
	Integer updateUserChaecks(UserChaecks chaecks);
	/**
	 * 添加签到
	 * @return
	 */
	Integer insertUserChecks(UserChaecks userChaecks);
	/**
	 * 分页查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectUserChecksTotal(Fenye<UserChaecks> fenye);
	
	List<UserChaecks> selectqiandao(UserChaecks chaecks);
}
