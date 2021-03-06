package com.crm.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.AskersMapper;
import com.crm.dao.StudentsMapper;
import com.crm.entity.Askers;
import com.crm.entity.Fenye;
import com.crm.entity.Students;
import com.crm.entity.Users;

@Service
public class StudentsServiceImp implements StudentsService {
	@Autowired
	private StudentsMapper studentsMapper;
	@Autowired
	private AskersMapper askersMapper;
	@Override
	public Fenye<Students> selectStu(Fenye<Students> fenye) {
		// TODO Auto-generated method stub
		Integer selectCount = studentsMapper.selectCount(fenye);
		List<Students> selectStu = studentsMapper.selectStu(fenye);
		fenye.setRows(selectStu);
		fenye.setTotal(selectCount);
		return fenye;
	}

	@Override
	public Integer deleteStu(Integer sid) {
		// TODO Auto-generated method stub
		return studentsMapper.deleteStu(sid);
	}

	@Override
	public Integer updateStu(Students students) {
		// TODO Auto-generated method stub
		return studentsMapper.updateStu(students);
	}

	@Override
	public Integer insertStu(Students students) {
		// TODO Auto-generated method stub
		return studentsMapper.insertStu(students);
	}


	@Override
	public Fenye<Students> selectStudent(Fenye<Students> fenye) {
		List<Students> selectStudent = studentsMapper.selectStudent(fenye);
		Integer selectStudentTotal = studentsMapper.selectStudentTotal(fenye);
		fenye.setRows(selectStudent);
		fenye.setTotal(selectStudentTotal);
		return fenye;
	}

	
	//以下是咨询师
	public Fenye<Students> SelectStu(Fenye<Students> fenye) {
		List<Students> selectStu = studentsMapper.SelectStu(fenye);
		Integer selectStuCount = studentsMapper.SelectStuCount(fenye);
		fenye.setRows(selectStu);
		fenye.setTotal(selectStuCount);
		return fenye;
	}

	public Integer SelectStuCount(Fenye<Students> fenye) {
		return studentsMapper.SelectStuCount(fenye);
	}
	public Integer UpdateStu(Students students) {
		
		return studentsMapper.UpdateStu(students);
	}

	@Override
	public Integer updateStudent(Students students) {
		/*SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		if(students.getS_firstvisittime()==null) {
			students.setS_firstvisittime(dateFormat.format(new Date()));
		}*/
		Askers askers = new Askers();
		Users users = new Users();
		users.setU_loginname(students.getS_zixunname());
		askers.setUsers(users);
		askers.setA_studentid(students.getS_id());
		askersMapper.updateAskers(askers);
		return studentsMapper.updateStudent(students);
	}

	@Override
	public Fenye<Students> selectStudenteNotAsker(Fenye<Students> fenye) {
		List<Students> selectStudenteNotAsker = studentsMapper.selectStudenteNotAsker(fenye);
		Integer selectStudenteNotAskerTotal = studentsMapper.selectStudenteNotAskerTotal(fenye);
		fenye.setTotal(selectStudenteNotAskerTotal);
		fenye.setRows(selectStudenteNotAsker);
		
		return fenye;
	}

	@Override
	public List<Students> SelectTongJi() {
		// TODO Auto-generated method stub
		return studentsMapper.SelectTongJi();
	}

	@Override
	public Integer selectTongJiCount(Students students) {
		// TODO Auto-generated method stub
		return studentsMapper.selectTongJiCount(students);
	}
}
