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
		init();
	})
	function init(){
		$("#stuste").datagrid({
			url:'stuss',
			method:'post',
			pagination:true,
			toolbar:'#tb',
			queryParams:{	
				s_name:$("#s_name").val(),
				s_phone:$("#s_phone").val(),
				s_ispay:$("#s_ispay").val(),				
				s_isvalid:$("#s_isvalid").val(),				
				s_isreturnvist:$("#s_isreturnvist").val(),				
				s_qq:$("#s_qq").val(),				
				s_createtime:$("#s_createtime").datebox("getValue"),				
				s_hometime:$("#s_hometime").datebox("getValue"),				
				s_firstvisittime:$("#s_firstvisittime").datebox("getValue"),				
				s_paytime:$("#s_paytime").datebox("getValue"),				
				s_inclasstime:$("#s_inclasstime").datebox("getValue")		
				
			}
			
		})
		
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='lookstus("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updatestu("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deletestu("+index+")'>删除</a>"
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
	
	function deletestu(index) {
		var data=$("#stuste").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm("提示","确认删除么？",function(res){
			if(res){
				$.post("deletestus",{
					s_id:row.s_id
				},function(res){
					if(res>0){
						$("#stuste").datagrid("reload");
						$.messager.alert("提示","删除成功")
					}else{
						$.messager.alert("提示","删除失败")
					}
				},"json")
			}
		})
		
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
	function updateReset(){
		$("#stu-xiugai-dialog").dialog("close");//关闭窗口
	}
	function updatestu(index){
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据
		$("#stu-xiugai-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
		$("#stu-xiugai-dialog").dialog("open");//打开我们的窗口			
		
	}
	function updateSub(){
		$.post("updatestu",{
			s_id:$("#updates_id").val(),
			s_name:$("#updates_name").val(),
			s_sex:$("#updates_sex").val(),
			s_age:$("#updates_age").val(),
			s_phone:$("#updates_phone").val(),
			s_education:$("#updates_education").val(),
			s_state:$("#updates_state").val(),
			s_msgsource:$("#updates_msgsource").val(),
			s_sourceurl:$("#updates_sourceurl").val(),
			s_sourcekeyword:$("#updates_sourcekeyword").val(),
			s_address:$("#updates_address").val(),
			s_concern:$("#updates_concern").val(),
			s_frompart:$("#updates_frompart").val(),
			s_qq:$("#updates_qq").val(),
			s_weixin:$("#updates_weixin").val(),
			s_isbaobei:$("#updates_isbaobei").val()
		},function(res){
			if(res>0){
				//修改成功
				$("#stuste").datagrid("reload");
				$("#stu-xiugai-dialog").dialog("close")
				$.messager.alert("提示","修改成功");
			}else{
				//修改失败
				$.messager.alert("提示","修改失败");
			}
			
		},"json")
		
	}
	function tianjiastu(){
		$("#stu-tianjia-dialog").dialog("open");
	}
		
	function insertSubmission(){
		$.ajax({
			type:"post",//提交方式
			url:"insertStudents",//提交路径
			datatype:"json",//格式
			data:{//传递的参数
				"s_name":$("#inserts_name").val(),
				"s_sex":$("#inserts_sex").val(),
				"s_age":$("#inserts_age").val(),
				"s_phone":$("#inserts_phone").val(),
				"s_education":$("#inserts_education").val(),
				"s_state":$("#inserts_state").val(),
				"s_msgsource":$("#inserts_msgsource").val(),
				"s_sourceurl":$("#inserts_sourceurl").val(),
				"s_sourcekeyword":$("#inserts_sourcekeyword").val(),
				"s_qq":$("#inserts_qq").val(),
				"s_weixin":$("#inserts_weixin").val(),
				"s_isbaobei":$("#inserts_isbaobei").val(),
				"s_content":$("#inserts_content").val()
				
			},
			success:function(res){//回调
				if(res>0){//判断回调的，受影响的行数是否大于零
					$("#stuste").datagrid("reload");//刷新表格
					$.messager.alert('提示','添加成功');//提示信息
					$("#stu-tianjia-dialog").dialog("close");//关闭窗口
				}
			}
		})		
	}
	//添加的重置操作方法
	function insertReset(){
		$("#stu-tianjia-form").form("reset")
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
				<th data-options="field:'s_education',title:'s_education'">学历</th>			
				<th field="s_stuclass" hidden="true">课程方向</th>			
				<!-- <th data-options="field:'s_stuclass',title:'s_stuclass'">课程方向</th>	 -->		
				<th data-options="field:'s_state',title:'s_state'">状态</th>			
				<th data-options="field:'s_msgsource',title:'s_msgsource'">来源渠道</th>			
				<th data-options="field:'s_sourceurl',title:'s_sourceurl'">来源网站</th>			
				<th data-options="field:'s_sourcekeyword',title:'s_sourcekeyword'">来源关键词</th>			
				<th data-options="field:'s_qq',title:'s_qq'">学员QQ</th>			
				<th data-options="field:'s_weixin',title:'s_weixin'">微信号</th>			
				<th data-options="field:'s_isbaobei',title:'s_isbaobei',formatter:formatterbaobei">是否报备</th>			
				<th data-options="field:'s_content',title:'s_content'">在线备注</th>			
				<!-- <th data-options="field:'s_ispay',title:'s_ispay',formatter:formatterispay">是否缴费</th> -->
				<th field="s_ispay" hidden="true">是否缴费</th>				
				<!-- <th data-options="field:'s_isvalid',title:'s_isvalid',formatter:formatterisvalid">是否有效</th> -->	
				<th field="s_isvalid" hidden="true">是否有效</th>		
				<!-- <th data-options="field:'s_isreturnvist',title:'s_isreturnvist',formatter:formatterisreturnvist">是否回访</th>			 -->
				<th field="s_isreturnvist" hidden="true">是否回访</th>	
				<!-- <th data-options="field:'s_createtime',title:'s_createtime'">创建时间</th>	 -->
				<th field="s_createtime" hidden="true">创建时间</th>			
				<!-- <th data-options="field:'s_hometime',title:'s_hometime'">上门时间</th>	 -->	
				<th field="s_hometime" hidden="true">上门时间</th>	
				<!-- <th data-options="field:'s_firstvisittime',title:'s_firstvisittime'">首次回访时间</th>	 -->
				<th field="s_firstvisittime" hidden="true">首次回访时间</th>			
				<!-- <th data-options="field:'s_paytime',title:'s_paytime'">缴费时间</th> -->
				<th field="s_paytime" hidden="true">缴费时间</th>			
				<!-- <th data-options="field:'s_inclasstime',title:'s_inclasstime'">进班时间</th> -->
				<th field="s_inclasstime" hidden="true">进班时间</th>				
				<th	data-options="field:'caozuo',title:'操作',formatter:formattercaozuo" class="right"></th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<form id="tabfrm" class="easyui-form">
			
			<label for="name">姓名:</label> 
			<input class="easyui-validatebox" type="text" id="s_name" />
			<label for="name">电话:</label> 
			<input class="easyui-validatebox" type="text" id="s_phone" />
			<label for="name">是否缴费:</label> 
			<input class="easyui-validatebox" type="text" id="s_ispay" />
			<label for="name">是否有效:</label> 
			<input class="easyui-validatebox" type="text" id="s_isvalid" />
			<label for="name">是否回访:</label> 
			<input class="easyui-validatebox" type="text" id="s_isreturnvist" />
			<label for="name">QQ:</label> 
			<input class="easyui-validatebox" type="text" id="s_qq"  />
			<label for="name">创建时间:</label> 
			<input type="text" id="s_createtime" class="easyui-datebox" />
			<label for="name">上门时间:</label> 
			<input type="text" id="s_hometime" class="easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
			<input type="text" id="s_firstvisittime" class="easyui-datebox" />
			<label for="name">缴费时间:</label> 
			<input type="text" id="s_paytime" class="easyui-datebox" />
			<label for="name">进班时间:</label> 
			<input type="text" id="s_inclasstime" class="easyui-datebox" />

			 <a href="javascript:void(0)" onclick="init()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">添加</a>
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
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" name="s_sex"class="easyui-textbox"  data-options="formatter:formattersex"></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" name="s_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" name="s_state" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td><input type="text" name="s_education" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" name="s_msgsource" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><input type="text" name="s_sourceurl" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>所在区域：</td>
					<td><input type="text" name="s_address" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学员qq：</td>
					<td><input type="text" name="s_qq" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>客户微信：</td>
					<td><input type="text" name="s_weixin" class="easyui-textbox"></td>
				</tr>
				<!-- <tr>
					<td>备注：</td>
					<td><input type="text" name="s_content" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>创建时间：</td>
					<td><input type="text" name="s_createtime" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否有效：</td>
					<td><input type="text" name="s_isvalid" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>打分：</td>
					<td><input type="text" name="s_record" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否回访：</td>
					<td><input type="text" name="s_isreturnvist" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>首次回访时间：</td>
					<td><input type="text" name="s_firstvisittime" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否上门：</td>
					<td><input type="text" name="s_ishome" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>上门时间：</td>
					<td><input type="text" name="s_hometime" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>无效原因：</td>
					<td><input type="text" name="s_lostvalid" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否缴费：</td>
					<td><input type="text" name="s_ispay" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>缴费时间：</td>
					<td><input type="text" name="s_paytime" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>缴费金额：</td>
					<td><input type="text" name="s_money" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否退费：</td>
					<td><input type="text" name="s_isreturnmoney" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否进班：</td>
					<td><input type="text" name="s_isinclass" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>进班时间：</td>
					<td><input type="text" name="s_inclasstime" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>进班备注：</td>
					<td><input type="text" name="s_inclasscontent" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否删除：</td>
					<td><input type="text" name="s_isdel" class="easyui-textbox"></td>
				</tr>-->
				<tr> 
					<td>来源部门：</td>
					<td><input type="text" name="s_frompart" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>关注：</td>
					<td><input type="text" name="s_concern" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td><input type="text" name="s_isbaobei" class="easyui-textbox" data-options="formatter:formattersex"></td>
				</tr>
				<!-- <tr>
					<td>用户编号：</td>
					<td><input type="text" name="s_userid" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>退费原因：</td>
					<td><input type="text" name="s_returnmoneycontent" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>定金金额：</td>
					<td><input type="text" name="s_premoney" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>定金时间：</td>
					<td><input type="text" name="s_premoneytime" class="easyui-textbox"></td>
				</tr> -->
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
				<tr style="display:none;">
					<td>编号：</td>
					<td><input type="text" name="s_id" id="updates_id" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="s_name" id="updates_name" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" name="s_sex" id="updates_sex" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" id="updates_age" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" name="s_phone" id="updates_phone" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td><input type="text" name="s_education" id="updates_education" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>状态：</td>
					<td><input type="text" name="s_state" id="updates_state" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" name="s_msgsource" id="updates_msgsource" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><input type="text" name="s_sourceurl" id="updates_sourceurl" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="updates_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>所在区域：</td>
					<td><input type="text" name="s_address" id="updates_address" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学员关注：</td>
					<td><input type="text" name="s_concern" id="updates_concern" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>来源部门：</td>
					<td><input type="text" name="s_frompart" id="updates_frompart" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学员QQ：</td>
					<td><input type="text" name="s_qq" id="updates_qq" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>微信号：</td>
					<td><input type="text" name="s_weixin" id="updates_weixin" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td><input type="text" name="s_isbaobei" id="updates_isbaobei" class="easyui-textbox"></td>
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