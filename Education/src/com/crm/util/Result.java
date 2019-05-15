package com.crm.util;

import java.util.ArrayList;

import com.google.gson.Gson;

public class Result {
    public boolean success;
    public String message;
    public String remark;
    public static String toClient(boolean suc,Object msg){
        Result r = new Result();
        r.success =suc;
        r.message = msg.toString();
        r.remark="";
        Gson t = new Gson();
        return t.toJson(r);
    }
    public static String toClient(boolean suc,Object msg,String rmk){
        Result r = new Result();
        r.success =suc;
        r.message = msg.toString();
        r.remark=rmk;
        Gson t = new Gson();
        return t.toJson(r);
    }
    
    /**
	 * ��tree���ѡ��״̬
	 * @param totalList
	 * @param list
	 * @return
	 */
	/*public static  ArrayList<Modules> checkTree(ArrayList<Modules> totalList,ArrayList<Modules> Roleslist){
		System.out.println(3);
		System.out.println(totalList+"����");//����
		System.out.println(Roleslist+"ӵ��");//��ɫ��id��ѯ������ģ��
		for (int i = 0; i < Roleslist.size(); i++) {
			 for (int j = 0; j < totalList.size(); j++) {
				if(totalList.get(j).getId()==Roleslist.get(i).getId()) {
					System.out.println(totalList.get(j).getM_parentid()+"��id");
					if(totalList.get(j).getM_parentid()!=0) {
						System.out.println("�ҽ�����");
						totalList.get(j).setChecked(true);
					}					  					
				}
			}
		}
		return totalList;
	}*/
}