package com.crm.Controller;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;

import com.crm.entity.Roles;

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
	public Integer insertRolesModules(@RequestParam(value="rm_roleid")Integer rm_roleid,@RequestParam(value="rm_moduleid")String rm_moduleid,HttpServletRequest request){
		String rm=request.getParameter("rm_roleid");
		String rms=request.getParameter("rm_moduleid");
		System.out.println(rm);
		System.out.println(rms);
		System.out.println("我在哪？");	
		return rolesService.insertRolesModules(rm_roleid,rm_moduleid);
		
	}
	@RequestMapping(value="/roles",method = RequestMethod.GET)
	public String roles() {
		return "roles";
	}
}
