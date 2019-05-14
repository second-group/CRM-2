package com.crm.util;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
@Component
public class TreeChecked {
	/**
	 * 将tree变成选中状态
	 * @param totalList
	 * @param list
	 * @return
	 */
	public static  ArrayList<TreeModel> checkTree(ArrayList<TreeModel> totalList,ArrayList<TreeModel> list){
		System.out.println(totalList);//所有
		System.out.println(list);//角色的id查询出来的模块
		for (int i = 0; i < list.size(); i++) {
			 for (int j = 0; j < totalList.size(); j++) {
				if(totalList.get(j).getId()==list.get(i).getId()) {
					if(totalList.get(j).getM_parentid()!=0)
					  totalList.get(j).setChecked(true);
					
				}
			}
		}
		return totalList;
	}
}
