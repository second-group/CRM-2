package com.crm.service;

import java.util.ArrayList;

import com.crm.entity.Users;
import com.crm.util.TreeModel;

public interface ModulesService {
	ArrayList<TreeModel> selectModules(Users users);
}
