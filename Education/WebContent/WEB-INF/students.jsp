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
			pagination:true,
			toolbar:'#tb',
			queryParams:{	
				s_name:$("#s_name").val(),
				s_phone:$("#s_phone").val(),
				/* s_ispay:$("#s_ispay").val(), */	
				s_ispay:s_ispay,
				/* s_isvalid:$("#s_isvalid").val(), */
				s_isvalid:s_isvalid,
				/* s_isreturnvist:$("#s_isreturnvist").val(),		 */
				s_isreturnvist:s_isreturnvist,
				s_qq:$("#s_qq").val(),				
				s_createtime:$("#s_createtime").datebox("getValue"),				
				s_hometime:$("#s_hometime").datebox("getValue"),				
				s_firstvisittime:$("#s_firstvisittime").datebox("getValue"),				
				s_paytime:$("#s_paytime").datebox("getValue"),				
				s_inclasstime:$("#s_inclasstime").datebox("getValue"),
				n_userid:n_userid
				
			}
			
		})
		
	}
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='lookstus("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updatestu("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deletestu("+index+")'>删除</a> <a href='javascript:void(0)' onclick='shezhi("+index+")'>设置</a>"
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
 function formatterxueli(value,row,index) {
	 var res='';	 
	 switch(value){
	 case '0':
		res="未知";
		break;
	 case '1':
			res="大专";
			break;
	 case '2':
			res="高中";
			break;
	 case '3':
			res="中专";
			break;
	 case '4':
			res="初中";
			break;
	 case '5':
			res="本科";
			break;
	 case '6':
			res="其它";
			break;
	 case '7':
			res="研究生";
			break;
	 }
	 
		return res;
	} 
 
 	 function formatterzhuangtai(value,row,index){
 		 var res='';	 
 		 switch(value){
 		 case '0':
 			res="未知";
 			break;
 		 case '1':
 				res="待业";
 				break;
 		 case '2':
 				res="在职";
 				break;
 		case '3':
				res="在读";
				break;
 		
 	}
 		 return res;
 	} 
 	
 		function formatterqudao(value,row,index){
 		var res='';	 
 		 switch(value){
 		 case '0':
 			res="未知";
 			break;
 		 case '1':
 				res="百度";
 				break;
 		 case '2':
 				res="百度移动端";
 				break;
 		 case '3':
 				res="360";
 				break;
 		 case '4':
 				res="360移动端";
 				break;
 		 case '5':
 				res="搜狗";
 				break;
 		 case '6':
 				res="搜狗移动端";
 				break;
 		 case '7':
 				res="UC移动端";
 				break;
 		case '8':
				res="直接输入";
				break;
 		case '9':
				res="自然流量";
				break;
 		case '10':
				res="直电";
				break;
 		case '11':
				res="微信";
				break;
 		case '12':
				res="QQ";
				break;
 		 }
 			return res;
 		} 
 		
 		function formatterwangzhan(value,row,index){
 		var res='';	 
		 switch(value){
		 case '0':
			res="其它";
			break;
		 case '1':
				res="职英B站";
				break;
		 case '2':
				res="高考站";
				break;
		 case '3':
				res="职英A站";
				break;
 	}
		 return res;
 	}
 	
 	function formatterconcern(value,row,index){
 		var res='';	 
		 switch(value){
		 case '0':
			res="课程";
			break;
		 case '1':
				res="学费";
				break;
		 case '2':
				res="学时";
				break;
		 case '3':
				res="学历";
				break;
 		
		 case '4':
				res="师资";
				break;
 		
		 case '5':
				res="就业";
				break;
		 case '6':
				res="环境";
				break;
		 case '7':
				res="其他";
				break;
 	}
 	return res;
 	}
 	
 	function formatterfrompart(value,row,index){
 		var res='';	 
		 switch(value){
		 case '0':
			res="网络";
			break;
		 case '1':
				res="市场";
				break;
		 case '2':
				res="教质";
				break;
		 case '3':
				res="学术";
				break;
		
		 case '4':
				res="就业";
				break;	
 	}
		 return res;
 	}
 	
 	
 	function formatteraddress(value,row,index){
 		var res='';	 
		 switch(value){
		 case '0':
			res="未知";
			break;
		 case '1':
				res="其它";
				break;
		 case '2':
				res="郑州";
				break;
		 case '3':
				res="开封";
				break;
		
		 case '4':
				res="洛阳";
				break;
		
		 case '5':
				res="南阳";
				break;
		 case '6':
				res="漯河";
				break;
		 case '7':
				res="三门峡";
				break;
		 case '8':
				res="平顶山";
				break;
		 case '9':
				res="周口";
				break;
		 case '10':
				res="驻马店";
				break;
		 case '11':
				res="新乡";
				break;
		 case '12':
				res="鹤壁";
				break;
		 case '13':
				res="焦作";
				break;
		 case '14':
				res="濮阳";
				break;
		 case '15':
				res="安阳";
				break;
		 case '16':
				res="商丘";
				break;
		 case '17':
				res="信阳";
				break;
		 case '18':
				res="济源";
				break;
	}
	return res;
	}
 	
 	function formatterkecheng(value,row,index){
 		var res='';	 
		 switch(value){
		 case '0':
			res="软件开发";
			break;
		 case '1':
				res="软件设计";
				break;
		 case '2':
				res="网络营销";
				break;
 	}
		 return res;
 	}
 	
 	function formatterrecord(value,row,index){
 		var res='';	 
		 switch(value){
		 case 0:
			res="近期可报名";
			break;
		 case 1:
				res="一个月内可报名";
				break;
		 case 2:
				res="长期跟踪";
				break;
		 case 3:
				res="无效";
				break;
	}
		 return res;
 		
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
		function formatters(){
	 		var res='';	 
			 switch(row.s_education){
			 case '0':
					res="未知";
					break;
				 case '1':
						res="大专";
						break;
				 case '2':
						res="高中";
						break;
				 case '3':
						res="中专";
						break;
				 case '4':
						res="初中";
						break;
				 case '5':
						res="本科";
						break;
				 case '6':
						res="其它";
						break;
				 case '7':
						res="研究生";
						break;
	 	}
			 return res;
	 	}
		
		function formatter1(){
	 		 var res='';	 
	 		 switch(row.s_state){
	 		 case '0':
	 			res="未知";
	 			break;
	 		 case '1':
	 				res="待业";
	 				break;
	 		 case '2':
	 				res="在职";
	 				break;
	 		case '3':
					res="在读";
					break;
	 		
	 	}
	 		 return res;
	 	} 

		function formatter2(){
	 		var res='';	 
	 		 switch(row.s_msgsource){
	 		 case '0':
	 			res="未知";
	 			break;
	 		 case '1':
	 				res="百度";
	 				break;
	 		 case '2':
	 				res="百度移动端";
	 				break;
	 		 case '3':
	 				res="360";
	 				break;
	 		 case '4':
	 				res="360移动端";
	 				break;
	 		 case '5':
	 				res="搜狗";
	 				break;
	 		 case '6':
	 				res="搜狗移动端";
	 				break;
	 		 case '7':
	 				res="UC移动端";
	 				break;
	 		case '8':
					res="直接输入";
					break;
	 		case '9':
					res="自然流量";
					break;
	 		case '10':
					res="直电";
					break;
	 		case '11':
					res="微信";
					break;
	 		case '12':
					res="QQ";
					break;
	 		 }
	 			return res;
	 		} 
		
		function formatter3(){
	 		var res='';	 
			 switch(row.s_sourceurl){
			 case '0':
				res="其它";
				break;
			 case '1':
					res="职英B站";
					break;
			 case '2':
					res="高考站";
					break;
			 case '3':
					res="职英A站";
					break;
	 	}
			 return res;
	 	}
		
		function formatter4(){
	 		var res='';	 
			 switch(row.s_address){
			 case '0':
				res="未知";
				break;
			 case '1':
					res="其它";
					break;
			 case '2':
					res="郑州";
					break;
			 case '3':
					res="开封";
					break;
			
			 case '4':
					res="洛阳";
					break;
			
			 case '5':
					res="南阳";
					break;
			 case '6':
					res="漯河";
					break;
			 case '7':
					res="三门峡";
					break;
			 case '8':
					res="平顶山";
					break;
			 case '9':
					res="周口";
					break;
			 case '10':
					res="驻马店";
					break;
			 case '11':
					res="新乡";
					break;
			 case '12':
					res="鹤壁";
					break;
			 case '13':
					res="焦作";
					break;
			 case '14':
					res="濮阳";
					break;
			 case '15':
					res="安阳";
					break;
			 case '16':
					res="商丘";
					break;
			 case '17':
					res="信阳";
					break;
			 case '18':
					res="济源";
					break;
		}
		return res;
		}
		
		function formatter5(){
	 		var res='';	 
			 switch(row.s_frompart){
			 case '0':
				res="网络";
				break;
			 case '1':
					res="市场";
					break;
			 case '2':
					res="教质";
					break;
			 case '3':
					res="学术";
					break;
			
			 case '4':
					res="就业";
					break;	
	 	}
			 return res;
	 	}
		
		function formatter6(){
	 		var res='';	 
			 switch(row.s_concern){
			 case '0':
				res="课程";
				break;
			 case '1':
					res="学费";
					break;
			 case '2':
					res="学时";
					break;
			 case '3':
					res="学历";
					break;
	 		
			 case '4':
					res="师资";
					break;
	 		
			 case '5':
					res="就业";
					break;
			 case '6':
					res="环境";
					break;
			 case '7':
					res="其他";
					break;
	 	}
	 	return res;
	 	}
		$("#s_sex").textbox('setValue',row.s_sex==1?"男":"女");
		$("#s_isbaobei").textbox('setValue',row.s_isbaobei==1?"是":"否");
		$("#s_educations").textbox('setValue',formatters());
		$("#s_state").textbox('setValue',formatter1());
		$("#s_msgsource").textbox('setValue',formatter2());
		$("#s_sourceurl").textbox('setValue',formatter3());
		$("#s_address").textbox('setValue',formatter4());
		$("#s_frompart").textbox('setValue',formatter5());
		$("#s_concern").textbox('setValue',formatter6());
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
	}
	function updateSub(){
		 var s_sex=$("#updates_sex").combobox('getValue')=="男"?"1":"0";
		 var s_isbaobei=$("#updates_isbaobei").combobox('getValue')=="是"?"1":"0";
		var s_sex=$("#updates_sex").combobox("getValue");

		/*  alert(s_sex); */

		 /* alert(s_sex); */
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
			/* s_frompart:$("#updates_frompart").val(),
			s_msgsource:$("#updates_msgsource").val(),
			s_sourceurl:$("#updates_sourceurl").val(), */
			s_sourcekeyword:$("#updates_sourcekeyword").val(),
			/* s_address:$("#updates_address").val(),
			s_concern:$("#updates_concern").val(),
			s_frompart:$("#updates_frompart").val(), */
			s_qq:$("#updates_qq").val(),
			s_weixin:$("#updates_weixin").val(),
			s_isbaobei:$("#updates_isbaobei").combobox("getValue")
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
		var n_userid='${sessionScope.users.u_id}';
		/* alert(n_userid); */
		$.ajax({
			type:"post",//提交方式
			url:"insertStudents",//提交路径
			datatype:"json",//格式
			data:{//传递的参数
				"s_name":$("#inserts_name").val(),
				"s_sex":$("#inserts_sex").combobox("getValue"),
				"s_age":$("#inserts_age").val(),
				"s_phone":$("#inserts_phone").val(),
				"s_education":$("#inserts_education").val(),
				"s_state":$("#inserts_state").val(),
				"s_msgsource":$("#inserts_msgsource").val(),
				"s_sourceurl":$("#inserts_sourceurl").val(),
				"s_sourcekeyword":$("#inserts_sourcekeyword").val(),
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
		
		
	}
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
				<th data-options="field:'s_education',title:'s_education',formatter:formatterxueli">学历</th>	 
				<th field="s_stuclass" hidden="true" formatter="formatterkecheng">课程方向</th> 		
				<!-- <th data-options="field:'s_stuclass',title:'s_stuclass'">课程方向</th>	 -->		
				 <th data-options="field:'s_state',title:'s_state',formatter:formatterzhuangtai">状态</th>	 
				<th data-options="field:'s_msgsource',title:'s_msgsource',formatter:formatterqudao">来源渠道</th>			
				<th data-options="field:'s_sourceurl',title:'s_sourceurl',formatter:formatterwangzhan">来源网站</th>			
				<th data-options="field:'s_sourcekeyword',title:'s_sourcekeyword'">来源关键词</th>			
				<th data-options="field:'s_qq',title:'s_qq'">学员QQ</th>			
				<th data-options="field:'s_weixin',title:'s_weixin'">微信号</th>			
				<th data-options="field:'s_isbaobei',title:'s_isbaobei',formatter:formatterbaobei">是否报备</th>			
				<th data-options="field:'s_content',title:'s_content'">在线备注</th>			
				<!-- <th data-options="field:'s_ispay',title:'s_ispay',formatter:formatterispay">是否缴费</th> -->
				<th field="s_ispay" hidden="true" formatter="formatterispay">是否缴费</th>	
				<th field="s_concern" hidden="true" formatter="formatterconcern">关注</th>				
				<th field="s_frompart" hidden="true" formatter="formatterfrompart">来源部门</th>				
				<th field="s_address" hidden="true" formatter="formatteraddress">所在区域</th>				
				<th field="s_record" hidden="true" formatter="formatterrecord">打分</th>			
				<!-- <th data-options="field:'s_isvalid',title:'s_isvalid',formatter:formatterisvalid">是否有效</th> -->	
				<th field="s_isvalid" hidden="true" formatter="formatterisvalid">是否有效</th>		
				<!-- <th data-options="field:'s_isreturnvist',title:'s_isreturnvist',formatter:formatterisreturnvist">是否回访</th>			 -->
				<th field="s_isreturnvist" hidden="true" formatter="formatterisreturnvist">是否回访</th>	
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
			<!-- <input class="easyui-validatebox" type="text" id="s_ispay" /> -->
						<select style="width: 100px" id="s_ispay" class="easyui-combobox">
							<option value="fufei">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
			
			<label for="name">是否有效:</label> 
			<!-- <input class="easyui-validatebox" type="text" id="s_isvalid" /> -->
						<select style="width: 100px" id="s_isvalid" class="easyui-combobox">
							<option value="youxiao">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
			<label for="name">是否回访:</label> 
			<!-- <input class="easyui-validatebox" type="text" id="s_isreturnvist" /> -->
						<select style="width: 100px" id="s_isreturnvist" class="easyui-combobox">
							<option value="huifang">请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
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
			  <a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			 <a href="javascript:void(0)" onclick="tianjiastu()"	class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true">添加</a>
			  <a href="javascript:void(0);" onclick="dongtai()" class="easyui-linkbutton" iconCls='icon-edit'>动态</a>
			<a href="#" class="easyui-linkbutton" onclick="progress()">进度条</a>
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
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="text" name="s_age" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td> <input type="text" name="s_sexs" class="easyui-textbox" readonly="true" id="s_sex">
						<!-- <select style="width: 100px" id=s_sex class="easyui-combobox">
				    		<option value="1">女</option>
		    				<option value="0">男</option>
			    		</select> -->
					</td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" name="s_phone" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>个人状态：</td>
					<td><input type="text" id="s_state" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>学历：</td>
					<td><input type="text" class="easyui-textbox" readonly="true" id="s_educations"></td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><input type="text" id="s_msgsource" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><input type="text" id="s_sourceurl" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>所在区域：</td>
					<td><input type="text" id="s_address" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>学员qq：</td>
					<td><input type="text" name="s_qq" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>客户微信：</td>
					<td><input type="text" name="s_weixin" class="easyui-textbox" readonly="true"></td>
				</tr>
				<!-- <tr>
					<td>备注：</td>
					<td><input type="text" name="s_content" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>创建时间：</td>
					<td><input type="text" name="s_createtime" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否有效：</td>
					<td><input type="text" name="s_isvalid" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>打分：</td>
					<td><input type="text" name="s_record" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否回访：</td>
					<td><input type="text" name="s_isreturnvist" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>首次回访时间：</td>
					<td><input type="text" name="s_firstvisittime" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否上门：</td>
					<td><input type="text" name="s_ishome" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>上门时间：</td>
					<td><input type="text" name="s_hometime" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>无效原因：</td>
					<td><input type="text" name="s_lostvalid" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否缴费：</td>
					<td><input type="text" name="s_ispay" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>缴费时间：</td>
					<td><input type="text" name="s_paytime" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>缴费金额：</td>
					<td><input type="text" name="s_money" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否退费：</td>
					<td><input type="text" name="s_isreturnmoney" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否进班：</td>
					<td><input type="text" name="s_isinclass" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>进班时间：</td>
					<td><input type="text" name="s_inclasstime" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>进班备注：</td>
					<td><input type="text" name="s_inclasscontent" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否删除：</td>
					<td><input type="text" name="s_isdel" class="easyui-textbox" readonly="true"></td>
				</tr>-->
				<tr> 
					<td>来源部门：</td>
					<td><input type="text" id="s_frompart" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>关注：</td>
					<td><input type="text" id="s_concern" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>是否报备：</td>
					<td><input type="text" name="s_isbaobeis" class="easyui-textbox" readonly="true" id="s_isbaobei">
						<!-- <select style="width: 100px" id=s_isbaobei class="easyui-combobox">
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select> -->
					</td>
				</tr>
				<!-- <tr>
					<td>用户编号：</td>
					<td><input type="text" name="s_userid" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>退费原因：</td>
					<td><input type="text" name="s_returnmoneycontent" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>定金金额：</td>
					<td><input type="text" name="s_premoney" class="easyui-textbox" readonly="true"></td>
				</tr>
				<tr>
					<td>定金时间：</td>
					<td><input type="text" name="s_premoneytime" class="easyui-textbox" readonly="true"></td>
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
					<td><!-- <input type="text" name="s_sex" id="updates_sex" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_sex" class="easyui-combobox">
				    		<option value="1">女</option>
		    				<option value="0">男</option>
			    		</select>
					</td>
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
					<td><!-- <input type="text" name="s_education" id="updates_education" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_education" class="easyui-combobox">
							<option value="xueli">请选择</option>
				    		<option value="0">未知</option>
		    				<option value="1">大专</option>
		    				<option value="2">高中</option>
		    				<option value="3">中专</option>
		    				<option value="4">初中</option>
		    				<option value="5">本科</option>
		    				<option value="6">其他</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>状态：</td>
					<td><!-- <input type="text" name="s_state" id="updates_state" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_state" class="easyui-combobox">
							<option value="zhuangtai">请选择</option>
				    		<option value="0">未知</option>
		    				<option value="1">待业</option>
		    				<option value="2">在职</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><!-- <input type="text" name="s_msgsource" id="updates_msgsource" class="easyui-textbox"> -->
						<select style="width:100px" id="updates_msgsource" class="easyui-combobox">
							<option value="qudao">请选择</option>
				    		<option value="0">百度</option>
		    				<option value="1">百度移动端</option>
		    				<option value="2">360</option>
		    				<option value="3">360移动端</option>
		    				<option value="4">搜狗</option>
		    				<option value="5">搜狗移动端</option>
		    				<option value="6">UC移动端</option>
		    				<option value="7">直接输入</option>
		    				<option value="8">自然流量</option>
		    				<option value="9">直电</option>
		    				<option value="10">微信</option>
		    				<option value="11">QQ</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><!-- <input type="text" name="s_sourceurl" id="updates_sourceurl" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_sourceurl" class="easyui-combobox">
							<option value="wangzhan">请选择</option>
				    		<option value="0">其它</option>
		    				<option value="1">职英B站</option>
		    				<option value="2">高考站</option>
		    				<option value="3">职英A站</option>
			    		</select>
					
					</td>
				</tr>
				<tr>
					<td>来源关键词：</td>
					<td><input type="text" name="s_sourcekeyword" id="updates_sourcekeyword" class="easyui-textbox"></td>
				</tr>
				 <tr>
					<td>所在区域：</td>
					<td><!-- <input type="text" name="s_address" id="updates_address" class="easyui-textbox"> -->
							<select style="width: 100px" id="updates_address" class="easyui-combobox">
							<option value="quyu">请选择</option>
				    		<option value="0">未知</option>
		    				<option value="1">其它</option>
		    				<option value="2">郑州</option>
		    				<option value="3">开封</option>
		    				<option value="4">洛阳</option>
		    				<option value="5">南阳</option>
		    				<option value="6">漯河</option>
		    				<option value="7">三门峡</option>
		    				<option value="8">平顶山</option>
		    				<option value="9">周口</option>
		    				<option value="10">驻马店</option>
		    				<option value="11">新乡</option>
		    				<option value="12">鹤壁</option>
		    				<option value="13">焦作</option>
		    				<option value="14">濮阳</option>
		    				<option value="15">安阳</option>
		    				<option value="16">商丘</option>
		    				<option value="17">信阳</option>
		    				<option value="18">济源</option>
			    		</select>
					
					</td>
				</tr>
				<tr>
					<td>学员关注：</td>
					<td><!-- <input type="text" name="s_concern" id="updates_concern" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_concern" class="easyui-combobox">
							<option value="guanzhu">请选择</option>
				    		<option value="0">课程</option>
		    				<option value="1">学费</option>
		    				<option value="2">学时</option>
		    				<option value="3">学历</option>
		    				<option value="4">师资</option>
		    				<option value="5">就业</option>
			    			<option value="6">环境</option>
			    			<option value="7">其他</option>
			    		</select>
					
					</td>
				</tr> 
				<tr>
					<td>来源部门：</td>
					<td><!-- <input type="text" name="s_frompart" id="updates_frompart" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_frompart" class="easyui-combobox">
							<option value="bumen">请选择</option>
				    		<option value="0">网络</option>
		    				<option value="1">市场</option>
		    				<option value="2">教质</option>
		    				<option value="3">学术</option>
		    				<option value="4">就业</option>
			    		</select>
					
					</td>
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
					<td><!-- <input type="text" name="s_isbaobei" id="updates_isbaobei" class="easyui-textbox"> -->
						<select style="width: 100px" id="updates_isbaobei" class="easyui-combobox">
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
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
					<td><!-- <input type="text" name="s_sex" id="inserts_sex" class="easyui-textbox"> -->
						<select style="width: 100px" id=inserts_sex class="easyui-combobox">
							<option>请选择</option>
				    		<option value="1">女</option>
		    				<option value="0">男</option>
			    		</select>
					</td>
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
					<td><!-- <input type="text" name="s_education" id="inserts_education" class="easyui-textbox"> -->
						<select style="width: 100px" id="inserts_education" class="easyui-combobox">
							<option value="xueli">请选择</option>
				    		<option value="0">未知</option>
		    				<option value="1">大专</option>
		    				<option value="2">高中</option>
		    				<option value="3">中专</option>
		    				<option value="4">初中</option>
		    				<option value="5">本科</option>
		    				<option value="6">其他</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>状态：</td>
					<td><!-- <input type="text" name="s_state" id="inserts_state" class="easyui-textbox"> -->
						<select style="width: 100px" id="inserts_state" class="easyui-combobox">
							<option value="zhuangtai">请选择</option>
				    		<option value="0">未知</option>
		    				<option value="1">待业</option>
		    				<option value="2">在职</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>来源渠道：</td>
					<td><!-- <input type="text" name="s_msgsource" id="inserts_msgsource" class="easyui-textbox"> -->
						<select style="width:100px" id="inserts_msgsource" class="easyui-combobox">
							<option value="qudao">请选择</option>
				    		<option value="0">百度</option>
		    				<option value="1">百度移动端</option>
		    				<option value="2">360</option>
		    				<option value="3">360移动端</option>
		    				<option value="4">搜狗</option>
		    				<option value="5">搜狗移动端</option>
		    				<option value="6">UC移动端</option>
		    				<option value="7">直接输入</option>
		    				<option value="8">自然流量</option>
		    				<option value="9">直电</option>
		    				<option value="10">微信</option>
		    				<option value="11">QQ</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>来源网站：</td>
					<td><!-- <input type="text" name="s_sourceurl" id="inserts_sourceurl" class="easyui-textbox"> -->
						<select style="width: 100px" id="inserts_sourceurl" class="easyui-combobox">
							<option value="wangzhan">请选择</option>
				    		<option value="0">其它</option>
		    				<option value="1">职英B站</option>
		    				<option value="2">高考站</option>
		    				<option value="3">职英A站</option>
			    		</select>
					</td>
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
					<td><!-- <input type="text" name="s_isbaobei" id="inserts_isbaobei" class="easyui-textbox"> -->
						<select style="width: 100px" id=inserts_isbaobei class="easyui-combobox">
							<option>请选择</option>
				    		<option value="1">否</option>
		    				<option value="0">是</option>
			    		</select>
					</td>
				</tr>
				<tr>
					<td>在线备注：</td>
					<td><input type="text" name="s_content" id="inserts_content" class="easyui-textbox"></td>
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


function progress(){
	var win = $.messager.progress({
		title:'Please waiting',
		msg:'Loading data...'
	});
	setTimeout(function(){
		$.messager.progress('close');
	},3200)
}
</script>
</html>