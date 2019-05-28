package com.crm.service;

import java.util.List;

import com.crm.entity.Askers;
import com.crm.entity.Students;

public interface AskersService {
	/**
	 * 自动分配
	 * @param askers
	 */
	void selectStudentsAskers(Askers askers);
	/**
	 * 手动分配
	 * @param askers
	 * @return
	 */
	Integer insertAskers(Askers askers);
}
