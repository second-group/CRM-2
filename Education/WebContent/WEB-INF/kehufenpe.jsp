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
				selectUser();
			})
			function selectUser(){
				$("#dg").datagrid({
					url:'selectUserByDay',
					method:'post',
					pagination:true,
					toolbar:'#tb'
				})
			}
			function formattersex(value,row,index){
				return '<a href="javascript:void(0)" onclick="isfenpei('+index+')">分配</a>   <a href="javascript:void(0)" onclick="tiaozheng('+index+')">调整权重</a>';
			}
			var a_userid;
			var u_loginname;
			 function isfenpei(index){
					
				 var arr=$("#dg").datagrid("getData");//获取数据表格加载完成时返回的数据
				 var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据
				 u_id=row.u_id;
				 u_loginname =row.u_loginname;
				 $("#kehufenpei").dialog("open");
				 $("#daifenpei").datagrid("resize");
				$("#daifenpei").datagrid({
					url:"selectAllNotAskers",
					method:'post',
					pagination:true
				})
				
			}
			function fenpeiReset(){
			
				 alert(u_loginname);
				var sid=$("#daifenpei").datagrid("getSelections");
				alert(sid);
				var s_uid='';
				var s_record='';
				var s_content='';
				$(sid).each(function(){
		            s_uid+=this.s_id+","
		            s_record+=this.s_record+","
		            s_content+=this.s_content+","
		        });
				if(s_uid==''){
					return;
				}
				if(s_record=''){
					return;
				}
				if(s_content==''){
					return;
				}
				$.post("insertAskers",{
					a_userid:u_id,
					s_id:s_uid,
					s_record:s_record,
					s_content:s_content,
					u_loginname:u_loginname
				},function(res){
					if(res>0){
						alert("分配成功");
						 $("#kehufenpei").dialog("close");
					}else{
						alert("分配失败");
					}
				})
				
			} 
			function onChangeDate() {
				var data=$("#dg").datagrid('getData');
				var thisValue = $("#hahah").switchbutton("options").checked;
				if(thisValue){
					if(data.total<=1){
						$.messager.alert("操作提示", "当前员工只有一个人不能进行自动分配","error");
						return;
					}else{
						$.messager.confirm('确认', '您确认想要分配所有客户吗？', function(r) {
							if(r) { // 用户点击了确认按钮
								var thisValue = $("#hahah").switchbutton("options").checked;
								$.post("ZiDongFenLiang",{
									thisValue:thisValue
								},function(res){
									if(res.success){	        			
										alert(res.message);
						        		}else{ 
						        			alert(res.message);
							            	
						        			      			
						        		 } 	  
								},"json");
							}
						})
					}
				}
				
				
				
			}
			var u_id;
			function tiaozheng(index){
				var data=$("#dg").datagrid("getData");
				var arr=data.rows[index];
				u_id=arr.u_id;
				$("#weight").slider("setValue",arr.u_weight);
				$("#quanzhong").dialog("open");
			}
			function chakanReset(){
				$("#dialog").dialog("close");
				$("#kehufenpei").dialog("close");
			}
			function xiugai(){
				var u_weight=$("#weight").slider("getValue");
				$.post("updateUsers",{
					u_weight:u_weight,
					u_id:u_id
				},function(res){
					if(res>0){
						$("#dg").datagrid("reload");
						$("#quanzhong").dialog("close");
						alert("修改成功");
					}else{
						alert("修改失败");
					}
				},"json")
			}
		</script>
</head>
<body>

	<!-- <div id="Askertab" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
			<form>
				名称: <input class="easyui-textbox" id="u_loginname"  style="width:80px">
				签到时间: <input class="easyui-datebox" id="Minu_createtime" style="width:80px">-<input class="easyui-datebox" id="Maxu_createtime" style="width:80px">			
				</form>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>
			</div>
		</div> -->
	<table name="center" class="easyui-datagrid" id="dg" title="用户列表"  data-options="fitColumns:true,rownumbers:true,singleSelect:true,pagination:true">
			<thead>
				<tr>
					<th data-options="field:'u_id',width:80" >咨询师编号</th>
					<th data-options="field:'u_loginname',width:80" >咨询师名字</th>	
					<th data-options="field:'u_weight',width:80" >咨询师权重</th>	
					<th data-options="field:'caozuo',formatter:formattersex">操作</th>	
				</tr>
			</thead>
		</table>
		<!-- 工具头 -->
	<div id="tb">
		<form id="tabfrm" class="easyui-form">
	开启自动分量：	
 <input class="easyui-switchbutton" id="hahah" onText="开" offText="关" data-options="onChange:onChangeDate"> 
 <!-- <input class="easyui-switchbutton" data-options="onText:'Yes',offText:'No'"> -->
		</form>
	</div>
		<!--显示所有待分配的客户 -->
		<div id="kehufenpei" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[
				{
					text:'保存',
					handler:function(){fenpeiReset()}
				},{
				text:'取消',
				handler:function(){chakanReset()}
			}]">
			<table class="easyui-datagrid" id="daifenpei" data-options="fitColumns:true,rownumbers:true,pagination:true">
				<thead>
					<tr>
						<th data-options="field:'che',checkbox:true"></th>
						<th data-options="field:'s_id'" >客户编号</th>
						<th data-options="field:'s_name'" >客户名字</th>
						 <th data-options="field:'s_record'" >客户权重</th>
						<th data-options="field:'s_content'" >客户备注</th>
				</thead>

			</table>
		</div>
		<div id="quanzhong" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[
				{
					text:'保存',
					handler:function(){xiugai()}
				},{
				text:'取消',
				handler:function(){chakanReset()}
			}]">
			<form class="easyui-form">
				<table style="padding-top: 50px;padding-bottom: 50px" >
					<tr>
						<td>调整权重</td>
						<td><input class="easyui-slider" id="weight" value="12"  style="width:240px"  
		        	data-options="showTip:true" /></td>
					</tr>
					<tr>
						<td>备注</td>
						<td><input class="easyui-textbox" id="beizhu"></td>
					</tr>
				</table>
			
			</form>
			
			
		</div>
</body>
</html>