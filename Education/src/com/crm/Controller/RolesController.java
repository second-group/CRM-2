package com.crm.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Modules;
import com.crm.entity.RoleModules;
import com.crm.entity.Roles;
import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.RolesService;
import com.crm.util.TreeModel;
import com.crm.util.TreeNode;

@Controller
public class RolesController {
	@Autowired
	private RolesService rolesService;
	@Autowired
	private ModulesService modulesService;
	@RequestMapping(value="/selectRolesAll",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> selectRolesAll(Fenye<Roles> fenye,Integer page,Integer rows){
		fenye.setPage(((page-1)*rows));
		fenye.setPageSize(rows);
		return rolesService.selectRolesAll(fenye);
		
	}
	
	
	@RequestMapping(value="/selectRolesExict",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRolesExict(Roles roles){
		/*System.out.println(rolesService.selectRolesExict(roles)+"roles");*/
		return rolesService.selectRolesExict(roles);
		
	}
	
	@RequestMapping(value="/insertRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRoles(Roles roles){
		
		return rolesService.insertRoles(roles);
		
	}
	
	@RequestMapping(value="/updateRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRoles(Roles roles){
		
		return rolesService.updateRoles(roles);
		
	}
	
	
	@RequestMapping(value="/deleteRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteRoles(Roles roles){
		
		return rolesService.deleteRoles(roles);
		
	}
	
	@RequestMapping(value="/selectRolesModules",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectRolesModules(Roles roles) {
		ArrayList<TreeModel> totalList=modulesService.selectModulesAll();
		ArrayList<TreeModel> Roleslist=rolesService.selectRolesModules(roles);		
/*		System.out.println(TreeNode.checkTree(totalList, Roleslist));
		System.out.println(totalList+"分配角色权限");*/
		return TreeNode.checkTree(totalList, Roleslist);
		
	}
	
	
	
	@RequestMapping(value="/insertRolesModules",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRolesModules(RoleModules roleModules){
	/*	System.out.println(roleModules+"548454894687456465496");
		for(int i=2;i>0;i--) {
			rolesService.insertRolesModules(roleModules);
		}*/
		return rolesService.insertRolesModules(roleModules);
		
	}
}
