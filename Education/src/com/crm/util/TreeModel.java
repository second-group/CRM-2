package com.crm.util;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
@Component
public class TreeModel {
    private int id;                           //id
    private String text;                      //标题内容                    //状态 closed-合起、open-打开
    private ArrayList<TreeModel> children;      //子节点，子节点有0个或多个，所以用链表存放                     //层级       根层级为1
    private boolean checked;
    private int m_parentid;                    //父节点   根节点为0
    private String m_path;
	public TreeModel(int id, String text, ArrayList<TreeModel> children, Boolean checked, int m_parentid,
			String m_path) {
		super();
		this.id = id;
		this.text = text;
		this.children = children;
		this.checked = checked;
		this.m_parentid = m_parentid;
		this.m_path = m_path;
	}
	public TreeModel() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public ArrayList<TreeModel> getChildren() {
		return children;
	}
	public void setChildren(ArrayList<TreeModel> children) {
		this.children = children;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public int getM_parentid() {
		return m_parentid;
	}
	public void setM_parentid(int m_parentid) {
		this.m_parentid = m_parentid;
	}
	public String getM_path() {
		return m_path;
	}
	public void setM_path(String m_path) {
		this.m_path = m_path;
	}
	@Override
	public String toString() {
		return "TreeModel [id=" + id + ", text=" + text + ", children=" + children + ", checked=" + checked
				+ ", m_parentid=" + m_parentid + ", m_path=" + m_path + "]";
	}
	
	
	
    
   
}

