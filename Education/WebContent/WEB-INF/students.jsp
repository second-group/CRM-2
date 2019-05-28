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
		shezhidongtai();
		init();
	})
	function init(){
		var s_ispay=$("#s_ispay").combobox("getValue");
		if(s_ispay == "fufei"){
			s_ispay = '';	
		}
		var s_isvalid=$("#s_isvalid").combobox("getValue");
		if(s_isvalid == "youxiao"){
			s_isvalid = '';	
		}
		var s_isreturnvist=$("#s_isreturnvist").combobox("getValue");
		if(s_isreturnvist == "huifang"){
			s_isreturnvist = '';	
		}
		var n_userid='${sessionScope.users.u_id}';
		/* alert(n_userid); */
		$("#stuste").datagrid({
			url:'stuss',
			method:'post',
			singleSelect:true,
			pagination:true,
			toolbar:'#tb',
			queryParams:{	
				s_name:$("#s_name").val(),
				s_phone:$("#s_phone").val(),				
				s_ispay:s_ispay,				
				s_isvalid:s_isvalid,			
				s_isreturnvist:s_isreturnvist,
				s_qq:$("#s_qq").val(),				
				s_createtime:$("#s_createtime").datebox("getValue"),				
				s_hometime:$("#s_hometime").datebox("getValue"),				
				s_firstvisittime:$("#s_firstvisittime").datebox("getValue"),				
				s_paytime:$("#s_paytime").datebox("getValue"),				
				s_inclasstime:$("#s_inclasstime").datebox("getValue"),
				s_userid:n_userid
				
			}
			
		})
		
	}
	/* <a href='javascript:void(0)' onclick='deletestu("+index+")'>删除</a>
		<a href='javascript:void(0)' onclick='shezhi("+index+")'>设置</a>
	*/
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='lookstus("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updatestu("+index+")'>修改</a>  "
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
 
	/* function deletestu(index) {
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
	 */
	
	function lookstus(index){	
		var arr=$("#stuste").datagrid("getData");//获取数据表格加载完成时返回的数据
		var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据
		$("#s_sex").textbox('setValue',row.s_sex==0?"男":"女");
		$("#s_isbaobei").textbox('setValue',row.s_isbaobei==1?"是":"否");
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
		 var row= $('#stuste').datagrid("getRows")[index];  
		 var row=arr.rows[index];//根据我们所选中的行的下标获取选中行的数据 */
		/*  $("#updates_sex").combobox('setValue',row.s_sex==1?"男":"女"); */
		/*  alert(row.s_sex);  */
		$("#stu-xiugai-form").form("load",row);//把我们获取的行中的数据填充但form表单中去
		$("#stu-xiugai-dialog").dialog("open");//打开我们的窗口			
		$("#updates_sex").combobox('setValue',row.s_sex);  
		$("#updates_isbaobei").combobox('setValue',row.s_isbaobei);  
		$("#updates_education").combobox('setValue',row.s_education); 
		$("#updates_state").combobox('setValue',row.s_state); 
		$("#updates_msgsource").combobox('setValue',row.s_msgsource); 
		$("#updates_sourceurl").combobox('setValue',row.s_sourceurl); 
		$("#updates_concern").combobox('setValue',row.s_concern); 
		$("#updates_frompart").combobox('setValue',row.s_frompart); 
		$("#updates_address").combobox('setValue',row.s_address);
		$("#updates_content").combobox('setValue',row.s_content);
		
	}
	function updateSub(){
		/* alert($("#updates_sourcekeyword").val()); */
		 var s_sex=$("#updates_sex").combobox('getValue')=="男"?"1":"0";
		 var s_isbaobei=$("#updates_isbaobei").combobox('getValue')=="是"?"1":"0";
		 var s_sex=$("#updates_sex").combobox("getValue");
		 var s_age=$("#updates_age").val();
		 var s_phone=$("#updates_phone").val();
		 var s_name=$("#updates_name").val();
		 var s_qq=$("#updates_qq").val();
		 if(s_age<18 || s_age>99 || !(/^([0-9]|[0-9]{2}|100)$/.test(s_age))){
			 alert("年龄不符合标准,请输入正确年龄");
		 }else if(!(/^1(3|4|5|7|8)\d{9}$/.test(s_phone))){
			 alert("手机号码有误，请重填");
		 }else if(s_name==""){
			 alert("名字不能为空");
		 }else if(!(/^[1-9][0-9]{4,10}$/.test(s_qq))){
			 alert("QQ输入不符合标准");			 
		 }else{
		$.post("updatestu",{
			s_id:$("#updates_id").val(),
			s_name:$("#updates_name").val(),
			s_sex:$("#updates_sex").combobox("getValue"),
			s_age:$("#updates_age").val(),
			s_phone:$("#updates_phone").val(),
			s_education:$("#updates_education").combobox("getValue"),
			s_state:$("#updates_state").combobox("getValue"),
			s_msgsource:$("#updates_msgsource").combobox("getValue"),
			s_sourceurl:$("#updates_sourceurl").combobox("getValue"),
			s_concern:$("#updates_concern").combobox("getValue"),
			s_frompart:$("#updates_frompart").combobox("getValue"),
			s_address:$("#updates_address").combobox("getValue"),
			s_sourcekeyword:$("#updates_sourcekeyword").val(),
			s_qq:$("#updates_qq").val(),
			s_weixin:$("#updates_weixin").val(),
			s_content:$("#updates_content").val(),
			s_isbaobei:$("#updates_isbaobei").combobox("getValue")
		},function(res){
			if(res>0){
				//修改成功
				$("#stuste").datagrid("reload");
				$("#stu-xiugai-dialog").dialog("close")
				$.messager.alert("提示","修改成功");
				/* $.messager.confirm('提示','是否将本次修改进行提交',function(r){
				        if (r){
				    		alert('已提交');
				        }
				    }); */
			}else{
				//修改失败
				$.messager.alert("提示","修改失败");
			}
		},"json")
		 }
	}
	function tianjiastu(){
		$("#stu-tianjia-dialog").dialog("open");
	}
		
	function insertSubmission(){
		var n_userid='${sessionScope.users.u_id}';
		var s_age=$("#inserts_age").val();
		var s_phone=$("#inserts_phone").val();
		var s_name=$("#inserts_name").val();
		var s_qq=$("#inserts_qq").val();
		if(s_name==""){
			 alert("名字不能为空");
		 }else
		if(s_age<18 || s_age>99 || !(/^([0-9]|[0-9]{2}|100)$/.test(s_age))){
			 alert("年龄不符合标准");
		 }else if(!(/^1(3|4|5|7|8)\d{9}$/.test(s_phone))){
			 alert("手机号码有误，请重填");
		 }else if(!(/^[1-9][0-9]{4,10}$/.test(s_qq))){
			 alert("QQ输入不符合标准");			 
		 }else{
		$.ajax({
			type:"post",//提交方式
			url:"insertStudents",//提交路径
			datatype:"json",//格式
			data:{//传递的参数
				"s_name":$("#inserts_name").val(),
				"s_sex":$("#inserts_sex").combobox("getValue"),
				"s_age":$("#inserts_age").val(),
				"s_phone":$("#inserts_phone").val(),
				"s_education":$("#inserts_education").combobox("getValue"),
				"s_address":$("#inserts_address").combobox("getValue"),
				"s_state":$("#inserts_state").combobox("getValue"),
				"s_msgsource":$("#inserts_msgsource").combobox("getValue"),
				"s_sourceurl":$("#inserts_sourceurl").combobox("getValue"),
				"s_sourcekeyword":$("#inserts_sourcekeyword").val(),
				"s_concern":$("#inserts_concern").combobox("getValue"),
				"s_frompart":$("#inserts_frompart").combobox("getValue"),
				"s_qq":$("#inserts_qq").val(),
				"s_weixin":$("#inserts_weixin").val(),
				"s_isbaobei":$("#inserts_isbaobei").combobox("getValue"),
				"s_content":$("#inserts_content").val(),
				"s_userid":n_userid
				
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
	}
	//添加的重置操作方法
	function insertReset(){
		$("#stu-tianjia-form").form("reset")
	}
	
	function shezhidongtai() {
	    var createGridHeaderContextMenu = function(e, field) {
	        e.preventDefault();
	        var grid = $(this);
	        var headerContextMenu = this.headerContextMenu;
	        if (!headerContextMenu) {
	            var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
	            var fields = grid.datagrid('getColumnFields');
	            for (var i = 0; i < fields.length; i++) {
	                var fildOption = grid.datagrid('getColumnOption', fields[i]);
	                if (!fildOption.hidden) {
	                    $('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu)
	                } else {
	                    $('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu)
	                }
	            }
	            headerContextMenu = this.headerContextMenu = tmenu.menu({
	                onClick: function(item) {
	                    var field = $(item.target).attr('field');
	                    if (item.iconCls == 'icon-ok') {
	                        grid.datagrid('hideColumn', field);
	                        $(this).menu('setIcon', {
	                            target: item.target,
	                            iconCls: 'icon-empty'
	                        })
	                    } else {
	                        grid.datagrid('showColumn', field);
	                        $(this).menu('setIcon', {
	                            target: item.target,
	                            iconCls: 'icon-ok'
	                        })
	                    }
	                }
	            })
	        }
	        headerContextMenu.menu('show', {
	            left: e.pageX,
	            button: e.pageY
	        })
	    };
	    $.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	    $.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu
	}
	
	function dongtai(){
	    $.messager.confirm('提示','是否将本次修改进行提交',function(r){
	        if (r){
	    		alert('已提交');
	        }
	    });
	}
	
 	$.extend($.fn.validatebox.defaults.rules, {    
	    phoneLength: {    
	        validator: function(value, param){    
	            return value.length == param[0];    
	        },    
	        message: '电话号必须符合要求'   
	    }  
	});
 	/*	$.extend($.fn.validatebox.defaults.rules, {   
	 ageLength: {    
	        validator: function(value, param){    
	            return value.length == param[0];    
	        },    
	        message: '年龄输入必须符合要求呀'   
	    }
	});   */

	</script>
</head>
<body>
	<table id="stuste" data-options="fitColumns:true,checkbox: true" >  
		<thead>
			<tr>
				<th data-options="field:'s_id',title:'s_id'">id</th>
				<th data-options="field:'s_name',title:'s_name'">姓名</th>
				<th data-options="field:'s_sex',title:'s_sex',formatter:formattersex">性别</th>
				<th data-options="field:'s_age',title:'s_age'">年龄</th>
				<th data-options="field:'s_phone',title:'s_phone'">电话</th>
				<th data-options="field:'s_education',title:'s_education'">学历</th>	 
				<th field="s_stuclass" hidden="true">课程方向</th> 			
				<th data-options="field:'s_state',title:'s_state'">状态</th>	 
				<th data-options="field:'s_msgsource',title:'s_msgsource'">来源渠道</th>			
				<th data-options="field:'s_sourceurl',title:'s_sourceurl'">来源网站</th>			
				<th data-options="field:'s_sourcekeyword',title:'s_sourcekeyword'">来源关键词</th>			
				<th data-options="field:'s_qq',title:'s_qq'">学员QQ</th>			
				<th data-options="field:'s_weixin',title:'s_weixin'">微信号</th>			
				<th data-options="field:'s_isbaobei',title:'s_isbaobei',formatter:formatterbaobei">是否报备</th>										
				<th field="s_ispay" hidden="true">是否缴费</th>	
				<th field="s_concern" title="s_sourceurl">关注</th>				
				<th field="s_frompart">来源部门</th>				
				<th field="s_address">所在区域</th>	
				<th data-options="field:'s_content',title:'s_content'" hidden="true">在线备注</th>			
				<th field="s_record" hidden="true">打分</th>			
				<th field="s_isvalid" hidden="true" formatter="formatterisvalid">是否有效</th>		
				<th field="s_isreturnvist" hidden="true" formatter="formatterisreturnvist">是否回访</th>	
				<th field="s_createtime">创建时间</th>		
				<th field="s_hometime" hidden="true">上门时间</th>	
				<th field="s_firstvisittime" hidden="true">首次回访时间</th>			
				<th field="s_paytime" hidden="true">缴费时间</th>			
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
						<select style="width: 100px" id="s_ispay" class="easyui-combobox">
							<option value="fufei">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
			
			<label for="name">是否有效:</label> 
						<select style="width: 100px" id="s_isvalid" class="easyui-combobox">
							<option value="youxiao">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
			<label for="name">是否回访:</label> 
						<select style="width: 100px" id="s_isreturnvist" class="easyui-combobox">
							<option value="huifang">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
			    		
			<label for="name">QQ:</label> 
			<input class="easyui-validatebox" type="text" id="s_qq"  />
			<label for="name">创建时间:</label> 
			<input type="text" id="s_createtime" class="easyui-datebox" />
			<br/>
			<label for="name">上门时间:</label> 
			<input type="text" id="s_hometime" class="easyui-datebox"/>
			<label for="name">首次回访时间:</label> 
			<input type="text" id="s_firstvisittime" class="easyui-datebox" />
			<label for="name">缴费时间:</label> 
			<input type="text" id="s_paytime" class="easyui-datebox" />
			<label for="name">进班时间:</label> 
			<input type="text" id="s_inclasstime" class="easyui-datebox" />
			 <a href="javascript:void(0)" onclick="init()"	class="easyui-linkbutton"	data-options="iconCls:'icon-search',plain:true">搜索</a>
			  <a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
			  <a href="javascript:void(0);" onclick="dongtai()" class="easyui-linkbutton" iconCls='icon-edit'>动态</a>
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
					<td><input type="text" name="s_name" class="easyui-textbox" readonly="readonly"></td>
					<td>年龄：</td>
					<td><input type="text" name="s_age" class="easyui-textbox" readonly="readonly"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td> <input type="text" name="s_sexs" class="easyui-textbox" readonly="readonly" id="s_sex">
					</td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" class="easyui-textbox" readonly="readonly"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" id="s_state" name="s_state" class="easyui-textbox" readonly="readonly"></td>
					<td>学历：</td>
					<td><input type="text" class="easyui-textbox" readonly="readonly" id="s_education" name="s_education"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" id="s_msgsource" class="easyui-textbox" readonly="readonly" name="s_msgsource"></td>
					<td>来源网站：</td>
					<td><input type="text" id="s_sourceurl" class="easyui-textbox" readonly="readonly" name="s_sourceurl"></td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" class="easyui-textbox" readonly="readonly"></td>
					<td>所在区域：</td>
					<td><input type="text" id="s_address" class="easyui-textbox" readonly="readonly" name="s_address"></td>
				</tr>
				<tr>
					<td>学员qq：</td>
					<td><input type="text" name="s_qq" class="easyui-textbox" readonly="readonly"></td>
					<td>客户微信：</td>
					<td><input type="text" name="s_weixin" class="easyui-textbox" readonly="readonly"></td>
				</tr>
				<tr> 
					<td>来源部门：</td>
					<td><input type="text" id="s_frompart" class="easyui-textbox" readonly="readonly" name="s_frompart"></td>
					<td>关注：</td>
					<td><input type="text" id="s_concern" class="easyui-textbox" readonly="readonly" name="s_concern"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td><input type="text" name="s_isbaobeis" class="easyui-textbox" readonly="readonly" id="s_isbaobei">
					</td>
					<td>创建时间：</td>
					<td><input type="text" id="s_createtime" class="easyui-textbox" readonly="readonly" name="s_createtime"></td>
				</tr>
				<tr>
				<td>在线备注</td>
					<td>
					<textarea rows="4" cols="40" id="s_content" readonly="readonly" name="s_content"></textarea>
						<!-- <input type="text" id="s_content" class="easyui-textbox" readonly="true" name="s_content"> -->
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
				<tr style="display:none;">
					<td>编号：</td>
					<td><input type="text" name="s_id" id="updates_id" class="easyui-textbox"></td>
				</tr>
				<tr>
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
				</tr>
				<tr>
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
					<td>状态：</td>
					<td>
						<select style="width: 100px" id="updates_state" class="easyui-combobox">
							<option value="zhuangtai">请选择</option>
				    		<option value="未知">未知</option>
		    				<option value="待业">待业</option>
		    				<option value="在职">在职</option>
			    		</select>
					</td>
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr> 
				<tr>
					<td>学员QQ：</td>
					<td><input type="text" name="s_qq" id="updates_qq" class="easyui-textbox"></td>
					<!-- <td><input type="text" name="s_qq" id="updates_qq" class="easyui-numberbox" data-options="required:true,validType:'length[5,11]'"></td> -->
					<td>微信号：</td>
					<td><input type="text" name="s_weixin" id="updates_weixin" class="easyui-textbox" data-options="required:true,validType:'length[5,20]'"></td>
				</tr>
				
				<tr>
					<td>是否报备：</td>
					<td>
						<select style="width: 100px" id="updates_isbaobei" class="easyui-combobox">
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
					</td>
					<td>在线备注：</td>
					<td>
					<textarea rows="4" cols="30" name="s_content" id="updates_content"></textarea>
					<!-- <input type="text" name="s_content" id="updates_content" class="easyui-textbox"> --></td>
				</tr>			
			</table>
		</form>
	</div>
	
	<!-- 添加 -->
	<div id="stu-tianjia-dialog" data-toggle="topjui-radio" class="easyui-dialog" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:[{
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
					<td><input type="text" name="s_name" id="inserts_name" class="easyui-textbox" required="true"></td>
					<td>性别：</td>
					<td>
						<select style="width: 100px" id=inserts_sex class="easyui-combobox" class="easyui-textbox">
							<option>请选择</option>
				    		<option value="1">女</option>
		    				<option value="0">男</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" id="inserts_age" class="easyui-textbox" class="easyui-validatebox" required="true"></td>
					<td>电话：</td>
					<td><input type="text" name="s_phone" id="inserts_phone" class="easyui-textbox" class="easyui-validatebox" required="true" data-options="validType:'phoneLength[11]'"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td>
						<select style="width: 100px" id="inserts_education" class="easyui-combobox">
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
					<td>所在区域：</td>
					<td>
							<select style="width: 100px" id="inserts_address" class="easyui-combobox" required="true">
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
				</tr>
				
				<tr>
					<td>状态：</td>
					<td>
						<select style="width: 100px" id="inserts_state" class="easyui-combobox">
							<option value="zhuangtai">请选择</option>
				    		<option value="未知">未知</option>
		    				<option value="待业">待业</option>
		    				<option value="在职">在职</option>
			    		</select>
					</td>
					<td>来源渠道：</td>
					<td>
						<select style="width:100px" id="inserts_msgsource" class="easyui-combobox">
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
				</tr>
				<tr>
					<td>来源网站：</td>
					<td>
						<select style="width: 100px" id="inserts_sourceurl" class="easyui-combobox">
							<option value="wangzhan">请选择</option>
				    		<option value="其它">其它</option>
		    				<option value="职英B站">职英B站</option>
		    				<option value="高考站">高考站</option>
		    				<option value="职英A站">职英A站</option>
			    		</select>
					</td>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="inserts_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				<tr>
					<td>学员关注：</td>
					<td>
						<select style="width: 100px" id="inserts_concern" class="easyui-combobox">
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
					<td>来源部门：</td>
					<td>
						<select style="width: 100px" id="inserts_frompart" class="easyui-combobox">
							<option value="bumen">请选择</option>
				    		<option value="网络">网络</option>
		    				<option value="市场">市场</option>
		    				<option value="教质">教质</option>
		    				<option value="学术">学术</option>
		    				<option value="就业">就业</option>
			    		</select>
					
					</td>
				</tr> 
				<tr>
					<td>学员QQ：</td>
					<td><input type="text" name="s_qq" id="inserts_qq" class="easyui-textbox"></td>
					<td>微信号：</td>
					<td><input type="text" name="s_weixin" id="inserts_weixin" class="easyui-textbox" data-options="validType:'length[5,20]'"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td>
						<select style="width: 100px" id=inserts_isbaobei class="easyui-combobox">
							<option>请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
					</td>
					<td>在线备注：</td>
					
					<td><textarea rows="4" cols="30" name="s_content" id="inserts_content">
					</textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
<script type="text/javascript">
function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
	//如果jsondata不是对象，那么json.parse将分析对象中的json字符串。
	var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
	var CSV = '';

	//在第一行拼接标题
	CSV += ReportTitle + '\r\n\n';

	//产生数据标头
	if (ShowLabel) {
		var row = "";
		//此循环将从数组的第一个索引中提取标签
		for ( var index in arrData[0]) {

			//现在将每个值转换为字符串和逗号分隔
			row += index + ',';
		}

		row = row.slice(0, -1);

		//添加带换行符的标签行
		CSV += row + '\r\n';
	}

	//第一个循环是提取每一行
	for (var i = 0; i < arrData.length; i++) {
		var row = "";

		//2nd loop will extract each column and convert it in string comma-seprated
		for ( var index in arrData[i]) {
			row += '"' + arrData[i][index] + '",';
		}

		row.slice(0, row.length - 1);

		//add a line break after each row
		CSV += row + '\r\n';
	}

	if (CSV == '') {
		alert("Invalid data");
		return;
	}

	//Generate a file name
	var fileName = "我的学生_";
	//this will remove the blank-spaces from the title and replace it with an underscore
	fileName += ReportTitle.replace(/ /g, "_");

	//Initialize file format you want csv or xls
	//var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
	var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURI(CSV);

	// Now the little tricky part.
	// you can use either>> window.open(uri);
	// but this will not work in some browsers
	// or you will not get the correct file extension    

	//this trick will generate a temp <a /> tag
	var link = document.createElement("a");
	link.href = uri;

	//set the visibility hidden so it will not effect on your web-layout
	link.style = "visibility:hidden";
	link.download = fileName + ".csv";

	//this part will append the anchor tag and remove it after automatic click
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}

$("#btnExport").click(function() {
	var data = JSON.stringify($('#stuste').datagrid('getData').rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});
</script>
</html>