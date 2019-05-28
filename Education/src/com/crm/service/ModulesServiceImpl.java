package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.ModulesMapper;
import com.crm.dao.UsersMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Users;
import com.crm.util.TreeModel;
import com.crm.util.TreeNode;
@Service
public class ModulesServiceImpl implements ModulesService{
	@Autowired
	private ModulesMapper modulesMapper;
	@Override
	public ArrayList<TreeModel> selectModules(Users users) {
		// TODO Auto-generated method stub
		List<Modules> mod=modulesMapper.selectModules(users);
		ArrayList<TreeModel> root = new ArrayList<>();
		ArrayList<TreeModel> tree = new ArrayList<>();
		   for (Modules mod1:mod) {
			   TreeModel node = new TreeModel();
			   node.setId(mod1.getM_id());
               node.setText(mod1.getM_name());             
               node.setM_parentid(mod1.getM_parentid());
               node.setM_path(mod1.getM_path());
               tree.add(node);
		   }
		   root = TreeNode.getTree(tree); 
		return root;		
	}
	@Override
	public ArrayList<TreeModel> selectModulesAll() {
		// TODO Auto-generated method stub
		List<Modules> mod=modulesMapper.selectModulesAll();
		ArrayList<TreeModel> root = new ArrayList<>();
		ArrayList<TreeModel> tree = new ArrayList<>();
		   for (Modules mod1:mod) {
			   TreeModel node = new TreeModel();
			   node.setId(mod1.getM_id());
               node.setText(mod1.getM_name());             
               node.setM_parentid(mod1.getM_parentid());
               node.setM_path(mod1.getM_path());
               tree.add(node);
		   }
		   root = TreeNode.getTree(tree); 
		return root;	
	}
	@Override
	public Integer insertModules(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.insertModules(modules);
	}
	@Override
	public List<Modules> selectModulesExict(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.selectModulesExict(modules);
	}
	@Override
	public Integer deleteModules(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.deleteModules(modules);
	}
	@Override
	public Modules selectModulesById(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.selectModulesById(modules);
	}
	@Override
	public Integer updateModules(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.updateModules(modules);
	}
	@Override
	public Users selectUsersByLogin(Users users) {
		// TODO Auto-generated method stub
		return modulesMapper.selectUsersByLogin(users);
	}
	@Override
	public List<Modules> selectRoleModulesAll() {
		// TODO Auto-generated method stub
		return modulesMapper.selectModulesAll();
	}
	@Override
	public List<RoleModules> selectRoleModulesExict(Integer m_id) {
		// TODO Auto-generated method stub
		return modulesMapper.selectRoleModulesExict(m_id);
	}
	
}
