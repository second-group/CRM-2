package com.crm.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Users;
import com.crm.service.ModulesService;
import com.crm.service.UsersService;
import com.crm.util.TreeModel;

@Controller
public class ModulesController {
	@Autowired
	private ModulesService modulesService;
	@Autowired
	private UsersService usersService;
	@RequestMapping(value="/ModulesAll",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectModules(Users users) {
		System.out.println(users);
		System.out.println(modulesService.selectModules(users)+"13216546");
		/*List<Modules> mod=modulesService.selectModules();
		ArrayList<TreeModel> root = new ArrayList<>();
		ArrayList<TreeModel> tree = new ArrayList<>();
		   for (Modules mod1:mod) {
			   TreeModel node = new TreeModel();
			   node.setId(mod1.getM_id());
               node.setText(mod1.getM_name());             
               node.setM_parentid(mod1.getM_parentid());
               tree.add(node);
		   }
		   root = TreeNode.getTree(tree); */
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		users.setU_lastlogintime(df.format(new Date()));
		usersService.updateUsersU_lastlogintime(users);
		return modulesService.selectModules(users);	
}
}
