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
			var token = "1dd8841f-7f39-4986-b798-cff41410f31b";
			$(function() {
				$("#dg").datagrid({
					url: 'selectRolesAll',//数据接口的地址
					method:'post',
					rownumbers:true,
					singleSelect:true,
					pagination:true,					
					toolbar:'#usertb'
					
				});
			})

			function formatOper(val, row, index) {
				return "<a href='javascript:void(0)' onclick='gets(" + index + ")'>设置</a> <a href='javascript:void(0)' onclick='updataJS(" + index + ")'>修改</a> <a href='javascript:void(0)' onclick='deletdata(" + index + ")'>删除</a>";
				/*return '<a href="javascript:void(0)" onclick="get('+index+')">设置</a> <a href="javascript:void(0)" onclick="updataJS('+index+')">修改</a> <a href="javascript:void(0)" onclick="deletdata('+index+')">删除</a>';*/
			}
			/*function formatOper(value, row, index) {
			    return "<a style='cursor: pointer;' onclick='resetPassword(" + index + ")'>重置密码</a>";
			}*/

			//点击新增按钮
			function addInfo() {
				$("#adduser_window").window("open");
			}
			//点击新增窗体保存按钮
			function submitUserForm() {
				
				var r_name = $("#r_name").val();
				$.post(
						"selectRolesExict", {
							r_name: r_name							
						},
						function(res) {
							if(res==null||res==""){
							var flag = $("#adduserForm").form("validate");
							if(flag) {
								$.post(
									"insertRoles", {
										r_name: r_name										
									},
									function(res) {
										if(res>0) {
											alert("新增成功");
											$("#adduser_window").window("close");
											$("#dg").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
										}
									}, "json");
							}
							}else{
								alert("角色名称重复，请重新输入");
							}
						}, "json");
				
			}
			/*function searchUserInfo(){
			    
			}*/
			function updataJS(index) {
				//将当前行数据填入表单
				var data = $("#dg").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
				var row = data.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
				$("#updateuserForm").form("load", row); //爽！使用form的load方法，快速将json对象的数据显示到 弹出窗口的表单元素之中。
				$("#updateuser_window").window("open"); //打开窗口。           
			}

			function closeUserForm() {
				$("#updateuser_window").window("close");
			}

			function submitupdateUserForm() {
				var row = $("#dg").datagrid("getSelected");
				var r_name = $("#updater_name").val();
				var r_id = row.r_id;
				$.post(
						"selectRolesExict", {
							r_name: r_name						
						},
						function(res) {
							if(res==null||res==""){
							$.post(
									"updateRoles", {
										r_name: r_name,
										r_id: r_id
										
									},
									function(res) {
										//alert(res.success);
										if(res>0) {
											alert("修改成功"); //此处建议修改为$.messager.alert()方法，请查阅帮助文档，自行修改。
											$("#updateuser_window").window("close");
											$("#dg").datagrid("reload");
										}
									}, "json");
							}
						}, "json");
				
			}
			//删除
			function deletdata(index) {
				//弹出用户确认框
				$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
					if(r) { // 用户点击了确认按钮
						//真正执行删除的代码……
						var data = $("#dg").datagrid("getData"); //获取datagrid对应的json对象集合（再来一遍）。
						var row = data.rows[index]; //获取第index行对应的json对象（再来一遍）。
						var r_id = row.r_id;
						$.post("deleteRoles", {
							r_id: r_id
							
						}, function(res) {
							/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？                  */
							if(res>0) {
								alert("删除成功");
								$("#dg").datagrid("load");
							}
						});

					}
				});
			}
			//设置角色
			var r_id;
				function myTree(){
					$('#tt').tree({ url: 'selectRolesModules',
						lines:true,
						
		    			queryParams: { //要发送的参数列表
		    				r_id:r_id
		           		        	
	        		},onContextMenu:function(e,node){
	        			$("#tt").tree('select',node.target);
	        		}
				});  
			}
				function gets(index){					
					var data = $("#dg").datagrid("getData"); //获取datagrid对应的json对象集合（再来一遍）。
					var row = data.rows[index]; //获取第index行对应的json对象（再来一遍）。
					r_id=row.r_id;
					/* alert(r_id); */
	                myTree();
	                $("#diaSetRigh").dialog({
	                    closed: false,
	                    title: "您正在设置" + row.r_name + "的角色信息"
	                });
				}
				
				
				/*function formatterSetRight(value, row, index) {
                return "<a style='cursor: pointer;' onclick='①______(" + index + ")'>设置</a>";
            }
            var cur_roleId; //正在编辑的角色id
            function gets(index) {
            	var token = "1dd8841f-7f39-4986-b798-cff41410f31b";
                var data = $("#dg").datagrid("getRows");
                $("#diaSetRigh").dialog({
                    closed: false,
                    title: "您正在设置" + data[index].Name
                });
                $.post("http://stuapi.ysd3g.com/api/GetModulesByRoleId", {
                    token: token,
                    roleId: data[index].Id
                }, function(r) {
                    cur_roleId = data[index].Id;
                    $("#tt").tree("loadData", r);
                }, "json");
            }*/
           function server(){
           		var nodes = $('#tt').tree('getChecked', ['checked','indeterminate']);
           		
           		/*alert(nodes.id);*/
           		var s = '';
				for(var i=0; i<nodes.length; i++){
					if (s != '') s += ',';
					s += nodes[i].id;
				}
				alert(s);
           		$.post("insertRolesModules", {
           					moduleid:s,
           					rm_roleid: r_id
							
						}, function(res) {
						/* 	var res = eval("(" + res + ")"); //你知道这里可以如何修改从而变得更简单么？       */           
							if(res>0) {
								alert("设置成功");
								$("#diaSetRigh").window("close");
								$("#dg").datagrid("load");
							}
						});
           }
		</script>
</head>
<body>
	<table name="center" class="easyui-datagrid" id="dg" title="角色管理">
			<thead>
				<tr>
					<th data-options="field:'r_id',width:150">编号</th>
					<th data-options="field:'r_name',width:150">角色名称</th>
					<th data-options="field:'_operate',align:'left',width:120,formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
		<!--新增-->
		<div id="adduser_window" class="easyui-window" title="新增角色信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="adduserForm">
				<table cellpadding="5">
					<tr>
						<td>角色名称:</td>
						<td><input class="easyui-textbox" type="text" name="r_name" id="r_name" data-options="required:true"></input>
						</td>
					</tr>

				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitUserForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearUserForm()">取消</a>
			</div>
		</div>
		<!--修改-->
		<div id="updateuser_window" class="easyui-window" title="修改角色信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="updateuserForm">
				<table cellpadding="5">
					<tr>
						<td>用户名:</td>
						<td><input class="easyui-textbox" type="text" name="r_name" id="updater_name" data-options="required:true"></input>
						</td>
					</tr>

				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitupdateUserForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUserForm()">取消</a>
			</div>
		</div>
		<div id="usertb" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>


		<!--设置角色权限-->
		<div id="diaSetRigh" class="easyui-dialog" title="设置角色权限 " style="width:500px;height:500px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,buttons:'#bb'">

				<table id="tabEdit">
                <tr>
                    <td>
                        <ul id="tt" class="easyui-tree" data-options="animate:true,lines:true,checkbox:true"></ul>
                    </td>
                </tr>
            </table>
				<div id="bb">
					<button class="easyui-linkbutton" onclick="server()">保存</button>
					<button class="easyui-linkbutton">关闭</button>
					
				</div>


		</div>
</body>
</html>