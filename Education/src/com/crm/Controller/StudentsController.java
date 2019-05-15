package com.crm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Students;
import com.crm.service.StudentsService;

@Controller
public class StudentsController {
	@Autowired
	private StudentsService studentsService;
	@Autowired
	private Fenye<Students> fenye;

	@RequestMapping(value="/stuss",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Students> Stus(Fenye<Students> fenye,Integer rows,Integer page) {
		System.out.println(page);
		System.out.println(rows);
		System.out.println(fenye);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		Fenye<Students> selectStu = studentsService.selectStu(fenye);
		return selectStu;	
	}
	
	@RequestMapping(value="/deletestus",method=RequestMethod.POST)
	@ResponseBody
	public Integer deletestus(Integer s_id) {
		System.out.println(s_id);
		return studentsService.deleteStu(s_id);
	}
	
	@RequestMapping(value="/updatestu",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatestu(Students students) {
		return studentsService.updateStu(students);	
	}
	
	@RequestMapping(value="/insertStudents",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertStudents(Students students) {
		return studentsService.insertStu(students);
	}
	

	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Students> selectStudent(Fenye<Students> fenye,Integer rows,Integer page,Students students) {
		fenye.setStudents(students);
		System.out.println(fenye.getStudents());
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		
		return studentsService.selectStudent(fenye);	
	}

	
	@RequestMapping(value="/SelectStu",method=RequestMethod.POST)
	@ResponseBody
	private Fenye<Students> SelectStu(Integer page,Integer rows,Students students){
		
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setStudents(students);
		return studentsService.selectStu(fenye);
	}
	
	@RequestMapping(value="/UpdateStu",method=RequestMethod.POST)
	@ResponseBody
	private Integer UpdateStu(Students students) {
		
		return studentsService.UpdateStu(students);
	}
	@RequestMapping(value="/UpdateStuent",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStudent(Students students) {
		return studentsService.updateStudent(students);
	}

}
