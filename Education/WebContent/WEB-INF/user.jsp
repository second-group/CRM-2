<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/default/easyui.css" />
		<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="https://unpkg.com/vue"></script>
		<script type="text/javascript">
			$(function(){
				searchUserInfo();
			})
			function searchUserInfo(){
				$("#dg").datagrid({
					url:'selectUsers',
					method:'post',
					toolbar:'#usertb',
					queryParams: { //要发送的参数列表												
						u_loginname: $("#u_loginname").textbox("getValue"),
						Minu_createtime:$("#Minu_createtime").textbox("getValue"),
						Maxu_createtime:$("#Maxu_createtime").textbox("getValue")
					} 
				});
}
		</script>
</head>
<body>
	<table name="center" class="easyui-datagrid" id="dg" title="用户列表"  data-options="fitColumns:true,rownumbers:true,singleSelect:true,pagination:true">
			<thead>
				<tr>
					<th data-options="field:'u_id',width:80">编号</th>
					<th data-options="field:'u_loginname',width:100">用户名</th>
					<th data-options="field:'u_lastlogintime',width:150">最后登录时间</th>
					<th data-options="field:'u_createtime',width:150,align:'center'">创建时间</th>
					<th data-options="field:'u_protectemail',width:150,align:'center'">邮箱</th>
					<th data-options="field:'u_protectmtel',width:150,align:'center'">手机号</th>
					<th data-options="field:'zhiwei'">
				</tr>
			</thead>
		</table>
		<div id="usertb" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				名称: <input class="easyui-textbox" id="u_loginname"  style="width:80px">
				入职时间: <input class="easyui-datebox" id="Minu_createtime" style="width:80px">-<input class="easyui-datebox" id="Maxu_createtime" style="width:80px">			
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>
			</div>
		</div>
</body>
</html>