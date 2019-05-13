package com.crm.dao;

import java.util.List;

import com.crm.entity.Modules;
import com.crm.entity.Users;

public interface ModulesMapper {
	List<Modules> selectModules(Users users);
}
