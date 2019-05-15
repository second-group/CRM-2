<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/JQuery-EasyUI-EDT-1.4.3-build1/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		selectAllUser();
		init();
	})
	function selectAllUser(){
		$("#studentTyp").combobox({
			 url:'selectALLUsers',    
			    valueField:'u_id',    
			    textField:'u_loginname'  
		})
	}
	function init(){
		var userid=$("#studentTyp").combobox("getValue");
		if(userid=="--请选择--"){
			userid="";
		}
		/* var ispal=$("input[name='sispay']:checked").val();
		console.log('[$(#appraiseItemResult'+i+').val()]',$(this).val());
		alert(ispal); */
		
		$("#stuste").datagrid({
			url:'selectStudent',
			method:'post',
			pagination:true,
			toolbar:'#tb',
			queryParams:{
				s_userid:userid,
				s_name:$("#sname").val(),
				s_phone:$("#sphone").val(),
				/* s_ispay:$("#sispay").val(),	 */	
				s_ispay:$("input[name='s_ispay']:checked").val(),
				s_isvalid:$("#sisvalid").val(),				
				s_isreturnvist:$("#sisreturnvist").val(),				
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
		return value==0? '是':'否';
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
	function lookstus(index){
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据
		$("#stu-chakan-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
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
	function updatezixunshi(){
		var sid=$("#stuste").datagrid("getSelections");
		alert(sid);
		$("#win").dialog("open");
	}
	function AllUpdate(){
		
	}
	function updatestu(index){
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		 var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据 */ 
		 selectAllUser();
		$("#stu-xiugai-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
		$("#stu-xiugai-dialog").dialog("open");//打开我们的窗口		
		$("#studentTyp").combobox('setValue',row.s_userid); 
		
	}
	function updateSub(){
		var select=$("#studentTyp").combobox("getValue");
		$.post(
				"UpdateStuent", {
					s_id:$("#updates_id").val(),
					s_name:$("#s_name").val(),
					s_sex:$("#s_sex").val(),
					s_age:$("#s_age").val(),
					s_phone:$("#s_phone").val(),
					s_education:$("#s_education").val(),
					s_state:$("#s_state").val(),
					s_msgsource:$("#s_msgsource").val(),
					s_sourceurl:$("#s_sourceurl").val(),
					s_sourcekeyword:$("#s_sourcekeyword").val(),
					s_address:$("#s_address").val(),
					s_concern:$("#s_concern").val(),
					s_frompart:$("#s_frompart").val(),
					s_qq:$("#s_qq").val(),
					s_weixin:$("#s_weixin").val(),
					s_isbaobei:$("#s_isbaobei").val(),
					s_curriculum:$("#updates_curriculum").val(),
					s_record:$("#updates_record").val(),
					s_isvalid:$("#updates_isvalid").val(),
					s_lostvalid:$("#updates_lostvalid").val(),
					s_isreturnvist:$("#updates_isreturnvist").val(),
					s_firstvisittime:$("#updates_firstvisittime").val(),
					s_ishome:$("#updates_ishome").val(),
					s_hometime:$("#updates_hometime").val(),
					s_premoney:$("#updates_premoney").val(),
					s_premoneytime:$("#updates_premoneytime").val(),
					s_ispay:$("#updates_ispay").val(),
					s_paytime:$("#updates_paytime").val(),
					s_money:$("#updates_money").val(),
					s_isreturnmoney:$("#updates_isreturnmoney").val(),
					s_returnmoneycontent:$("#updates_returnmoneycontent").val(),
					s_isinclass:$("#updates_isinclass").val(),
					s_inclasstime:$("#updates_inclasstime").val(),
					s_inclasscontent:$("#updates_inclasscontent").val(),
					s_content:$("#updates_content").val(),
					s_userid:select		
			},
			function(res) {
			if(res>0) {
				alert("修改成功");
				$("#stu-xiugai-dialog").dialog("close");
				$("#StuTab").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
				$("#stu-xiugai-form").form("clear");
			}else{
				alert("修改失败");
			}
		}, "json");
	}
</script>
</head>
<body>
	<table id="stuste" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'s_id',title:'s_id'">id</th>
				<th data-options="field:'s_name',title:'s_name'">姓名</th>
				<th data-options="field:'s_sex',title:'s_sex',formatter:formattersex">性别</th>
				<th data-options="field:'s_age',title:'s_age'">年龄</th>
				<th data-options="field:'s_phone',title:'s_phone'">电话</th>			
				<th data-options="field:'s_state',title:'s_state'">状态</th>			
				<th data-options="field:'s_msgsource',title:'s_msgsource'">来源渠道</th>			
				<th data-options="field:'s_sourceurl',title:'s_sourceurl'">来源网站</th>			
				<th data-options="field:'s_sourcekeyword',title:'s_sourcekeyword'">来源关键词</th>			
				<th data-options="field:'s_qq',title:'s_qq'">学员QQ</th>			
				<th data-options="field:'s_weixin',title:'s_weixin'">微信号</th>			
				<th data-options="field:'s_isbaobei',title:'s_isbaobei',formatter:formatterbaobei">是否报备</th>			
				<th data-options="field:'s_content',title:'s_content'">在线备注</th>			
				<th data-options="field:'s_ispay',formatter:formatterbaobei" >是否缴费</th>				
				<th data-options="field:'s_isvalid',formatter:formatterbaobei" >是否有效</th>		
				<th data-options="field:'s_isreturnvist',formatter:formatterbaobei"  >是否回访</th>	
				<th data-options="field:'s_createtime'"  >创建时间</th>			
				<th data-options="field:'s_hometime'"  >上门时间</th>	
				<th data-options="field:'s_firstvisittime'" >首次回访时间</th>			
				<th data-options="field:'s_paytime'"  >缴费时间</th>		
				<th data-options="field:'s_inclasstime'"  >进班时间</th>	
				<th data-options="field:'s_frompart'"  >录入人</th>	
				<th data-options="field:'u_loginname',formatter:zixunshi">咨询师</th>		
				<th	data-options="field:'caozuo',title:'操作',formatter:formattercaozuo" class="right"></th>
			</tr>
		</thead>
	</table>
	
	<!-- 工具头 -->
	<div id="tb">
		<form id="tabfrm" class="easyui-form">
			<label for="name">姓名:</label> 
			<input class="easyui-validatebox" type="text" id="sname" />
			<label for="name">性别:</label> 
			<input class="easyui-validatebox" type="text" id="sex" />
			<label for="name">电话:</label> 
			<input class="easyui-validatebox" type="text" id="sphone" />
			<label>咨询师</label>
			<select id="studentTyp" class="easyui-combobox" name="dept" style="width:100px;">   
   			 <option>--请选择--</option>
   			</select>
			<label for="name">是否缴费:</label> 
			<input type="radio" name="sispay" value="0" >是
			<input type="radio" name="sispay" value="1">否
			<!-- input class="easyui-validatebox" type="text" id="sispay" /> -->
			<label for="name">是否有效:</label> 
			<input class="easyui-validatebox" type="text" id="sisvalid" />
			<label for="name">是否回访:</label> 
			<input class="easyui-validatebox" type="text" id="sisreturnvist" />
			<label for="name">QQ:</label> 
			<input class="easyui-validatebox" type="text" id="sqq"  />
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
			<table>
				<tr>
					<td>学员姓名：</td>
					<td><input type="text" name="s_name" class="easyui-textbox"></td>
					<td>年龄：</td>
					<td><input type="text" name="s_age" class="easyui-textbox"></td>
				</tr>
				
				<tr>
					<td>性别：</td>
					<td><input type="text" name="s_sex"class="easyui-textbox"  data-options="formatter:formattersex"></td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" name="s_state" class="easyui-textbox"></td>
					<td>学历：</td>
					<td><input type="text" name="s_education" class="easyui-textbox"></td>
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
						
					<input type="text" name="s_isbaobei" class="easyui-textbox" data-options="formatter:formattersex"></td>
				</tr>
				<tr>
					<td>所属咨询师</td>
					<td><input type="text" name="u_loginname" class="easyui-textbox" data-options="formatter:zixunshi"></td>			
					<td>咨询师:</td>
						<td><input class="easyui-textbox" name="s_userid" id="updates_userid" data-options="required:true"></input></td>
						<td>课程方向:</td>
						<td><input class="easyui-textbox" name="s_curriculum" id="updates_curriculum" data-options="required:true"></input></td>
				</tr>			
					<tr>
					<td>打分:</td>
						<td><input class="easyui-textbox" name="s_record" id="updates_record" data-options="required:true"></input>
						</td>
						<td>是否有效:</td>
						<td><input class="easyui-textbox" name="s_isvalid" id="updates_isvalid" data-options="required:true"></input>
						</td>
						<td>无效原因:</td>
						<td><input class="easyui-textbox" name="s_lostvalid" id="updates_lostvalid" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否回访:</td>
						<td><input class="easyui-textbox" name="s_isreturnvist" id="updates_isreturnvist" data-options="required:true"></input>
						</td>
						<td>首次回访时间:</td>
						<td><input class="easyui-datebox" name="s_firstvisittime" id="updates_firstvisittime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否上门:</td>
						<td><input class="easyui-textbox" name="s_ishome"  id="updates_ishome" data-options="required:true"></input>
						</td>
						<td>上门时间:</td>
						<td><input class="easyui-datebox" name="s_hometime" id="updates_hometime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>定金金额:</td>
						<td><input class="easyui-textbox" name="s_premoney" id="updates_premoney" data-options="required:true"></input>
						</td>
						<td>定金时间:</td>
						<td><input class="easyui-datebox" name="s_premoneytime" id="updates_premoneytime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否缴费:</td>
						<td><input class="easyui-textbox" name="s_ispay"  id="updates_ispay" data-options="required:true"></input>
						</td>
						<td>缴费时间:</td>
						<td><input class="easyui-datebox" name="s_paytime" id="updates_paytime" data-options="required:true"></input>
						</td>
						<td>缴费金额:</td>
						<td><input class="easyui-textbox" name="s_money" id="updates_money" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否退费:</td>
						<td><input class="easyui-textbox" name="s_isreturnmoney"  id="updates_isreturnmoney" data-options="required:true"></input>
						</td>
						<td>退费原因:</td>
						<td><input class="easyui-textbox" name="s_returnmoneycontent"  id="updates_returnmoneycontent" data-options="required:true"></input>
						</td>
					</tr>
					
					<tr>
						<td>是否进班:</td>
						<td><input class="easyui-textbox" name="s_isinclass"  id="updates_isinclass" data-options="required:true"></input>
						</td>
						<td>进班时间:</td>
						<td><input class="easyui-datebox" name="s_inclasstime" id="updates_inclasstime" data-options="required:true"></input>
						</td>
						<td>进班备注:</td>
						<td><input class="easyui-textbox" name="s_inclasscontent" id="updates_inclasscontent" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><input class="easyui-textbox" name="s_content" id="updates_content" data-options="required:true"></input>
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
				<tr style="display: none">
						<td>ID:</td>
						<td><input class="easyui-textbox" name="s_id"  id="updates_id" ></input>
						</td>
				</tr>
				<tr>
					<td>学员姓名：</td>
					<td>
						<input type="radio" name="s_name"  value="0">男
						<input type="radio" name="s_name"  value="1">女 
					<!-- <input type="text" name="s_name" id="s_name" class="easyui-textbox"> --></td>
					<td>年龄：</td>
					<td><input type="text" name="s_age" id="s_age" class="easyui-textbox"></td>
				</tr>
				
				<tr>
					<td>性别：</td>
					<td><input type="text" name="s_sex" id="s_sex"class="easyui-textbox"  data-options="formatter:formattersex"></td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" id="s_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" name="s_state" id="s_state" class="easyui-textbox"></td>
					<td>学历：</td>
					<td><input type="text" name="s_education" id="s_education" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" name="s_msgsource" id="s_msgsource" class="easyui-textbox"></td>
					<td>来源网站：</td>
					<td><input type="text" name="s_sourceurl" id="s_sourceurl" class="easyui-textbox"></td>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="s_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>所在区域：</td>
					<td><input type="text" name="s_address" id="s_address" class="easyui-textbox"></td>
					<td>学员qq：</td>
					<td><input type="text" name="s_qq" id="s_qq" class="easyui-textbox"></td>
					<td>客户微信：</td>
					<td><input type="text" name="s_weixin" id="s_weixin" class="easyui-textbox"></td>
				</tr>
				<tr> 
					<td>来源部门：</td>
					<td><input type="text" name="s_frompart" id="s_frompart" class="easyui-textbox"></td>
					
					<td>关注：</td>
					<td><input type="text" name="s_concern" id="s_concern" class="easyui-textbox"></td>
					<td>是否报备：</td>
					<td>
						<!-- <input type="radio" name="baobei"  value="0">是
						<input type="radio" name="baobei"  value="1">否 -->
					<input type="text" name="s_isbaobei" id="s_isbaobei" class="easyui-textbox" data-options="formatter:formattersex"></td>
				</tr>
				<tr>
					<td>所属咨询师</td>
					<td><select id="studentTyp" class="easyui-combobox" name="dept" style="width:100px;">   
		   			</select></td>			
					
						<td>课程方向:</td>
						<td><input class="easyui-textbox" id="s_curriculum" name="s_curriculum" id="updates_curriculum" data-options="required:true"></input></td>
				</tr>			
					<tr>
					<td>打分:</td>
						<td><input class="easyui-textbox" name="s_record" id="updates_record" data-options="required:true"></input>
						</td>
						<td>是否有效:</td>
						<td><input class="easyui-textbox" name="s_isvalid" id="updates_isvalid" data-options="required:true"></input>
						</td>
						<td>无效原因:</td>
						<td><input class="easyui-textbox" name="s_lostvalid" id="updates_lostvalid" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否回访:</td>
						<td><input class="easyui-textbox" name="s_isreturnvist" id="updates_isreturnvist" data-options="required:true"></input>
						</td>
						<td>首次回访时间:</td>
						<td><input class="easyui-datebox" name="s_firstvisittime" id="updates_firstvisittime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否上门:</td>
						<td><input class="easyui-textbox" name="s_ishome"  id="updates_ishome" data-options="required:true"></input>
						</td>
						<td>上门时间:</td>
						<td><input class="easyui-datebox" name="s_hometime" id="updates_hometime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>定金金额:</td>
						<td><input class="easyui-textbox" name="s_premoney" id="updates_premoney" data-options="required:true"></input>
						</td>
						<td>定金时间:</td>
						<td><input class="easyui-datebox" name="s_premoneytime" id="updates_premoneytime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否缴费:</td>
						<td><input class="easyui-textbox" name="s_ispay"  id="updates_ispay" data-options="required:true"></input>
						</td>
						<td>缴费时间:</td>
						<td><input class="easyui-datebox" name="s_paytime" id="updates_paytime" data-options="required:true"></input>
						</td>
						<td>缴费金额:</td>
						<td><input class="easyui-textbox" name="s_money" id="updates_money" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否退费:</td>
						<td><input class="easyui-textbox" name="s_isreturnmoney"  id="updates_isreturnmoney" data-options="required:true"></input>
						</td>
						<td>退费原因:</td>
						<td><input class="easyui-textbox" name="s_returnmoneycontent"  id="updates_returnmoneycontent" data-options="required:true"></input>
						</td>
					</tr>
					
					<tr>
						<td>是否进班:</td>
						<td><input class="easyui-textbox" name="s_isinclass"  id="updates_isinclass" data-options="required:true"></input>
						</td>
						<td>进班时间:</td>
						<td><input class="easyui-datebox" name="s_inclasstime" id="updates_inclasstime" data-options="required:true"></input>
						</td>
						<td>进班备注:</td>
						<td><input class="easyui-textbox" name="s_inclasscontent" id="updates_inclasscontent" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><input class="easyui-textbox" name="s_content" id="updates_content" data-options="required:true"></input>
						</td>
					</tr>
			</table>
		</form>
	</div>
	
	<!-- 添加 -->
	<div id="stu-tianjia-dialog" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
				text:'提交',
				handler:function(){
				insertSubmission()}
			},{
				text:'重置',
				handler:function(){
				insertReset()}
			}]">
		<form id="stu-tianjia-form" class="easyui-form">
			<table>
				<tr style="display:none;">
					<td>编号：</td>
					<td><input type="text" name="s_id" id="inserts_id" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="s_name" id="inserts_name" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" name="s_sex" id="inserts_sex" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" id="inserts_age" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" name="s_phone" id="inserts_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td><input type="text" name="s_education" id="inserts_education" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>状态：</td>
					<td><input type="text" name="s_state" id="inserts_state" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" name="s_msgsource" id="inserts_msgsource" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><input type="text" name="s_sourceurl" id="inserts_sourceurl" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="inserts_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学员QQ：</td>
					<td><input type="text" name="s_qq" id="inserts_qq" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>微信号：</td>
					<td><input type="text" name="s_weixin" id="inserts_weixin" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td><input type="text" name="s_isbaobei" id="inserts_isbaobei" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>在线备注：</td>
					<td><input type="text" name="s_content" id="inserts_content" class="easyui-textbox"></td>
				</tr>
				
			</table>
		</form>
	</div>
	 
</body>
</html>