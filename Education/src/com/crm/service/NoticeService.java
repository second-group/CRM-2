package com.crm.service;


import com.crm.entity.Fenye;
import com.crm.entity.Notice;

public interface NoticeService {
	/**
	 * 分页查询
	 * @param fenye
	 * @return
	 */
	Fenye<Notice> SelectNoticeAll(Fenye<Notice> fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer SelectNoticeCount(Fenye<Notice> fenye);
	/**
	 * 修改状态
	 * @param no_id
	 * @return
	 */
	Integer UpdateNotice(Notice notice);
}
