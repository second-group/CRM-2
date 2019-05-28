package com.crm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.AskersMapper;
import com.crm.dao.StudentsMapper;
import com.crm.dao.UsersMapper;
import com.crm.entity.Askers;
import com.crm.entity.Students;
import com.crm.entity.Users;
@Service
public class AskersServiceImpl implements AskersService{
	@Autowired
	private AskersMapper askersMapper;
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private StudentsMapper studentsMapper;
	@Override
	public void selectStudentsAskers(Askers askers) {
		// TODO Auto-generated method stub
		List<Students> stu=askersMapper.selectStudentsAskers();
		List<Users> us=usersMapper.selectUsersZiXunShi();
		Students students =new Students();
		Users users=new Users();
		int j=0;
		for (int i = 0; i < stu.size(); i++) {
			
			if(j==us.size()) {
				j=0;
				i--;
				continue;
			}else {
				
				askers.setA_studentid(stu.get(i).getS_id());
				askers.setA_userid(us.get(j).getU_id());
				askersMapper.insertAskers(askers);
				/*users.setU_id(us.get(j).getU_id());*/
				System.out.println(us.get(j).getU_loginname()+"naan");
				students.setS_zixunname(us.get(j).getU_loginname());
				students.setS_id(stu.get(i).getS_id());
				/*students.setUsers(users);*/
				
				System.out.println(students+"test");
				studentsMapper.updateStudent(students);
				/*System.out.println(stu.get(i).getS_id()+"学生");
				System.out.println(us.get(j).getU_id());*/
				j++;
			}
			
		}
		
	}
	/*SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/
	
	@Override
	public Integer insertAskers(Askers askers) {
	/*	Date date=new Date();
		String uc_checkintime = format.format(date);
		askers.setA_createtime(uc_checkintime);*/
		return askersMapper.insertAskers(askers);
	}

}
