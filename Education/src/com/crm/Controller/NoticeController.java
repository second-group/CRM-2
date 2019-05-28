package com.crm.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.entity.Fenye;
import com.crm.entity.Notice;
import com.crm.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private Fenye<Notice> fenye;
	
	@RequestMapping(value="/SelectNotice",method=RequestMethod.POST)
	@ResponseBody
	private Fenye<Notice> SelectNotice(Integer page,Integer rows,Notice notice){
		
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setNotice(notice);
		return noticeService.SelectNoticeAll(fenye);
	}
	
	@RequestMapping(value="/UpdateNotice",method=RequestMethod.POST)
	@ResponseBody
	private Integer UpdateNotice(Notice notice) {
		
		return noticeService.UpdateNotice(notice);
	}
}
