package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.RolesMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.util.TreeModel;
import com.crm.util.TreeNode;
@Service
public class RolesServiceImpl implements RolesService{
	@Autowired
	private RolesMapper rolesMapper;
	@Override
	public Fenye<Roles> selectRolesAll(Fenye<Roles> fenye) {
		// TODO Auto-generated method stub
		Integer total=rolesMapper.selectRolesCount(fenye);
		List<Roles> rows=rolesMapper.selectRolesAll(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public List<Roles> selectRolesExict(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRolesExict(roles);
	}
	@Override
	public Integer insertRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRoles(roles);
	}
	@Override
	public Integer updateRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}
	@Override
	public Integer deleteRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoles(roles);
	}
	@Override
	public ArrayList<TreeModel> selectRolesModules(Roles roles) {
		// TODO Auto-generated method stub
		List<Modules> mod=rolesMapper.selectRolesModules(roles);
		ArrayList<TreeModel> root = new ArrayList<>();
		ArrayList<TreeModel> tree = new ArrayList<>();
		   for (Modules mod1:mod) {
			   System.out.println(mod1);
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
	public Integer insertRolesModules(RoleModules roleModules) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRolesModules(roleModules);
	}

}
