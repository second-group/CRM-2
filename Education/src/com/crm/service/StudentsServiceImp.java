package com.crm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.StudentsMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Students;

@Service
public class StudentsServiceImp implements StudentsService {
	@Resource
	private StudentsMapper studentsMapper;

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
}
