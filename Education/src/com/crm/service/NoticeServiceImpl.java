package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.dao.NoticeMapper;
import com.crm.entity.Fenye;
import com.crm.entity.Notice;
import com.crm.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	@Override
	public Fenye<Notice> SelectNoticeAll(Fenye<Notice> fenye) {
		Integer selectNoticeCount = noticeMapper.SelectNoticeCount(fenye);
		List<Notice> selectNoticeAll = noticeMapper.SelectNoticeAll(fenye);
		fenye.setRows(selectNoticeAll);
		fenye.setTotal(selectNoticeCount);
		return fenye;
	}

	@Override
	public Integer SelectNoticeCount(Fenye<Notice> fenye) {
		
		return noticeMapper.SelectNoticeCount(fenye);
	}

	@Override
	public Integer UpdateNotice(Notice notice) {
		
		return noticeMapper.UpdateNotice(notice);
	}
	
	@Override
	public Integer insertNotice(Notice Notice) {
		// TODO Auto-generated method stub
		return noticeMapper.insertNotice(Notice);
	}

}
