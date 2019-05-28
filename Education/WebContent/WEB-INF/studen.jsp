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
var ids = [];
var s_uid=''
	$(function(){
		selectAllUser();
		init();
	})
	function selectAllUser(){
		$("#studentTyp").combobox({
			 url:'selectALLUsers',    
			    valueField:'u_loginname',    
			    textField:'u_loginname'  
		})
	}
 	function init(){
		var u_loginname=$("#studentTyp").combobox("getValue");
		var s_ispay=$("#sispay").combobox("getValue");
		var s_isvalid=$("#sisvalid").combobox("getValue");				
		var s_isreturnvist=$("#sisreturnvist").combobox("getValue");
		var s_sex=$("#sexs").combobox("getValue");
		if(u_loginname=="--请选择--"){
			u_loginname="";
		}
		if(s_sex=="--请选择--"){
			s_sex="";
		}
		$("#stuste").datagrid({
			url:'selectStudent',
			method:'post',
			rownumbers:true,
			pagination:true,
			toolbar:'#tb',
			queryParams:{
				s_sex:s_sex,
				s_zixunname:u_loginname,
				s_name:$("#sname").val(),
				s_phone:$("#sphone").val(),
				s_ispay:s_ispay,
				s_isvalid:s_isvalid,				
				s_isreturnvist:s_isreturnvist,				
				s_qq:$("#sqq").val(),				
				s_createtime:$("#screatetime").datebox("getValue"),				
				s_hometime:$("#shometime").datebox("getValue"),				
				s_firstvisittime:$("#sfirstvisittime").datebox("getValue"),				
				s_paytime:$("#spaytime").datebox("getValue"),				
				s_inclasstime:$("#sinclasstime").datebox("getValue")		
				
			}
			
		})
		
	}
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='lookstus("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updatestu("+index+")'>修改</a>"
	}
	 function formattersex(value,row,index) {
		return value==0? '男':'女';
	}
	function formatterbaobei(value,row,index) {
		return value==0? '否':'是';
	} 
	function formatterispay(value,row,index) {
		return value==0? '是':'否';
	} 
	function formatterisvalid(value,row,index) {
		return value==0? '是':'否';
	} 
	function formatterisreturnvist(value,row,index) {
		return value==0? '是':'否';
	}  
	function formatterLuRuRen(value,row,index) {
		return row.users.u_loginname;
	}  
	
	function formatteryouxiao(value,row,index){
		switch (row.s_isreturnvist) {
		case 0:
			$("#s_isreturnvist1").textbox("setValue", "无效");
			break;
		case 1:
			$("#s_isreturnvist1").textbox("setValue", "有效");
			break;
		case 2:
			$("#s_isreturnvist1").textbox("setValue", "待定");
			break;
		default:
			break;
		}
	}
	/* 查看 详细信息*/
	function lookstus(index){
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据
		$("#stu-chakan-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
		/*格式化表格中的是否回访*/
		switch (row.s_isreturnvist) {
		case 0:
			$("#s_isreturnvist1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_isreturnvist1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*格式化状态*/
		switch (row.s_isreturnvist) {
		case 0:
			$("#s_state1").textbox("setValue", "无效");
			break;
		case 1:
			$("#s_state1").textbox("setValue", "有效");
			break;
		default:
			break;
		}
		/*是否回访*/
		switch (row.s_isreturnvist) {
		case 0:
			$("#s_isreturnvist1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_isreturnvist1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*是否报备*/
		switch (row.s_isbaobei) {
		case 0:
			$("#s_isbaobei1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_isbaobei1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*是否上门*/
		switch (row.s_ishome) {
		case 0:
			$("#s_ishome1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_ishome1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		
		/*是否缴费*/
		switch (row.s_ispay) {
		case 0:
			$("#s_ispay1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_ispay1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*是否退费*/
		switch (row.s_isreturnmoney) {
		case 0:
			$("#s_isreturnmoney1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_isreturnmoney1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*是否进班*/
		switch (row.s_isinclass) {
		case 0:
			$("#s_isinclass1").textbox("setValue", "否");
			break;
		case 1:
			$("#s_isinclass1").textbox("setValue", "是");
			break;
		default:
			break;
		}
		/*格式化性别*/
		switch (row.s_sex) {
		case 0:
			$("#s_sex").textbox("setValue", "男");
			break;
		case 1:
			$("#s_sex").textbox("setValue", "女");
			break;
		default:
			break;
		}
		/*课程方向*/
		switch(row.s_curriculum){
		case '1':
			$("#s_curriculum").textbox("setValue", "软件开发");
			break;
		case '2':
			$("#s_curriculum").textbox("setValue", "软件设计");
			break;
		case '3':
			$("#s_curriculum").textbox("setValue", "网络营销");
			break;
		}
		/*打分*/
		switch(row.s_record){
		case 1:
			$("#s_record").textbox("setValue", "A、近期可报名");
			break;
		case 2:
			$("#s_record").textbox("setValue", "B、一个月内可报名");
			break;
		case 3:
			$("#s_record").textbox("setValue", "C、长期跟踪");
			break;
		case 4:
			$("#s_record").textbox("setValue", "D、无效");
			break;
		}
		$("#stu-chakan-dialog").dialog("open");//打开我们的窗口
	}
	function chakanReset(){
		$("#stu-chakan-dialog").dialog("close");//关闭窗口
	}

	function tianjiastu(){
		$("#stu-tianjia-dialog").dialog("open");
	}
	function zixunshi(value,row,index){
		if(row.s_userid>0){
			return row.users.u_loginname;
		}
		
	}
	//添加的重置操作方法
	function insertReset(){
		$("#stu-tianjia-form").form("reset")
	}
	/*打开弹窗获取所选中的咨询师*/
	function updatezixunshi(index){
		
		var sid=$("#stuste").datagrid("getSelections");
		alert(sid);
		
		$(sid).each(function(){
            ids.push(this.s_id);
            s_uid+=this.s_id+","
        });
		alert(s_uid);
		$("#studentTyp1").combobox({
			 url:'selectALLUsers',    
			    valueField:'u_loginname',    
			    textField:'u_loginname'  
		})
		$("#win").dialog("open");
	
	}
	/*批量修改的提交*/
	function AllUpdate(){
  		var s_userid=$("#studentTyp1").combobox("getValue");
  		alert(s_userid);
  	
		$.post("UpdateStuent",{
			ids:s_uid,
			s_zixunname:s_userid
		},function(res){
			if(res>0){
				alert("修改成功");
				$("#stuste").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
				$("#win").dialog("close");
				
			}else{
				alert("修改失败");
			}
		})
	}
	/*打开修改的窗口并把所选中的值填充到form表单中*/
	function updatestu(index){
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		 var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据 */ 
		 $("#studentTyp2").combobox({
			 url:'selectALLUsers',    
			    valueField:'u_loginname',    
			    textField:'u_loginname'  
		})
		/*性别 */
		$("#s_sex1").combobox("setValue",row.s_sex);
		$("#updates_education").combobox("setValue",row.s_education);
		$("#updates_state").combobox("setValue",row.s_state);
		$("#updates_msgsource").combobox("setValue",row.s_msgsource);
		$("#updates_sourceurl").combobox("setValue",row.s_sourceurl);
		$("#updates_address").combobox("setValue",row.s_address);
		$("#updates_concern").combobox("setValue",row.s_concern);
		$("#updates_frompart").combobox("setValue",row.s_frompart);
		$("#updates_isvalid").combobox('setValue',row.s_isvalid);
		$("#updates_isreturnvist").combobox('setValue',row.s_isreturnvist);
		$("#updates_ishome").combobox('setValue',row.s_ishome);
		$("#updates_ispay").combobox('setValue',row.s_ispay);
		$("#updates_isreturnmoney").combobox('setValue',row.s_isreturnmoney);
		$("#updates_isinclass").combobox('setValue',row.s_isinclass);
		$("#updates_curriculum").combobox('setValue',row.s_curriculum);
		$("#stu-xiugai-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
		$("#stu-xiugai-dialog").dialog("open");//打开我们的窗口	
		
		$("#studentTyp2").combobox('setValue',row.s_zixunname); 
		
	}
	/*提交修改*/
	function updateSub(){
		var select=$("#studentTyp2").combobox("getValue");
		$.post(
				"UpdateStuent", {
					s_id:$("#updates_id").val(),
					s_name:$("#updates_name").val(),
					s_sex:$("#updates_sex").combobox("getValue"),
					s_age:$("#updates_age").val(),
					s_phone:$("#updates_phone").val(),
					s_education:$("#updates_education").combobox("getValue"),
					s_state:$("#updates_state").combobox("getValue"),
					s_msgsource:$("#updates_msgsource").combobox("getValue"),
					s_sourceurl:$("#updates_sourceurl").combobox("getValue"),
					s_sourcekeyword:$("#updates_sourcekeyword").val(),
					s_address:$("#updates_address").combobox("getValue"),
					s_concern:$("#updates_concern").combobox("getValue"),
					s_frompart:$("#updates_frompart").combobox("getValue"),
					s_qq:$("#updates_qq").val(),
					s_weixin:$("#updates_weixin").val(),
					s_isbaobei:$("#updates_isbaobei").combobox("getValue"),
					s_curriculum:$("#updates_curriculum").combobox("getValue"),
					s_record:$("#updates_record1").combobox("getValue"),
					s_isvalid:$("#updates_isvalid").combobox("getValue"),
					s_lostvalid:$("#updates_lostvalid").val(),
					s_isreturnvist:$("#updates_isreturnvist").combobox("getValue"),
					s_firstvisittime:$("#updates_firstvisittime").val(),
					s_ishome:$("#updates_ishome").combobox("getValue"),
					s_hometime:$("#updates_hometime").val(),
					s_premoney:$("#updates_premoney").val(),
					s_premoneytime:$("#updates_premoneytime").val(),
					s_ispay:$("#updates_ispay").combobox("getValue"),
					s_paytime:$("#updates_paytime").val(),
					s_money:$("#updates_money").val(),
					s_isreturnmoney:$("#updates_isreturnmoney").combobox("getValue"),
					s_returnmoneycontent:$("#updates_returnmoneycontent").val(),
					s_isinclass:$("#updates_isinclass").combobox("getValue"),
					s_inclasstime:$("#updates_inclasstime").val(),
					s_inclasscontent:$("#updates_inclasscontent").val(),
					s_content:$("#updates_content").val(),
					s_zixunname:select
			},
			function(res) {
			if(res>0) {
				alert("修改成功");
				$("#stuste").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
				$("#stu-xiugai-form").form("clear");
				$("#stu-xiugai-dialog").dialog("close");
			
			}else{
				alert("修改失败");
			}
		}, "json");
	}
	function gengduo(){
		var  otherDiv=document.getElementById('gengduo');
	    //显示
	/*     otherDiv.style.display="block"; */
	    	if($("#gengduo").css("display")=="none"){
	    		otherDiv.style.display="block";
	    	}else{
	    		otherDiv.style.display="none";
	    	}
	}
</script>
</head>
<body>
	<table id="stuste" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'che',checkbox:true"></th>
				<!-- <th data-options="field:'s_id',title:'s_id'">id</th> -->
				<th data-options="field:'s_name',title:'s_name'">姓名</th>
				<th data-options="field:'s_sex',title:'s_sex',formatter:formattersex">性别</th>
				<!-- <th data-options="field:'s_age',title:'s_age'">年龄</th> -->
				<!-- <th data-options="field:'s_phone',title:'s_phone'">电话</th>			 -->
				<th data-options="field:'s_state',title:'s_state'">状态</th>				
				<!-- <th data-options="field:'s_qq',title:'s_qq'">学员QQ</th>			
				<th data-options="field:'s_weixin',title:'s_weixin'">微信号</th>		 -->	
				<th data-options="field:'s_isbaobei',title:'s_isbaobei',formatter:formatterbaobei">是否报备</th>			
				<th data-options="field:'s_content',title:'s_content'">在线备注</th>			
				<th data-options="field:'s_ispay',formatter:formatterbaobei" >是否缴费</th>				
				<th data-options="field:'s_isvalid',formatter:formatteryouxiao" >是否有效</th>		
				<th data-options="field:'s_isreturnvist',formatter:formatterbaobei"  >是否回访</th>	
				<th data-options="field:'s_createtime'"  >创建时间</th>			
				<th data-options="field:'s_hometime'"  >上门时间</th>	
				<th data-options="field:'s_firstvisittime'" >首次回访时间</th>			
				<th data-options="field:'s_paytime'"  >缴费时间</th>		
				<th data-options="field:'s_inclasstime'"  >进班时间</th>	
				<th data-options="field:'s_zixunname'"  >所属咨询师</th>	
				<th data-options="field:'u_u_loginname',formatter:formatterLuRuRen"  >录入人</th>	
				<th	data-options="field:'caozuo',title:'操作',formatter:formattercaozuo" class="right"></th>
			</tr>
		</thead>
	</table>
	
	<!-- 工具头 -->
	<div id="tb">
		<form id="tabfrm" class="easyui-form">
		<label for="name">是否缴费:</label> 
			<select id="sispay" class="easyui-combobox" style="width:100px">
				<option value=''>--请选择--</option>
				<option value="0">否</option>
				<option value="1">是</option>
			</select>
			<!-- input class="easyui-validatebox" type="text" id="sispay" /> -->
			<label for="name">是否有效:</label> 
			<!-- <input class="easyui-validatebox" type="text" id="sisvalid" /> -->
			<select id="sisvalid" class="easyui-combobox" style="width:100px">
				<option value=''>--请选择--</option>
				<option value="0">否</option>
				<option value="1">是</option>
			</select>
			<label for="name">是否回访:</label> 
			<!-- <input class="easyui-validatebox" type="text" id="sisreturnvist" /> -->
			<select id="sisreturnvist" class="easyui-combobox" style="width:100px">
				<option value=''>--请选择--</option>
				<option value="0">否</option>
				<option value="1">是</option>
			</select>
			
			<label>咨询师</label>
			<select id="studentTyp" class="easyui-combobox" name="dept" style="width:100px;">   
   			 <option value="">--请选择--</option>
   			</select>
   			<span id="gengduo" style="display:none"> 
   			<label for="name">创建时间:</label> 
			<input type="text" id="screatetime" class="easyui-datebox" />
			<label for="name">上门时间:</label> 
			<input type="text" id="shometime" class="easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
			<input type="text" id="sfirstvisittime" class="easyui-datebox" />
			<label for="name">缴费时间:</label> 
			<input type="text" id="spaytime" class="easyui-datebox" />
			<label for="name">进班时间:</label>
			<input type="text" id="sinclasstime" class="easyui-datebox" />
   				
			<label for="name">性别:</label> 
				<select id="sexs" class="easyui-combobox" name="dept" style="width:100px;">
					<option value="--请选择--">--请选择--</option>
					<option value="0">男</option>
					<option value="1">女</option>
				</select>
			<label for="name">QQ:</label> 
			<input class="easyui-textbox" type="text" id="sqq"  />
			
			<label for="name">姓名:</label> 
			<input class="easyui-textbox" type="text" id="sname" />
			
			<label for="name">电话:</label> 
			<input class="easyui-textbox" type="text" id="sphone" />
   			</span>
			 <a href="javascript:void(0)" onclick="gengduo()" class="easyui-linkbutton" data-options="iconCls:'icon-cut'" >更多</a>
			 <a href="javascript:void(0)" onclick="updatezixunshi()" class="easyui-linkbutton" data-options="iconCls:'icon-cut'">批量修改</a>
			 <a href="javascript:void(0)" onclick="init()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
		</form>
	</div>
	<!-- 查看 -->
		<div id="stu-chakan-dialog" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[
				{
				text:'取消',
				handler:function(){chakanReset()}
			}]">
		<form id="stu-chakan-form" class="easyui-form">
			<table >
				<tr>
					<td>学员姓名：</td>
					<td><input type="text" name="s_name" class="easyui-textbox"></td>
					<td>年龄：</td>
					<td><input type="text" name="s_age" class="easyui-textbox"></td>
				</tr>
				
				<tr>
					<td>性别：</td>
					<td>
					<input type="text" name="s_sex" id="s_sex" class="easyui-textbox" ></td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" name="s_state" id="s_state1" class="easyui-textbox"></td>
					<td>学历：</td>
					<td><input type="text" name="s_education" id="s_education1" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" name="s_msgsource" class="easyui-textbox"></td>
					<td>来源网站：</td>
					<td><input type="text" name="s_sourceurl" class="easyui-textbox"></td>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>所在区域：</td>
					<td><input type="text" name="s_address" class="easyui-textbox"></td>
					<td>学员qq：</td>
					<td><input type="text" name="s_qq" class="easyui-textbox"></td>
					<td>客户微信：</td>
					<td><input type="text" name="s_weixin" class="easyui-textbox"></td>
				</tr>
				<tr> 
					<td>来源部门：</td>
					<td><input type="text" name="s_frompart" class="easyui-textbox"></td>
					
					<td>关注：</td>
					<td><input type="text" name="s_concern" class="easyui-textbox"></td>
					<td>是否报备：</td>
					<td>
						
					<input type="text" name="s_isbaobei" id="s_isbaobei1" class="easyui-textbox" ></td>
				</tr>
				<tr>
					<td>网络咨询师</td>
					<td><input type="text" name="s_createname" class="easyui-textbox" ></td>			
					<td>咨询师:</td>
						<td><input class="easyui-textbox" name="s_zixunname" id="updates_userid" ></input></td>
						<td>课程方向:</td>
						<td><input class="easyui-textbox" name="s_curriculum" id="s_curriculum" ></input></td>
				</tr>			
					<tr>
					<td>打分:</td>
						<td><input class="easyui-textbox" name="s_record" id="s_record" ></input>
						</td>
						<td>是否有效:</td>
						<td><input class="easyui-textbox" name="s_isvalid" id="s_isvalid1" ></input>
						</td>
						<td>无效原因:</td>
						<td><input class="easyui-textbox" name="s_lostvalid" ></input>
						</td>
					</tr>
					<tr>
						<td>是否回访:</td>
						<td><input class="easyui-textbox"  id="s_isreturnvist1" ></input>
						</td>
						<td>首次回访时间:</td>
						<td><input class="easyui-datebox" name="s_firstvisittime" ></input>
						</td>
					</tr>
					<tr>
						<td>是否上门:</td>
						<td><input class="easyui-textbox"  id="s_ishome1" ></input>
						</td>
						<td>上门时间:</td>
						<td><input class="easyui-datebox" name="s_hometime"></input>
						</td>
					</tr>
					<tr>
						<td>定金金额:</td>
						<td><input class="easyui-textbox" name="s_premoney"  ></input>
						</td>
						<td>定金时间:</td>
						<td><input class="easyui-datebox" name="s_premoneytime" ></input>
						</td>
					</tr>
					<tr>
						<td>是否缴费:</td>
						<td><input class="easyui-textbox" id="s_ispay1" ></input>
						</td>
						<td>缴费时间:</td>
						<td><input class="easyui-datebox" name="s_paytime" ></input>
						</td>
						<td>缴费金额:</td>
						<td><input class="easyui-textbox" name="s_money"  ></input>
						</td>
					</tr>
					<tr>
						<td>是否退费:</td>
						<td><input class="easyui-textbox" id="s_isreturnmoney" ></input>
						</td>
						<td>退费原因:</td>
						<td><input class="easyui-textbox" name="s_returnmoneycontent" ></input>
						</td>
					</tr>
					
					<tr>
						<td>是否进班:</td>
						<td><input class="easyui-textbox"  id="s_isinclass1" ></input>
						</td>
						<td>进班时间:</td>
						<td><input class="easyui-datebox" name="s_inclasstime" ></input>
						</td>
						<td>进班备注:</td>
						<td><input class="easyui-textbox" name="s_inclasscontent" ></input>
						</td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><input class="easyui-textbox" name="s_content" ></input>
						</td>
					</tr>
			</table>
		</form>
	</div>
	<!-- 修改 -->
	<div id="stu-xiugai-dialog" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'提交',
				handler:function(){
				updateSub()}
			},{
				text:'取消',
				handler:function(){
				updateReset()}
			}]">
		<form id="stu-xiugai-form" class="easyui-form">
			<table>
				<tr>
					<td>编号：</td>
					<td><input type="text" name="s_id" id="updates_id" class="easyui-textbox" disabled="disabled"></td>
					<td>姓名：</td>
					<td><input type="text" name="s_name" id="updates_name" class="easyui-textbox" required="true"></td>
					<td>性别：</td>
					<td>
						<select style="width: 100px" id="updates_sex" class="easyui-combobox">
				    		<option value="1">女</option>
		    				<option value="0">男</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" id="updates_age" class="easyui-textbox" class="easyui-validatebox" required="true"></td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" id="updates_phone" class="easyui-textbox" class="easyui-validatebox" required="true" data-options="validType:'phoneLength[11]'"></td>
					<td>学历：</td>
					<td>
						<select style="width: 100px" id="updates_education" class="easyui-combobox">
							<option value="xueli">请选择</option>
				    		<option value="未知">未知</option>
		    				<option value="大专">大专</option>
		    				<option value="高中">高中</option>
		    				<option value="中专">中专</option>
		    				<option value="初中">初中</option>
		    				<option value="本科">本科</option>
		    				<option value="其他">其他</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>状态：</td>
					<td>
						<select style="width: 100px" id="updates_state" class="easyui-combobox">
							<option value="zhuangtai">请选择</option>
				    		<option value="未知">未知</option>
		    				<option value="待业">待业</option>
		    				<option value="在职">在职</option>
			    		</select>
					</td>
					<td>来源渠道：</td>
					<td>
						<select style="width:100px" id="updates_msgsource" class="easyui-combobox">
							<option value="qudao">请选择</option>
				    		<option value="百度">百度</option>
		    				<option value="百度移动端">百度移动端</option>
		    				<option value="360">360</option>
		    				<option value="360移动端">360移动端</option>
		    				<option value="搜狗">搜狗</option>
		    				<option value="搜狗移动端">搜狗移动端</option>
		    				<option value="UC移动端">UC移动端</option>
		    				<option value="直接输入">直接输入</option>
		    				<option value="自然流量">自然流量</option>
		    				<option value="直电">直电</option>
		    				<option value="微信">微信</option>
		    				<option value="QQ">QQ</option>
			    		</select>
					</td>
					<td>来源网站：</td>
					<td>
						<select style="width: 100px" id="updates_sourceurl" class="easyui-combobox">
							<option value="wangzhan">请选择</option>
				    		<option value="其它">其它</option>
		    				<option value="职英B站">职英B站</option>
		    				<option value="高考站">高考站</option>
		    				<option value="职英A站">职英A站</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="updates_sourcekeyword" class="easyui-textbox"></td>
					<td>所在区域：</td>
					<td>
							<select style="width: 100px" id="updates_address" class="easyui-combobox">
							<option value="quyu">请选择</option>
				    		<option value="未知">未知</option>
		    				<option value="其它">其它</option>
		    				<option value="郑州">郑州</option>
		    				<option value="开封">开封</option>
		    				<option value="洛阳">洛阳</option>
		    				<option value="南阳">南阳</option>
		    				<option value="漯河">漯河</option>
		    				<option value="三门峡">三门峡</option>
		    				<option value="平顶山">平顶山</option>
		    				<option value="周口">周口</option>
		    				<option value="驻马店">驻马店</option>
		    				<option value="新乡">新乡</option>
		    				<option value="鹤壁">鹤壁</option>
		    				<option value="焦作">焦作</option>
		    				<option value="濮阳">濮阳</option>
		    				<option value="安阳">安阳</option>
		    				<option value="商丘">商丘</option>
		    				<option value="信阳">信阳</option>
		    				<option value="济源">济源</option>
			    		</select>
					
					</td>
					<td>学员关注：</td>
					<td>
						<select style="width: 100px" id="updates_concern" class="easyui-combobox">
							<option value="guanzhu">请选择</option>
				    		<option value="课程">课程</option>
		    				<option value="学费">学费</option>
		    				<option value="学时">学时</option>
		    				<option value="学历">学历</option>
		    				<option value="师资">师资</option>
		    				<option value="就业">就业</option>
			    			<option value="环境">环境</option>
			    			<option value="其他">其他</option>
			    		</select>					
					</td>
				</tr>
				<tr>
					<td>来源部门：</td>
					<td>
						<select style="width: 100px" id="updates_frompart" class="easyui-combobox">
							<option value="bumen">请选择</option>
				    		<option value="网络">网络</option>
		    				<option value="市场">市场</option>
		    				<option value="教质">教质</option>
		    				<option value="学术">学术</option>
		    				<option value="就业">就业</option>
			    		</select>
					
					</td>
						<td>学员QQ：</td>
					<td><input type="text" name="s_qq" id="updates_qq" class="easyui-textbox"></td>
					<td>微信号：</td>
					<td><input type="text" name="s_weixin" id="updates_weixin" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td>
						<select style="width: 100px" id="updates_isbaobei" class="easyui-combobox">
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
					</td>
					<td>
						咨询师
					</td>
					<td>
						<select id="studentTyp2" class="easyui-combobox" name="dept" style="width:200px;">   
			   			 <option value="">--请选择--</option>
			   			</select>
								</td>
					<td>课程方向:</td>
						<td><!-- <input class="easyui-textbox" name="s_curriculum" id="updates_curriculum" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_curriculum" class="easyui-combobox" data-options="required:true">
								<option value="1">软件开发</option>
								<option value="2">软件设计</option>
								<option value="3">网络营销</option>
							</select>
						</td>
				</tr>
				<tr>
					<td>打分:</td>
						<td><!-- <input class="easyui-textbox" name="s_record" id="updates_record" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_record1" class="easyui-combobox" data-options="required:true">
								<option value="1">A、近期可报名</option>
								<option value="2">B、一个月内可报名</option>
								<option value="3">C、长期跟踪</option>
								<option value="4">D、无效</option>
							</select>
						</td>
						<td>是否有效:</td>
						<td><!-- <input class="easyui-textbox" name="s_isvalids" id="updates_isvalid"  data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_isvalid" class="easyui-combobox"  data-options="required:true">
								<option value="2">待定</option>
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
						<td>无效原因:</td>
						<td>
							<input class="easyui-textbox" name="s_lostvalid" id="updates_lostvalid" data-options="required:true"></input>
						</td>
				</tr>
				<tr>
					<td>是否回访:</td>
						<td><!-- <input class="easyui-textbox" name="s_isreturnvist" id="updates_isreturnvist" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_isreturnvist" class="easyui-combobox"  data-options="required:true">
								<option value="1">已回访</option>
								<option value="0">未回访</option>
							</select>
						</td>
						<td>首次回访时间:</td>
						<td>
							<input class="easyui-datebox" name="s_firstvisittime" id="updates_firstvisittime" data-options="required:true" disabled="disabled"></input>
						</td>
						<td>是否上门:</td>
						<td>
							<select style="width: 166px" id="updates_ishome" class="easyui-combobox"  data-options="required:true">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
				</tr>
				<tr>
					<td>上门时间:</td>
						<td>
							<input class="easyui-datebox" name="s_hometime" id="updates_hometime" data-options="required:true" disabled="disabled"></input>
						</td>
						<td>定金金额:</td>
						<td>
							<input class="easyui-numberbox" name="s_premoney" id="updates_premoney" data-options="min:2000.00,max:99999.99,precision:2,required:true,groupSeparator:',',decimalSeparator:'.',prefix:'￥'">
						</td>
						<td>定金时间:</td>
						<td>
							<input class="easyui-datebox" name="s_premoneytime" id="updates_premoneytime" data-options="required:true" disabled="disabled"></input>
						</td>
				</tr>
				<tr>
					<td>是否缴费:</td>
						<td><!-- <input class="easyui-textbox" name="s_ispay"  id="updates_ispay" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_ispay" class="easyui-combobox"  data-options="required:true">
								<option value="1">已缴费</option>
								<option value="0">未缴费</option>
							</select>
						</td>
					<td>缴费时间:</td>
						<td>
							<input class="easyui-datebox" name="s_paytime" id="updates_paytime" data-options="required:true" disabled="disabled"></input>
						</td>
						<td>缴费金额:</td>
						<td><!-- <input class="easyui-textbox" name="s_money" id="updates_money" data-options="required:true"></input> -->
							<input class="easyui-numberbox" name="s_money" id="updates_money" data-options="min:2000.00,max:99999.99,precision:2,required:true,groupSeparator:',',decimalSeparator:'.',prefix:'￥'">
						</td>
				</tr>
				<tr>
					<td>是否退费:</td>
						<td><!-- <input class="easyui-textbox" name="s_isreturnmoney"  id="updates_isreturnmoney" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_isreturnmoney" class="easyui-combobox"  data-options="required:true">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
						<td>退费原因:</td>
						<td>
							<input class="easyui-textbox" name="s_returnmoneycontent"  id="updates_returnmoneycontent" data-options="required:true"></input>
						</td>
						<td>是否进班:</td>
						<td><!-- <input class="easyui-textbox" name="s_isinclass"  id="updates_isinclass" data-options="required:true"></input> -->
							<select style="width: 166px" id="updates_isinclass" class="easyui-combobox" data-options="required:true">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
				</tr>
				<tr>
					<td>进班时间:</td>
						<td>
							<input class="easyui-datebox" name="s_inclasstime" id="updates_inclasstime" data-options="required:true" disabled="disabled"></input>
						</td>
						<td>进班备注:</td>
						<td>
							<input class="easyui-textbox" name="s_inclasscontent" id="updates_inclasscontent" data-options="required:true"></input>
						</td>
						<td>备注:</td>
						<td>
							<input class="easyui-textbox" name="s_content" id="updates_content" data-options="required:true"></input>
						</td>
				</tr>
			</table>
		
		</form>
	</div>
	

	 <div id="win" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'提交',
				handler:function(){
				AllUpdate()}
			},{
				text:'重置',
				handler:function(){
				insertReset()}
			}]">
	 	<select id="studentTyp1" class="easyui-combobox" name="dept" style="width:200px;">   
   			 <option value="">--请选择--</option>
   			</select>
	 </div>
</body>
</html>