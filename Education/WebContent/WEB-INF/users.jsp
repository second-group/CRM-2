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
		<script type="text/javascript" src="js/md5.js"></script>
		<script type="text/javascript">
			
			
			function searchUserInfo() {
				var Minu_createtime=$("#Minu_createtime").textbox("getValue");
				var Maxu_createtime=$("#Maxu_createtime").textbox("getValue");
				if(Minu_createtime>Maxu_createtime){
					$.messager.alert("操作提示", "截止时间不能小于起始时间","error");					
					return false;
				}
				$("#dg").datagrid({
					url: 'selectUsers', //数据接口的地址
					method:'post',
					pagination:true,
					singleSelect:true,
					toolbar:'#usertb',
					queryParams:{ //要发送的参数列表												
						u_loginname: $("#u_loginname").textbox("getValue"),
						Minu_createtime: $("#Minu_createtime").datebox ("getValue"),
						Maxu_createtime: $("#Maxu_createtime").datebox("getValue"),
						u_islockout: $("#u_islockout").combobox("getValue"),
						u_createtime:$("#orderBy").combobox("getValue")						
					} 
				});
			}
			$(function() {
				shezhidongtai();
				searchUserInfo();
			});
			//锁定和解锁用户
			function formatterLockUser(value, row, index) {
				return "<a style='cursor: pointer;' onclick='lockUser(" + index + ")'>锁定用户</a> <a style='cursor: pointer;' onclick='unlockUser(" + index + ")'>解锁用户</a>";
			}
			//设置角色权限
			function formatterSetRole(value, row, index) {
				return "<a style='cursor: pointer;' onclick='showRoles(" + index + ")'>设置</a>";
			}
			//重置密码
			function formatterResetPassword(value, row, index) {
				return "<a style='cursor: pointer;' onclick='resetPassword(" + index + ")'>重置密码</a>";
			}
			//操作用户
			function formatterOPUser(value, row, index) {
				return "<a style='cursor: pointer;' onclick='updateInfo(" + index + ")'>编辑</a> <a style='cursor: pointer;' onclick='deleteInfo(" + index + ")'>删除</a>";
			}
			function formatteru_islockout(value, row, index) {
				return value==0?'否':'是';
			}
			//点击新增按钮
			function addInfo() {
				$("#adduser_window").window("open");
			}
			//点击新增窗体保存按钮
			function submitUserForm() {
				var u_loginname = $("#insertu_loginname").val();
				var u_protectemail = $("#insertu_protectemail").val();
				var u_protectmtel = $("#insertu_protectmtel").val();
				$.post(
						"selectUsersIsExect", {
							u_loginname: u_loginname,
							u_protectemail:u_protectemail,
							u_protectmtel:u_protectmtel
						},
						function(res) {
							if(res.success) {
								var flag = $("#adduserForm").form("validate");
								var u_loginname = $("#insertu_loginname").val();											
								var u_password = $("#insertu_password").val();
								var u_protectemail = $("#insertu_protectemail").val();
								var u_protectmtel = $("#insertu_protectmtel").val();
								var yh = /^[\u4E00-\u9FA5]{2,5}$/;
								var patt1 = /^[a-zA-Z]\w{5,17}$/;
								if(!(/^1(3|5|7|8)\d{9}$/.test(u_protectmtel))) {
									$.messager.alert("操作提示", "手机号码有误，请从新输入","error");								
									return false;
								}else if(!yh.test(u_loginname)){
									$.messager.alert("操作提示", "用户名只能是汉字并且在2-5位之间","error");
									return false;
								}else if(!patt1.test(u_password)){
									$.messager.alert("操作提示", "密码以字母开头，长度在6~18之间，只能包含字符、数字和下划线","error");
									return false;
								}
								if(flag) {
									var upwd=hex_md5(u_password);
									$.post(
										"insertUsers", {
											u_loginname: u_loginname,						
											u_password: upwd,
											u_protectemail: u_protectemail,
											u_protectmtel:u_protectmtel
										},
										function(res) {
											if(res>0) {
												$.messager.alert("操作提示", "新增成功","info");
												$("#adduser_window").window("close");
												$("#dg").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
											}
										}, "json");
								}
							}else{
								$.messager.alert("操作提示", res.message,"error");
							}
						}, "json");			
			}

			function updateInfo(index) {
				//将当前行数据填入表单
				var data = $("#dg").datagrid("getData"); //获取datagrid对应的json数据（对象集合）
				var row = data.rows[index]; //获取第index行对应的json对象。 index为传递过来的索引参数，从0开始，就像数组下标。
				var name = sessionStorage.getItem("name");
				$("#updateuserForm").form("load", row); //爽！使用form的load方法，快速将json对象的数据显示到 弹出窗口的表单元素之中。
				$("#updateuser_window").window("open"); //打开窗口。           
			}

			function closeUserForm() {
				$("#updateuser_window").window("close");
			}

			function submitupdateUserForm() {
				var flag = $("#updateuserForm").form("validate");
				var u_id = $("#updateu_id").val();
				var u_protectemail = $("#updateu_protectemail").val();
				var u_protectmtel = $("#updateu_protectmtel").val();
				if(!(/^1(3|5|7|8)\d{9}$/.test(u_protectmtel))) {
					$.messager.alert("操作提示", "手机号码有误，请从新输入","error");
					return false;
				}
				if(flag) {
					$.post(
							"selectUsersIsExect", {								
								u_protectemail:u_protectemail,
								u_protectmtel:u_protectmtel
							},
							function(res) {
								if(res.success) {
									$.post(
											"updateUsers", {
												u_id: u_id,
												u_protectemail: u_protectemail,
												u_protectmtel: u_protectmtel						
											},
											function(res) {
												//alert(res.success);
												if(res>0) {
													$.messager.alert("操作提示", "修改成功","info");
													/* alert("修改成功"); */ //此处建议修改为$.messager.alert()方法，请查阅帮助文档，自行修改。
													$("#updateuser_window").window("close");
													$("#dg").datagrid("reload");
												}
									}, "json");
								}else{
									$.messager.alert("操作提示", res.message,"error");
								}
				
							}, "json");		
					}
			}
			//删除
			function deleteInfo(index) {
				//弹出用户确认框
				$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
					if(r) { // 用户点击了确认按钮
						//真正执行删除的代码……
						var data = $("#dg").datagrid("getData"); //获取datagrid对应的json对象集合（再来一遍）。
						var row = data.rows[index]; //获取第index行对应的json对象（再来一遍）。
						var u_id = row.u_id;						
						$.post("deleteUsersById", {
							u_id:u_id						
						}, function(res) {
							/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？ */                 
							if(res>0) {
								$.messager.alert("操作提示", "删除成功","info");
								$("#dg").datagrid("reload");
							}
						});

					}
				});
			}
			//重置密码
			function resetPassword(index){
					$.messager.confirm('确认', '您确认想要重置密吗？', function(r) {
					if(r) { // 用户点击了确认按钮
						var data=$("#dg").datagrid("getData");
						var row=data.rows[index];
						var u_id=row.u_id;
						var u_password="a123456";
						var upwd=hex_md5(u_password);	
						var name = sessionStorage.getItem("name");
						var SelectName = $("#dg").datagrid("getSelected"); //获取datagrid对应的json对象集合（再来一遍）。																								
						$.post("updateResetU_password", {
							u_id: u_id,
							u_password:upwd
						}, function(res) {
							/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？ */                 
							if(res>0) {
								$.messager.alert("操作提示", "重置成功","info");
								$("#dg").datagrid("load");
							}else{
								$.messager.alert("操作提示", "重置失败","error");
							}
						});
					}
				});
			}
			//锁定用户
			function lockUser(index){
					$.messager.confirm('确认', '您确认想要锁定用户吗？', function(r) {
					if(r) { // 用户点击了确认按钮						
						var data=$("#dg").datagrid("getData");
						var row=data.rows[index];
						var u_id=row.u_id;
						$.post("updatelockUsers", {
							u_id: u_id							
						}, function(res) {
							/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？    */              
							if(res>0) {
								$.messager.alert("操作提示", "锁定成功","info");
								$("#dg").datagrid("load");
							}else{
								$.messager.alert("操作提示", "锁定失败","error");
							}
						});
					}
				});
			}
			//解锁用户
			function unlockUser(index){
					$.messager.confirm('确认', '您确认想要解锁用户吗？', function(r) {
					if(r) { // 用户点击了确认按钮						
						var data=$("#dg").datagrid("getData");
						var row=data.rows[index];
						var u_id=row.u_id;											
						$.post("updateUnlockUsers", {
							u_id:u_id
						}, function(res) {
							if(res>0) {
								/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？    */              
								$.messager.alert("操作提示", "解锁成功","info");
								$("#dg").datagrid("load");
							}else{
								$.messager.alert("操作提示", "解锁失败","error");
							}
						});
					}
				});
			}
			
			var u_id, r_id;
			//加载角色信息
            function loadMyRole() {          	
            	 $("#dgMyRole").datagrid({             	
                     url: 'selectUsersRole', //调用数据接口
                     queryParams: { //传递参数
                    	 u_id: u_id                                             
                     }
                 });
            }
            //设置
            function showRoles(index) {
            	var data=$("#dg").datagrid("getData");
				var row=data.rows[index];
				u_id=row.u_id;							 
                loadMyRole();
                $("#dd").dialog({
                    closed: false,
                    title: "您正在设置" + row.u_loginname + "的角色信息"
                });
            }
            $(function() {           	          	
                $("#dgAllRole").datagrid({               	
                    url: 'selectRoles' //调用数据接口
                    
                });
                 //把用户加入到选中的角色
                $("#btnToRight").click(function() {
                var row = $("#dgAllRole").datagrid("getSelected");                            
                    /*var row = $("#dgAllRole").datagrid("getSelected");*/
                    if(row != null) {
                    	r_id = row.r_id;
                        $.post( "SelectUserRolesEXIT", {                      	
                        	ur_userid: u_id,
                        	ur_roleid: r_id
                        }, function(res) {
                        	if(res==null||res==""){
                        		 $.post( "insertUserRoles", {                      	
                                  	ur_userid: u_id,
                                  	ur_roleid: r_id
                                  }, function(res) {
                                      if(res>0) {
                                          loadMyRole();
                                      } else {
                                          $.messager.alert("设置失败", r.message, "error");
                                      }
                                  }, "json");
                        	}else{
                        		$.messager.alert("操作提示", "该角色已存在","error");
                        	}                       	
                        }, "json");                       
                    }else{
                    	$.messager.alert("操作提示", "请选择角色","error");
                    }
                });
                //移除已经拥有的角色
                $("#btnToLeft").click(function() {
                    var row = $("#dgMyRole").datagrid("getSelected");
                    if(row != null) {
                    	r_id = row.r_id;
                        $.post("deleteUserRoles", {                       	
                        	ur_userid: u_id,
                        	ur_roleid: r_id
                        }, function(res) {
                            if(res) {
                                loadMyRole();
                            } else {
                                $.messager.alert("设置失败", r.message, "error");
                            }
                        }, "json");
                    }
                });
            }) 
            
	//设置动态显示列表
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
	<table name="center" class="easyui-datagrid" id="dg" title="用户列表">
			<thead>
				<tr>
					<th data-options="field:'u_id',width:80">编号</th>
					<th data-options="field:'u_loginname',width:100">用户名</th>
					<th data-options="field:'u_password',width:80,align:'right'">密码</th>
					<th data-options="field:'u_islockout',width:60,align:'right',formatter:formatteru_islockout">是否锁定</th>
					<th data-options="field:'u_lastlogintime',width:150">最后登录时间</th>
					<th data-options="field:'u_createtime',width:150,align:'center'">创建时间</th>
					<th data-options="field:'u_psdwrongtime',width:150,align:'center'">密码错误次数</th>
					<th data-options="field:'u_locktime',width:150,align:'center'">被锁定时间</th>
					<th data-options="field:'u_protectemail',width:150,align:'center'">邮箱</th>
					<th data-options="field:'u_protectmtel',width:150,align:'center'">手机号</th>
					<th data-options="field:'setRoleAction',width:60,align:'center',formatter:formatterSetRole">角色</th>
					<th data-options="field:'setUserAction',width:120,align:'center',formatter:formatterOPUser">操作</th>
					<th data-options="field:'setPassword',width:80,align:'center',formatter:formatterResetPassword">操作</th>
					<th data-options="field:'setLock',width:140,align:'center',formatter:formatterLockUser">用户操作</th>
				</tr>
			</thead>
		</table>
<div id="usertb" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				名称: <input class="easyui-textbox" id="u_loginname"  style="width:80px">
				起止时间: <input class="easyui-datebox" id="Minu_createtime" style="width:120px">-<input class="easyui-datebox" id="Maxu_createtime" style="width:120px">
				<span>是否锁定：</span>				
				<select id="u_islockout" class="easyui-combobox" name="u_islockout" style="height:auto;width: 90px;">
				    <option value="">请选择</option>
				    <option value="1">是</option>
				    <option value="0">否</option>
				</select>  				
				   <span>排序：</span>
				 <select id="orderBy" class="easyui-combobox" name="orderBy" style="height:auto;width: 120px;">
				    <option value="">请选择</option>
				    <option value="u_createtime">创建时间</option>
				    <option value="u_lastlogintime">最后登录时间</option>
				   </select>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>
				<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			</div>
		</div>
 		
		<!--新增-->
		<div id="adduser_window" class="easyui-window" title="新增用户信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="adduserForm">
				<table cellpadding="5">
					<tr>
						<td>用户名:</td>
						<td><input class="easyui-textbox" type="text" name="u_loginname" id="insertu_loginname" data-options="required:true,validType:'length[2,12]'"></input>
						</td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="password" id="insertu_password" name="u_password" data-options="required:true,validType:'length[6,12]'"></input>
						</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input class="easyui-textbox" type="text" name="u_protectemail" id="insertu_protectemail" data-options="required:true,validType:'email'"></input>
						</td>
					</tr>

					<tr>
						<td>手机号:</td>
						<td><input type="text" class="easyui-numberbox" id="insertu_protectmtel" name="u_protectmtel" data-options="required:true"></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitUserForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearUserForm()">取消</a>
			</div>
		</div>
		<!--修改-->
		<div id="updateuser_window" class="easyui-window" title="修改用户信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="updateuserForm">
				<table cellpadding="5">
					<tr>
						<td>编号:</td>
						<td><input class="easyui-textbox" type="text" name="u_id"  id="updateu_id" data-options="required:true" style="display:none;"></input>
						</td>
					</tr>
					<tr>
						<td>用户名:</td>
						<td><input class="easyui-textbox" type="text" name="u_loginname" readonly disabled="disabled" id="updateu_loginname" data-options="required:true"></input>
						</td>
					</tr>
					<!--<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="password" id="pwd" name="pwd" data-options="required:true"></input>
						</td>
					</tr>-->
					<tr>
						<td>Email:</td>
						<td><input class="easyui-textbox" type="text" name="u_protectemail" id="updateu_protectemail" data-options="required:true,validType:'email'"></input>
						</td>
					</tr>

					<tr>
						<td>手机号:</td>
						<td><input type="text" class="easyui-numberbox" id="updateu_protectmtel" name="u_protectmtel" data-options="required:true"></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitupdateUserForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUserForm()">取消</a>
			</div>
		</div>






       <!--设置用户-->
        <div id="dd" class="easyui-dialog" title="设置用户信息 " style="width:500px;height:500px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
            <table id="tabEdit">
                <tr>
                    <td>
                        <table id="dgAllRole" class="easyui-datagrid" title="系统所有角色" data-options="singleSelect:true,rownumbers:true" style="width:180px">
                            <thead>
                                <tr>
                                    <th data-options="field:'r_id',width:80,hidden:true">编号</th>
                                    <th data-options="field:'r_name',width:100">名称</th>
                                </tr>
                            </thead>
                        </table>
                    </td>
                    <td>
                        <input id="btnToRight" type="button" value=">>" title="把用户加入到选中的角色" />
                        <br/>
                        <input id="btnToLeft" type="button" value="<<" title="移除已经拥有的角色" />
                    </td>
                    <td valign="top" align="right">
                        <table id="dgMyRole" class="easyui-datagrid" title="当前用户的角色" data-options="singleSelect:true,rownumbers:true" style="width:180px">
                            <thead>
                                <tr>
                                    <th data-options="field:'r_id',width:80,hidden:true">编号</th>
                                    <th data-options="field:'r_name',width:100">名称</th>
                                </tr>
                            </thead>
                        </table>
                    </td>
                </tr>
            </table>
        </div> 
<!-- 导出excel -->
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
	var data = JSON.stringify($('#dg').datagrid('getData').rows);
	if (data == '')
		return;

	JSONToCSVConvertor(data, "数据信息", true);
});

</script>
</body>
</html>