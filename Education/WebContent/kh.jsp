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
		$("#StuTab").datagrid({
			url:'SelectStu',
			method:'post',
			toolbar:"#toolbar",
			pagination:true
			
			
			
		})
		
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='lookStu("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updateStu("+index+")'>修改</a> <a href='javascript:void(0)' onclick='TrackStu("+index+")'>跟踪</a>"
	}
	
	function lookStu(index) {
		var data = $("#StuTab").datagrid("getData"); 
		var row = data.rows[index];
		
		
		$("#s_isvalid").textbox('setValue',row.s_isvalid == 0? "否":"是");
		$("#s_isreturnvist").textbox('setValue',row.s_isreturnvist == 0? "否":"是");
		$("#s_ishome").textbox('setValue',row.s_ishome == 0? "否":"是");
		$("#s_ispay").textbox('setValue',row.s_ispay == 0? "否":"是");
		$("#s_isreturnmoney").textbox('setValue',row.s_isreturnmoney == 0? "否":"是");
		$("#s_isinclass").textbox('setValue',row.s_isinclass == 0? "否":"是");
		
		$("#LookStuForm").form("load", row);
		$("#LookStu_window").window("open");
		
		
	}
	
	function updateStu(index) {
		var data = $("#StuTab").datagrid("getData"); 
		var row = data.rows[index]; 
		
		$("#updates_isvalid").combobox('setValue',row.s_isvalid);
		$("#updates_isreturnvist").combobox('setValue',row.s_isreturnvist);
		$("#updates_ishome").combobox('setValue',row.s_ishome);
		$("#updates_ispay").combobox('setValue',row.s_ispay);
		$("#updates_isreturnmoney").combobox('setValue',row.s_isreturnmoney);
		$("#updates_isinclass").combobox('setValue',row.s_isinclass);
		
		$("#updateStuForm").form("load", row);
		$("#updateStu_window").window("open");
	}
	
	function submitupdateStuForm() {
			$.post(
				"UpdateStu", {
					s_id:$("#updates_id").val(),
					s_userid:$("#updates_userid").val(),
					s_curriculum:$("#updates_curriculum").val(),
					s_record:$("#updates_record").val(),
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
					s_content:$("#updates_content").val()
							
			},
			function(res) {
			if(res>0) {
				alert("修改成功");
				$("#updateStu_window").window("close");
				$("#StuTab").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
				$("#updateStuForm").form("clear");
			}else{
				alert("修改失败");
			}
		}, "json");
	}
	
	function TrackStu(index) {
		
		var data = $("#StuTab").datagrid("getData"); 
		var row = data.rows[index]; 
		$("#InsertNetForm").form("load", row);
		$("#InsertNet_window").window("open");
	}
	
	function submitNetForm() {
		$.post(
				"InsertNet", {
					n_studentid:$("#n_studentid").val(),
					n_studentname:$("#n_studentname").val(),
					n_followtime:$("#n_followtime").val(),
					n_nextfollowtime:$("#n_nextfollowtime").val(),
					n_content:$("#n_content").val(),
					n_userid:$("#n_userid").val(),
					n_followtype:$("#n_followtype").val(),
					n_createtime:$("#n_createtime").val(),
					n_followstate:$("#n_followstate").val()
		
			},
			function(res) {
			if(res>0) {
				alert("添加成功");
				$("#InsertNet_window").window("close");
				$("#StuTab").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
				$("#InsertNetForm").form("clear");
			}else{
				alert("添加失败");
			}
		}, "json");
	}
	
	function initLog() {
		$("#StuLogTab").datagrid({
			url:'SelectNet',
			method:'post',
			toolbar:"#Logtoolbar",
			pagination:true,
			queryParams:{
				n_studentname:$("#logn_studentname").val(),
				n_content:$("#logn_content").val(),
				n_followtime:$("#logn_followtime").val(),
				n_nextfollowtime:$("log#n_nextfollowtime").val(),
				n_followtype:$("#logn_followtype").val()
			}
			
		})
	}
	
	function logStu() {
		$("#InsertNetLog_window").window("open");
		initLog();
	}
	
	function formatterlook(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='lookLog("+index+")'>查看</a>"
	}
	
	function lookLog(index) {
		var data = $("#StuLogTab").datagrid("getData"); 
		var row = data.rows[index]; 
		$("#LookNetForm").form("load", row);
		$("#LookNet_window").window("open");
	}
	
	function formatters_isvalid(value,row,index) {
		return value == 1 ? '是':'否';
	}
	function formatters_isreturnvist(value,row,index) {
		return value == 1 ? '是':'否';
	}
	function formatters_ishome(value,row,index) {
		return value == 1 ? '是':'否';
	}
	function formatters_ispay(value,row,index) {
		return value == 1 ? '是':'否';
	}
	function formatters_isreturnmoney(value,row,index) {
		return value == 1 ? '是':'否';
	}
	function formatters_isinclass(value,row,index) {
		return value == 1 ? '是':'否';
	}
	
	function shezhidongtai(){
		var createGridHeaderContextMenu = function(e, field) {
			e.preventDefault();
			var grid = $(this);/* grid本身 */
			var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
			var okCls = 'tree-checkbox1';// 选中
			var emptyCls = 'tree-checkbox0';// 取消
			if (!headerContextMenu) {
				var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
				var fields = grid.datagrid('getColumnFields');
				for (var i = 0; i < fields.length; i++) {
					var fildOption = grid.datagrid('getColumnOption', fields[i]);
					if (!fildOption.hidden) {
						$('<div iconCls="' + okCls + '" field="' + fields[i] + '"/>')
								.html(fildOption.title).appendTo(tmenu);
					} else {
						$('<div iconCls="' + emptyCls + '" field="' + fields[i] + '"/>')
								.html(fildOption.title).appendTo(tmenu);
					}
				}
				headerContextMenu = this.headerContextMenu = tmenu.menu({
					onClick : function(item) {
						var field = $(item.target).attr('field');
						if (item.iconCls == okCls) {
							grid.datagrid('hideColumn', field);
							$(this).menu('setIcon', {
								target : item.target,
								iconCls : emptyCls
							});
						} else {
							grid.datagrid('showColumn', field);
							$(this).menu('setIcon', {
								target : item.target,
								iconCls : okCls
							});
						}
					}
				});
			}
			headerContextMenu.menu('show', {
				left: e.pageX,
                top: e.pageY
			});
		};
		$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
		$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
	}
	

	
	
	
</script>

</head>
<body>

	<table id="StuTab" data-options="fitColumns:true"  >
		<thead>
			<tr>
				
				<th data-options="field:'s_id'">id</th>
				<th data-options="field:'s_name',title:'s_name'">姓名</th>
				<th data-options="field:'s_userid'">咨询师</th>
				<th data-options="field:'s_curriculum'">课程方向</th>	
				<th data-options="field:'s_record'">打分</th>	
				<th data-options="field:'s_isvalid',formatter:formatters_isvalid">是否有效</th>	
				<th data-options="field:'s_lostvalid'">无效原因</th>	
				<th data-options="field:'s_isreturnvist',formatter:formatters_isreturnvist">是否回访</th>	
				<th data-options="field:'s_firstvisittime'">首次回访时间</th>	
				<th data-options="field:'s_ishome',formatter:formatters_ishome">是否上门</th>	
				<th data-options="field:'s_hometime'">上门时间</th>	
				<th data-options="field:'s_premoney'">定金金额</th>	
				<th data-options="field:'s_premoneytime'">定金时间</th>	
				<th data-options="field:'s_ispay',formatter:formatters_ispay">是否缴费</th>	
				<th data-options="field:'s_paytime'">缴费时间</th>	
				<th data-options="field:'s_money'">缴费金额</th>	
				<th data-options="field:'s_isreturnmoney',formatter:formatters_isreturnmoney">是否退费</th>	
				<th data-options="field:'s_returnmoneycontent'">退费原因</th>	
				<th data-options="field:'s_isinclass',formatter:formatters_isinclass">是否进班</th>	
				<th data-options="field:'s_inclasstime'">进班时间</th>	
				<th data-options="field:'s_inclasscontent'">进班备注</th>	
				<th data-options="field:'s_content'">备注</th>	

				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo" class="right"></th>
			</tr>
		</thead>
	</table>
	
	<!-- toolbar -->
	<div id="toolbar">
		<form id="toolform" class="easyui-form">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="logStu()">日志</a>
		<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			
		</form>
	</div>
	
	<!-- 查看  -->
		  <div id="LookStu_window" class="easyui-window" title="查看信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;padding:10px;">
			<form id="LookStuForm" class="easyui-form">
				<table cellpadding="5">
					<tr style="display: none">
						<td>ID:</td>
						<td><input class="easyui-textbox" name="s_id"  id="s_id" ></input>
						</td>
					</tr>
					<tr>
						<td>咨询师:</td>
						<td><input class="easyui-textbox" name="s_userid" id="s_userid"  readonly="readonly"></input>
						</td>
					</tr>
					
					<tr>
						<td>课程方向:</td>
						<td><input class="easyui-textbox" name="s_curriculum" id="s_curriculum" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>打分:</td>
						<td><input class="easyui-textbox" name="s_record" id="s_record"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否有效:</td>
						<td>
							<input class="easyui-textbox" name="s_isvalids" id="s_isvalid"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>无效原因:</td>
						<td><input class="easyui-textbox" name="s_lostvalid" id="s_lostvalid"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否回访:</td>
						<td><input class="easyui-textbox" name="s_isreturnvists" id="s_isreturnvist" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>首次回访时间:</td>
						<td><input class="easyui-datebox" name="s_firstvisittime" id="s_firstvisittime"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否上门:</td>
						<td><input class="easyui-textbox" name="s_ishomes"  id="s_ishome"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>上门时间:</td>
						<td><input class="easyui-datebox" name="s_hometime" id="s_hometime"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>定金金额:</td>
						<td><input class="easyui-textbox" name="s_premoney" id="s_premoney" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>定金时间:</td>
						<td><input class="easyui-datebox" name="s_premoneytime" id="s_premoneytime"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否缴费:</td>
						<td><input class="easyui-textbox" name="s_ispays"  id="s_ispay"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>缴费时间:</td>
						<td><input class="easyui-datebox" name="s_paytime" id="s_paytime"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>缴费金额:</td>
						<td><input class="easyui-textbox" name="s_money" id="s_money"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否退费:</td>
						<td><input class="easyui-textbox" name="s_isreturnmoneys"  id="s_isreturnmoney"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>退费原因:</td>
						<td><input class="easyui-textbox" name="s_returnmoneycontent"  id="s_returnmoneycontent"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>是否进班:</td>
						<td><input class="easyui-textbox" name="s_isinclasss"  id="s_isinclass"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>进班时间:</td>
						<td><input class="easyui-datebox" name="s_inclasstime" id="s_inclasstime" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>进班备注:</td>
						<td><input class="easyui-textbox" name="s_inclasscontent" id="s_inclasscontent"  readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>备注:</td>
						<td><input class="easyui-textbox" name="s_content" id="s_content"  readonly="readonly"></input>
						</td>
					</tr>

				</table>
			</form>
			
		</div> 
	
	<!-- 修改  -->
		  <div id="updateStu_window" class="easyui-window" title="修改信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;padding:10px;">
			<form id="updateStuForm" class="easyui-form">
				<table cellpadding="5">
					<tr style="display: none">
						<td>ID:</td>
						<td><input class="easyui-textbox" name="s_id"  id="updates_id" ></input>
						</td>
					</tr>
					<tr>
						<td>咨询师:</td>
						<td><input class="easyui-textbox" name="s_userid" id="updates_userid" data-options="required:true" readonly="readonly"></input>
						</td>
					</tr>
					
					<tr>
						<td>课程方向:</td>
						<td><input class="easyui-textbox" name="s_curriculum" id="updates_curriculum" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>打分:</td>
						<td><input class="easyui-textbox" name="s_record" id="updates_record" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否有效:</td>
						<td><!-- <input class="easyui-textbox" name="s_isvalids" id="updates_isvalid"  data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_isvalid" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>无效原因:</td>
						<td><input class="easyui-textbox" name="s_lostvalid" id="updates_lostvalid" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否回访:</td>
						<td><!-- <input class="easyui-textbox" name="s_isreturnvist" id="updates_isreturnvist" data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_isreturnvist" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>首次回访时间:</td>
						<td><input class="easyui-datebox" name="s_firstvisittime" id="updates_firstvisittime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否上门:</td>
						<td><!-- <input class="easyui-textbox" name="s_ishome"  id="updates_ishome" data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_ishome" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>上门时间:</td>
						<td><input class="easyui-datebox" name="s_hometime" id="updates_hometime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>定金金额:</td>
						<td><input class="easyui-textbox" name="s_premoney" id="updates_premoney" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>定金时间:</td>
						<td><input class="easyui-datebox" name="s_premoneytime" id="updates_premoneytime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否缴费:</td>
						<td><!-- <input class="easyui-textbox" name="s_ispay"  id="updates_ispay" data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_ispay" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>缴费时间:</td>
						<td><input class="easyui-datebox" name="s_paytime" id="updates_paytime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>缴费金额:</td>
						<td><input class="easyui-textbox" name="s_money" id="updates_money" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否退费:</td>
						<td><!-- <input class="easyui-textbox" name="s_isreturnmoney"  id="updates_isreturnmoney" data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_isreturnmoney" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>退费原因:</td>
						<td><input class="easyui-textbox" name="s_returnmoneycontent"  id="updates_returnmoneycontent" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>是否进班:</td>
						<td><!-- <input class="easyui-textbox" name="s_isinclass"  id="updates_isinclass" data-options="required:true"></input> -->
							<select style="width: 100px" id="updates_isinclass" class="easyui-combobox">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>进班时间:</td>
						<td><input class="easyui-datebox" name="s_inclasstime" id="updates_inclasstime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
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
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitupdateStuForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearupdateStuForm()">取消</a>
			</div>
		</div> 
		<!-- 添加跟踪  -->
		  <div id="InsertNet_window" class="easyui-window" title="添加信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;padding:10px;">
			<form id="InsertNetForm" class="easyui-form">
				<table cellpadding="5">
					
					<tr>
						<td>学生编号:</td>
						<td><input class="easyui-textbox" name="s_id" id="n_studentid" data-options="required:true" readonly="readonly"></input>
						</td>
					</tr>
					
					<tr>
						<td>学生姓名:</td>
						<td><input class="easyui-textbox" name="s_name" id="n_studentname" data-options="required:true" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>开始跟踪时间:</td>
						<td><input class="easyui-datetimebox" name="n_followtime" id="n_followtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>结束跟踪时间:</td>
						<td><input class="easyui-datetimebox" name="n_nextfollowtime" id="n_nextfollowtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>回访记录/回访情况:</td>
						<td><input class="easyui-textbox" name="n_content" id="n_content" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>用户编号:</td>
						<td><input class="easyui-textbox" name="s_userid" id="n_userid" data-options="required:true" readonly="readonly"></input>
						</td>
					</tr>
					<tr>
						<td>跟踪类型/跟踪方式:</td>
						<td><input class="easyui-textbox" name="n_followtype" id="n_followtype" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>创建时间/回访时间:</td>
						<td><input class="easyui-datetimebox" name="n_createtime"  id="n_createtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>跟踪状态:</td>
						<td><input class="easyui-textbox" name="n_followstate" id="n_followstate" data-options="required:true"></input>
						</td>
					</tr>
					

				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitNetForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearNetForm()">取消</a>
			</div>
		</div>
		
		<!-- 日志  -->
		  <div id="InsertNetLog_window" class="easyui-window" title="日志信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:500px;padding:10px;">
			<table id="StuLogTab" class="easyui-datagrid">
				<thead>
					<tr>
						<th data-options="field:'n_id'">ID</th>
						
						<th data-options="field:'n_studentid'">学生编号</th>
						
						<th data-options="field:'n_studentname'">学生名字</th>
						
						<th data-options="field:'n_createtime'">跟踪时间</th>	
							
						<th data-options="field:'n_content'">内容</th>
						
						<th data-options="field:'n_followtime'">开始跟踪时间</th>
						
						<th data-options="field:'n_nextfollowtime'">结束跟踪时间</th>
						
						<th data-options="field:'n_followtype'">操作</th>
		
						<th data-options="field:'look',title:'查看',formatter:formatterlook"></th>
					</tr>
				</thead>
			</table>
		  </div>
		  
		<div id="Logtoolbar" class="easyui-window" data-options="closed:true" style="width:700px;">
		<form id="Logtoolform" class="easyui-form">
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="logStu()">日志</a> -->
			<label for="name">学生名称:</label>
			<input class="easyui-textbox" type="text" id="logn_studentname">
			<label for="name">回访情况:</label>
			<input class="easyui-textbox" type="text" id="logn_content"><br/>
			
			<label for="name">始跟时间:</label>
			<input class="easyui-datebox" type="text" id="logn_followtime">
			<label for="name">束跟时间:</label>
			<input class="easyui-datebox" type="text" id="logn_nextfollowtime"><br/>
			
			
			<label for="name">跟踪方式:</label>
			<input class="easyui-textbox" type="text" id="logn_followtype">
			
			<!-- <label for="name">类别</label>
			<select id="bt_name" class="easyui-combobox" >   
			    <option>--请选择--</option>   
			</select>   -->
			
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initLog()">检索</a>
		</form>
	</div>
		  
		  <!-- Look日志  -->
		  <div id="LookNet_window" class="easyui-window" title="日志信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:500px;padding:10px;">
			<form id="LookNetForm" class="easyui-form">
				<table cellpadding="5">
					
					<tr>
						<td>学生姓名:</td>
						<td><input class="easyui-textbox" name="n_studentname" id="updates_curriculum" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>开始跟踪时间:</td>
						<td><input class="easyui-datebox" name="n_followtime" id="n_followtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>结束跟踪时间:</td>
						<td><input class="easyui-datebox" name="n_nextfollowtime" id="n_nextfollowtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>回访记录/回访情况:</td>
						<td><input class="easyui-textbox" name="n_content" id="n_content" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>用户编号:</td>
						<td><input class="easyui-textbox" name="n_userid" id="n_userid" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>跟踪类型/跟踪方式:</td>
						<td><input class="easyui-textbox" name="n_followtype" id="n_followtype" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>创建时间/回访时间:</td>
						<td><input class="easyui-datebox" name="n_createtime"  id="n_createtime" data-options="required:true"></input>
						</td>
					</tr>
					<tr>
						<td>跟踪状态:</td>
						<td><input class="easyui-textbox" name="n_followstate" id="n_followstate" data-options="required:true"></input>
						</td>
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
	var data = JSON.stringify($('#StuTab').datagrid('getData').rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});

</script>
</html>