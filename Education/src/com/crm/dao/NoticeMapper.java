package com.crm.dao;

import java.util.List;

import com.crm.entity.Fenye;
import com.crm.entity.Notice;

public interface NoticeMapper {
	/**
	 * 分页查询
	 * @param fenye
	 * @return
	 */
	List<Notice> SelectNoticeAll(Fenye<Notice> fenye);
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
