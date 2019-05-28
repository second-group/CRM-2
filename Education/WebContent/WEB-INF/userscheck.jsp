<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/insdep.easyui.min.css" />
		<link rel="stylesheet" type="text/css" href="js/icon.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/insdep.extend.min.js"></script>
		<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				searchUserInfo();
			})
			function searchUserInfo(){
				$("#dg").datagrid({
					url:'AllUserchaecks',
					method:'post',
					toolbar:"#Askertab",
					pagination:true,
					queryParams:{
						uc_loginname:$("#u_loginname").val(),
						Minu_createtime:$("#Minu_createtime").datebox("getValue"),
						Maxu_createtime:$("#Maxu_createtime").datebox("getValue")
					}
				})
			}
			function qiandao(value,row,index){
				var res=''
				switch(value){
				case 0:
					res="<font style='color:blue'>未签到</font>";
					break;
				case 1:
					res="<font style='color:green'>已签到</font>";
					break;
				case 2:
					res="<font style='color:red'>已签退</font>";
					break;
				}
				return res;
			}
			
			function isqiandao(value,row,index){
				return value==0?'未取消':'已取消'
			}
			function qiantui(value,row,index){
				if(row.uc_checkstate==1){
					return "<a href='javascript:void(0)' class='easyui-linkbutton' onclick=tui("+index+")>签退</a>" 
					
				}
				
			}
			function tui(index){
				alert(new Date());
				var arr=$("#dg").datagrid("getData");
				var row=arr.rows[index];
				$.messager.confirm("确认签退","确定签退？",function(r){
					if(r){
						//删除
					
						$.post("updateUserchaecks",{
								uc_id:row.uc_id
						},function(res){
							if(res>0){
								//删除成功
								$("#dg").datagrid("reload");
								$.messager.alert("提示","签退成功");
							}else{
								//修改失败
								$.messager.alert("提示","签退失败");
							}
							
						},"json")
					}
					
				})
			}
		</script>
</head>
<body>
	<div id="Askertab" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
			<form>
				名称: <input class="easyui-textbox" id="u_loginname"  style="width:80px">
				签到时间: <input class="easyui-datebox" id="Minu_createtime" style="width:80px">-<input class="easyui-datebox" id="Maxu_createtime" style="width:80px">			
				</form>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>
			</div>
		</div>
	<table name="center" class="easyui-datagrid" id="dg" title="用户列表"  data-options="fitColumns:true,rownumbers:true,singleSelect:true,pagination:true">
			<thead>
				<tr>
					<th data-options="field:'uc_id',width:80" >编号</th>
					<th data-options="field:'uc_userid',width:80" >用户编号</th>
					<th data-options="field:'uc_loginname',width:100">用户名称</th>
					<th data-options="field:'uc_checkintime',width:150">签到时间</th>
					<th data-options="field:'uc_checkstate',width:150,align:'center',formatter:qiandao">签到状态</th>
					<th data-options="field:'uc_iscancel',formatter:isqiandao">是否取消签到</th>
					<th data-options="field:'uc_checkouttime',width:150,align:'center'">签到结束时间</th>
					<th data-options="field:'qiandao',width:150,formatter:qiantui">签退</th>
					
					
				</tr>
			</thead>
		</table>
</body>
</html>