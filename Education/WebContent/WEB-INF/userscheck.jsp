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
		<script type="text/javascript">
			$(function(){
				
			})
			function init(){
				$("#dg").datagrid({
					
				})
			}
		</script>
</head>
<body>
	<div id="Askertab" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				名称: <input class="easyui-textbox" id="u_loginname"  style="width:80px">
				签到时间: <input class="easyui-datebox" id="Minu_createtime" style="width:80px">-<input class="easyui-datebox" id="Maxu_createtime" style="width:80px">			
				<select>
					
				</select>
				
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>
			</div>
		</div>
	<table name="center" class="easyui-datagrid" id="dg" title="用户列表"  data-options="fitColumns:true,rownumbers:true,singleSelect:true,pagination:true">
			<thead>
				<tr>
					<th data-options="field:'uc_Id',width:80" >编号</th>
					<th data-options="field:'uc_UserId',width:80" >用户编号</th>
					<th data-options="field:'uc_LoginName',width:100">用户名称</th>
					<th data-options="field:'uc_CheckInTIme',width:150">签到时间</th>
					<th data-options="field:'uc_CheckState',width:150,align:'center'">签到状态</th>
					<th data-options="field:'uc_IsCancel',width:150,align:'center'">是否取消签到</th>
					<th data-options="field:'uc_CheckOutTime',width:150,align:'center'">签到结束时间</th>
				</tr>
			</thead>
		</table>
</body>
</html>