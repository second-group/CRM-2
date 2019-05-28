package com.crm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Askers;
import com.crm.entity.Students;
import com.crm.service.AskersService;
import com.crm.service.StudentsService;
import com.crm.util.Result;

@Controller
public class AskersController {
@Autowired
	private AskersService service;
@Autowired
	private StudentsService studentsService;
	@RequestMapping(value="/insertAskers",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertAskers(Askers askers,String s_id,String s_content,String u_loginname) {
		System.out.println(u_loginname);
		String[] s_id1 = s_id.split(",");
 		String[] split23=s_content.split(",");
 		Integer total=0;
 		for(int i=0;i<s_id1.length;i++) {
 			askers.setA_studentid(Integer.parseInt(s_id1[i]));
 			askers.setA_bakcontent(split23[i]);
 			total=service.insertAskers(askers);
 		}
 		Students students=new Students();
 		
 		if(total>0) {
 			for(int j=0;j<s_id1.length;j++) {
 				students.setS_zixunname(u_loginname);
 				System.out.println(students.getS_zixunname()+"controller");
 	 			students.setS_id(Integer.parseInt(s_id1[j]));
 	 			System.out.println(Integer.parseInt(s_id1[j])+"SID");
 	 			Integer size= studentsService.updateStudent(students);
 	 			System.out.println("这是修改student表"+size);
 	 		}
 		}
		return total;
	}
	@RequestMapping(value="/ZiDongFenLiang",method=RequestMethod.POST)
	@ResponseBody
	public String ZiDongFenLiang(Askers askers,@RequestParam("thisValue")Boolean thisValue) {
		System.out.println(thisValue+"状态");
		if(thisValue) {
			service.selectStudentsAskers(askers);
			return Result.toClient(true, "分配成功");
		}
			return Result.toClient(false, "分配失败");
		
		
		
	}
}
