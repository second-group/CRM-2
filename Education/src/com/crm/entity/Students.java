package com.crm.entity;

import org.springframework.stereotype.Component;

@Component
/**
 * 学生(客户)资源
 * @author hasee
 *
 */
public class Students {
	private Integer s_id;
	private String s_name;
	private Integer s_age;
	private Integer s_sex;
	private String s_phone;
	private String s_state;
	private String s_msgsource;
	private String s_sourceurl;
	private String s_sourcekeyword;
	private String s_address;
	private String s_qq;
	private String s_weixin;
	private String s_content;
	private String s_createtime;
	private Integer s_isvalid;
	private Integer s_record;
	private Integer s_isreturnvist;
	private String s_firstvisittime;
	private Integer s_ishome;
	private String s_hometime;
	private String s_lostvalid;
	private Integer s_ispay;
	private String s_paytime;
	private Double s_money;
	private Integer s_isreturnmoney;
	private Integer s_isinclass;
	private String s_inclasstime;
	private String s_inclasscontent;
	private Integer s_isdel;
	private String s_frompart;
	private String s_concern;
	private Integer s_isbaobei;
	private Integer s_userid;
	private String s_returnmoneycontent;
	private Double s_premoney;
	private String s_premoneytime;
	public Students(Integer s_id, String s_name, Integer s_age, Integer s_sex, String s_phone, String s_state,
			String s_msgsource, String s_sourceurl, String s_sourcekeyword, String s_address, String s_qq,
			String s_weixin, String s_content, String s_createtime, Integer s_isvalid, Integer s_record,
			Integer s_isreturnvist, String s_firstvisittime, Integer s_ishome, String s_hometime, String s_lostvalid,
			Integer s_ispay, String s_paytime, Double s_money, Integer s_isreturnmoney, Integer s_isinclass,
			String s_inclasstime, String s_inclasscontent, Integer s_isdel, String s_frompart, String s_concern,
			Integer s_isbaobei, Integer s_userid, String s_returnmoneycontent, Double s_premoney,
			String s_premoneytime) {
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.s_age = s_age;
		this.s_sex = s_sex;
		this.s_phone = s_phone;
		this.s_state = s_state;
		this.s_msgsource = s_msgsource;
		this.s_sourceurl = s_sourceurl;
		this.s_sourcekeyword = s_sourcekeyword;
		this.s_address = s_address;
		this.s_qq = s_qq;
		this.s_weixin = s_weixin;
		this.s_content = s_content;
		this.s_createtime = s_createtime;
		this.s_isvalid = s_isvalid;
		this.s_record = s_record;
		this.s_isreturnvist = s_isreturnvist;
		this.s_firstvisittime = s_firstvisittime;
		this.s_ishome = s_ishome;
		this.s_hometime = s_hometime;
		this.s_lostvalid = s_lostvalid;
		this.s_ispay = s_ispay;
		this.s_paytime = s_paytime;
		this.s_money = s_money;
		this.s_isreturnmoney = s_isreturnmoney;
		this.s_isinclass = s_isinclass;
		this.s_inclasstime = s_inclasstime;
		this.s_inclasscontent = s_inclasscontent;
		this.s_isdel = s_isdel;
		this.s_frompart = s_frompart;
		this.s_concern = s_concern;
		this.s_isbaobei = s_isbaobei;
		this.s_userid = s_userid;
		this.s_returnmoneycontent = s_returnmoneycontent;
		this.s_premoney = s_premoney;
		this.s_premoneytime = s_premoneytime;
	}
	public Students() {
		super();
	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public Integer getS_age() {
		return s_age;
	}
	public void setS_age(Integer s_age) {
		this.s_age = s_age;
	}
	public Integer getS_sex() {
		return s_sex;
	}
	public void setS_sex(Integer s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_state() {
		return s_state;
	}
	public void setS_state(String s_state) {
		this.s_state = s_state;
	}
	public String getS_msgsource() {
		return s_msgsource;
	}
	public void setS_msgsource(String s_msgsource) {
		this.s_msgsource = s_msgsource;
	}
	public String getS_sourceurl() {
		return s_sourceurl;
	}
	public void setS_sourceurl(String s_sourceurl) {
		this.s_sourceurl = s_sourceurl;
	}
	public String getS_sourcekeyword() {
		return s_sourcekeyword;
	}
	public void setS_sourcekeyword(String s_sourcekeyword) {
		this.s_sourcekeyword = s_sourcekeyword;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_qq() {
		return s_qq;
	}
	public void setS_qq(String s_qq) {
		this.s_qq = s_qq;
	}
	public String getS_weixin() {
		return s_weixin;
	}
	public void setS_weixin(String s_weixin) {
		this.s_weixin = s_weixin;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_createtime() {
		return s_createtime;
	}
	public void setS_createtime(String s_createtime) {
		this.s_createtime = s_createtime;
	}
	public Integer getS_isvalid() {
		return s_isvalid;
	}
	public void setS_isvalid(Integer s_isvalid) {
		this.s_isvalid = s_isvalid;
	}
	public Integer getS_record() {
		return s_record;
	}
	public void setS_record(Integer s_record) {
		this.s_record = s_record;
	}
	public Integer getS_isreturnvist() {
		return s_isreturnvist;
	}
	public void setS_isreturnvist(Integer s_isreturnvist) {
		this.s_isreturnvist = s_isreturnvist;
	}
	public String getS_firstvisittime() {
		return s_firstvisittime;
	}
	public void setS_firstvisittime(String s_firstvisittime) {
		this.s_firstvisittime = s_firstvisittime;
	}
	public Integer getS_ishome() {
		return s_ishome;
	}
	public void setS_ishome(Integer s_ishome) {
		this.s_ishome = s_ishome;
	}
	public String getS_hometime() {
		return s_hometime;
	}
	public void setS_hometime(String s_hometime) {
		this.s_hometime = s_hometime;
	}
	public String getS_lostvalid() {
		return s_lostvalid;
	}
	public void setS_lostvalid(String s_lostvalid) {
		this.s_lostvalid = s_lostvalid;
	}
	public Integer getS_ispay() {
		return s_ispay;
	}
	public void setS_ispay(Integer s_ispay) {
		this.s_ispay = s_ispay;
	}
	public String getS_paytime() {
		return s_paytime;
	}
	public void setS_paytime(String s_paytime) {
		this.s_paytime = s_paytime;
	}
	public Double getS_money() {
		return s_money;
	}
	public void setS_money(Double s_money) {
		this.s_money = s_money;
	}
	public Integer getS_isreturnmoney() {
		return s_isreturnmoney;
	}
	public void setS_isreturnmoney(Integer s_isreturnmoney) {
		this.s_isreturnmoney = s_isreturnmoney;
	}
	public Integer getS_isinclass() {
		return s_isinclass;
	}
	public void setS_isinclass(Integer s_isinclass) {
		this.s_isinclass = s_isinclass;
	}
	public String getS_inclasstime() {
		return s_inclasstime;
	}
	public void setS_inclasstime(String s_inclasstime) {
		this.s_inclasstime = s_inclasstime;
	}
	public String getS_inclasscontent() {
		return s_inclasscontent;
	}
	public void setS_inclasscontent(String s_inclasscontent) {
		this.s_inclasscontent = s_inclasscontent;
	}
	public Integer getS_isdel() {
		return s_isdel;
	}
	public void setS_isdel(Integer s_isdel) {
		this.s_isdel = s_isdel;
	}
	public String getS_frompart() {
		return s_frompart;
	}
	public void setS_frompart(String s_frompart) {
		this.s_frompart = s_frompart;
	}
	public String getS_concern() {
		return s_concern;
	}
	public void setS_concern(String s_concern) {
		this.s_concern = s_concern;
	}
	public Integer getS_isbaobei() {
		return s_isbaobei;
	}
	public void setS_isbaobei(Integer s_isbaobei) {
		this.s_isbaobei = s_isbaobei;
	}
	public Integer getS_userid() {
		return s_userid;
	}
	public void setS_userid(Integer s_userid) {
		this.s_userid = s_userid;
	}
	public String getS_returnmoneycontent() {
		return s_returnmoneycontent;
	}
	public void setS_returnmoneycontent(String s_returnmoneycontent) {
		this.s_returnmoneycontent = s_returnmoneycontent;
	}
	public Double getS_premoney() {
		return s_premoney;
	}
	public void setS_premoney(Double s_premoney) {
		this.s_premoney = s_premoney;
	}
	public String getS_premoneytime() {
		return s_premoneytime;
	}
	public void setS_premoneytime(String s_premoneytime) {
		this.s_premoneytime = s_premoneytime;
	}
	@Override
	public String toString() {
		return "Students [s_id=" + s_id + ", s_name=" + s_name + ", s_age=" + s_age + ", s_sex=" + s_sex + ", s_phone="
				+ s_phone + ", s_state=" + s_state + ", s_msgsource=" + s_msgsource + ", s_sourceurl=" + s_sourceurl
				+ ", s_sourcekeyword=" + s_sourcekeyword + ", s_address=" + s_address + ", s_qq=" + s_qq + ", s_weixin="
				+ s_weixin + ", s_content=" + s_content + ", s_createtime=" + s_createtime + ", s_isvalid=" + s_isvalid
				+ ", s_record=" + s_record + ", s_isreturnvist=" + s_isreturnvist + ", s_firstvisittime="
				+ s_firstvisittime + ", s_ishome=" + s_ishome + ", s_hometime=" + s_hometime + ", s_lostvalid="
				+ s_lostvalid + ", s_ispay=" + s_ispay + ", s_paytime=" + s_paytime + ", s_money=" + s_money
				+ ", s_isreturnmoney=" + s_isreturnmoney + ", s_isinclass=" + s_isinclass + ", s_inclasstime="
				+ s_inclasstime + ", s_inclasscontent=" + s_inclasscontent + ", s_isdel=" + s_isdel + ", s_frompart="
				+ s_frompart + ", s_concern=" + s_concern + ", s_isbaobei=" + s_isbaobei + ", s_userid=" + s_userid
				+ ", s_returnmoneycontent=" + s_returnmoneycontent + ", s_premoney=" + s_premoney + ", s_premoneytime="
				+ s_premoneytime + "]";
	}
	
}
