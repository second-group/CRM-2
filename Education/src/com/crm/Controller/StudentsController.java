package com.crm.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Askers;
import com.crm.entity.Fenye;
import com.crm.entity.Pop_bigData;
import com.crm.entity.Students;
import com.crm.entity.Users;
import com.crm.service.AskersService;
import com.crm.service.StudentsService;
import com.crm.service.UsersService;
import com.google.gson.Gson;

@Controller
public class StudentsController {
	@Autowired
	private StudentsService studentsService;
	@Autowired
	private Fenye<Students> fenye;
	@Autowired
	private UsersService usersService;
	@Autowired
	private AskersService askersService;
	@RequestMapping(value="/stuss",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Students> Stus(Fenye<Students> fenye,Integer rows,Integer page) {
		
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		Fenye<Students> selectStu = studentsService.selectStu(fenye);
		return selectStu;	
	}
	
	@RequestMapping(value="/deletestus",method=RequestMethod.POST)
	@ResponseBody
	public Integer deletestus(Integer s_id) {
		/*System.out.println(s_id);*/
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
	/*	List<Askers> as = askersService.selectAskersAll();
		List<Users> uu=usersService.selectUsersAll();*/
		/*List<Askers> as=askersService.selectAskersAll();*/
	/*	for(int i =0;i<as.size();i++){
            //如果第一个和最后一样多从新从第一个开始
            if(as.get(0).size()==as.get(as.size()-1).size()){
            	System.out.println(as.get(i).get(i).getA_userid());
                break;
            }
            //如果最后一个直接添加
            else if(i == as.size()-2){
            	System.out.println(as.get(i).get(i).getA_userid());
            	as.get(as.size()-1).add(o);
            }
            //如果前一个比后一样多则放在后一个里面
            else{
                if(as.get(i).size()>as.get(i+1).size()){
                	System.out.println(as.get(i).get(i).getA_userid());
                	as.get(i+1).add(o);
                }
            }
        }*/
		/*c:for(int i =0;i<as.size();i++){
            //如果第一个和最后一样多从新从第一个开始
           b:for(int j=0;j<uu.size();j++) {
        	   if(as.get(i).getA_userid()!=uu.get(j).getU_id()) {
        		   
        			   System.out.println(uu.get(j).getU_id()+"分配的用户id");
        			   if() {
        				   
        			   }
        			   continue;
        			        		         		  
        	   }else {
        		  
        			   System.out.println(uu.get(j).getU_id()+"分配的用户idelseif");
        			   continue;
        		   
        		   
        	   }
           }
            
        }*/
		/*Map<String,List<String>> allot=new ConcurrentHashMap<String,List<String>>(); //保存分配的信息
		if(uu!=null&&uu.size()>0&&as!=null&&as.size()>0){	
			for(int i=0;i<uu.size();i++){				
				int j=i%uu.size();
				System.out.println(j+"j的值");
				if(uu.get(i).getU_id().equals(as.get(i).getA_userid())){				
					List<String> list=allot.get(uu.get(j));
					System.out.println(uu.get(i)+"if中的");
					list.add(as.get(i));				
					allot.put(uu.get(j), list);		
				}else{				
						List<String> list=new ArrayList<String>();	
						System.out.println(uu.get(i)+"else中的");
						list.add(as.get(i));				
						allot.put(as.get(j), list);		
					 }		
		   }  
	   }*/
	
		return studentsService.insertStu(students);
	}
	

	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Students> selectStudent(Fenye<Students> fenye,Integer rows,Integer page,Students students) {
		fenye.setStudents(students);
		System.out.println(fenye.getStudents());
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);	
		System.out.println(studentsService.selectStudent(fenye)+"测试玩的");
		return studentsService.selectStudent(fenye);	
	}

	
	@RequestMapping(value="/SelectStu",method=RequestMethod.POST)
	@ResponseBody
	private Fenye<Students> SelectStu(Integer page,Integer rows,Students students,Users users){
		fenye.setUsers(users);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setStudents(students);
		return studentsService.SelectStu(fenye);
	}
	
	@RequestMapping(value="/UpdateStu",method=RequestMethod.POST)
	@ResponseBody
	private Integer UpdateStu(Students students) {
		
		return studentsService.UpdateStu(students);
	}
	@RequestMapping(value="/UpdateStuent",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStudent(Students students,String ids) {
		Integer updat=0;
		if(ids!=null && ids!="") {
			String[] split = ids.split(",");
			
			for(int i=0;i<split.length;i++) {
				students.setS_id(Integer.parseInt(split[i]));
				updat=studentsService.updateStudent(students);
			}
		}else {
			updat=studentsService.updateStudent(students);
		}
		return updat;
	}
	@RequestMapping(value="/students",method = RequestMethod.GET)
	public String students() {
		return "students";
	}
	@RequestMapping(value="/kh",method = RequestMethod.GET)
	public String kh() {
		return "kh";
	}
	@RequestMapping(value="/studen",method = RequestMethod.GET)
	public String studen() {
		return "studen";
	}
	@RequestMapping(value="/kehufenpe",method = RequestMethod.GET)
	public String kehufenpei() {
		return "kehufenpe";
	}
	@RequestMapping(value="selectAllNotAskers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Students> selectAllNotAskers(Integer page,Integer rows) {
			fenye.setPage((page-1)*rows);
			fenye.setPageSize(rows);
		return studentsService.selectStudenteNotAsker(fenye); 
	}

	
	@RequestMapping(value="SelectTongJi",method=RequestMethod.POST)
	@ResponseBody
	public String SelectTongJi(HttpServletRequest request, HttpServletResponse response) {
		List list = new ArrayList();
		List<Students> popSourceList=studentsService.SelectTongJi();		
		for(int i=0;i<popSourceList.size();i++){
			Students students=new Students();
			students.setS_msgsource(popSourceList.get(i).getS_msgsource());
			 Integer countSex = studentsService.selectTongJiCount(students);
			 Pop_bigData pop_bigData = new Pop_bigData(countSex,popSourceList.get(i).getS_msgsource());
			 list.add(pop_bigData);
		}		
			Gson gson=new Gson();
			String data=gson.toJson(list);
	        System.out.println("data:"+data);
	        return data;
	}
}
