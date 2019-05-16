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
			myTree();
			})
			function myTree(){
				$('#tt').tree({ 
					url: 'selectModulesAll',
					method:'post',
					lines:true,
    				onContextMenu:function(e,node){
        			e.preventDefault();
        			$("#tt").tree('select',node.target);
        			$("#mm").menu('show',{
        				left:e.pageX,
        				top:e.pageY
        			});
        		}
			});  
			}
			
		
			
//点击新增按钮
        function addModuleInfo(){
            var nodes = $('#tt').tree("getSelected");    // get checked nodes
            // alert(nodes.text);//获取
            alert(nodes.id);//获取节点id
            if(nodes!=null){
                //将当前行数据填入表单
                $("#parentModulename").text(nodes.text);
                /* $("#parentModulename").text(nodes.id); */
                $("#addModule_window").window("open");
            }else{
                alert("请选择父节点！");
            }
        }
        //点击新增保存按钮
        function submitModuleForm(){
            var nodes = $('#tt').tree('getSelected');
            var flag=$("#addModuleForm").form("validate");
            var m_name=$("#m_name").val();
            var m_weight=$("#m_weight").val();
            var m_path=$("#m_path").val();
            alert(nodes.id);
            $.post("selectModulesExict",
                    {    
                	m_name:m_name
                             
                    }, 
                    function(res){
                        //alert(res.message);
                        if(res == null || res == ""){
                        	 if(flag){
                                 $.post("insertModules",
                                     {    
                                 	m_name:m_name,
                                 	m_parentid: nodes.id, 
                                 	m_path: m_path,
                                     m_weight: m_weight               
                                     }, 
                                     function(res){
                                         //alert(res.message);
                                         if(res>0){
                                             alert("新增成功");
                                             $("#addModule_window").window("close");
                                             
                                             myTree();
                                             
                                         }                            
                                 },"json");
                             }    
                            
                        }else{
                        	alert("该节点名称已存在，请重新输入");
                        }                            
                },"json");
           
        }
         //点击新增取消按钮
        function clearModuleForm(){
            $('#addModuleForm').form('clear');
            $("#addModule_window").window("close");
        }
        //修改
        function updateModuleInfo(index) {
    	var nodes = $('#tt').tree('getSelected');
    	/* alert(nodes.text);
    	console.log(nodes);
    	alert(nodes.m_weight); */
	if(nodes!=null){
		$.post("selectModulesById",{
			m_id:nodes.id		
		},function(data){
			 /* alert(data); */
			/*alert(data.m_name); */
          /*   console.log("data = "+data);
			alert(data.m_name); */
					/* var data=eval("("+data.m_name+")"); */
					/* alert(data); */
					/* $("#updatem_name").textbox("setValue",data.m_name); */
					$("#UpdateModuleForm").form("load",data);
                	$("#updateModule_window").window("open");				
				},"json");
			}else{
                alert("请选择父节点！");
            }
  	/*var nodes = $('#tt').tree("getSelected");

            // alert(nodes.text);//获取
            //alert(nodes.id);//获取节点id
            if(nodes!=null){
                //将当前行数据填入表单
                
                $("#Modulename_1").text(nodes.text);
                $("#updateModule_window").window("open");
            }else{
                alert("请选择父节点！");
            }*/
       
			}

			function cleardeleteModuleForm() {
				$("#updateModule_window").window("close");
			}

			function submitupdateModuleForm() {
				/*var row = data.rows[index]; //获取第index行对应的json对象（再来一遍）。
				var mId = row.Id;*/
				var nodes = $('#tt').tree('getSelected');
				 var m_name=$("#updatem_name").val();
		         var m_weight=$("#updatem_weight").val();
		         var m_path=$("#updatem_path").val();
		         alert(nodes.id);

				$.post("updateModules", 
				{
						m_id: nodes.id, 
						m_name:m_name, 
						m_path:m_path,
                        m_weight:m_weight,
						
					},
					function(res) {
						//alert(res.success);
						if(res>0) {
							alert("修改成功"); //此处建议修改为$.messager.alert()方法，请查阅帮助文档，自行修改。
							$("#updateModule_window").window("close");
                            myTree();
                            
						}
					}, "json");
					
			}
				//删除
			function deleteModuleInfo(index) {
				//弹出用户确认框
				$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
					if(r) { // 用户点击了确认按钮
						//真正执行删除的代码……
						var nodes = $('#tt').tree('getSelected');
						
						var m_id = nodes.id;
						alert(m_id);
						
						$.post("deleteModules", {
							m_id: m_id							
						}, function(res) {
							/* var deleteInfo = eval("(" + deleteInfo + ")"); //你知道这里可以如何修改从而变得更简单么？ */                 
							if(res>0) {
								alert("删除成功");
								myTree();
							}
						});

					}
				});
			}
		</script>
</head>
<body>
	<table name="center1" class="easyui-datagrid" id="Moduledg" title="模块信息" style="width: 300;height: 400;" data-options="method:'post'">
			
		</table>
	<!--	<div style="margin-bottom: 10px;">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addModuleInfo()">新增</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateModuleInfo()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="deleteModuleInfo()">删除</a>
		</div>-->
		<div id="divTest" title="请选择模块" style="width: 650px;height: 500px;">
			<ul id="tt">
				
			</ul>
		</div>
		<div id="mm" class="easyui-menu"  style="width: 160px;">
			<div data-options="iconCls:'icon-add',name:'add'" onclick="addModuleInfo()">追加</div>
			<div data-options="iconCls:'icon-edit',name:'edit'" onclick="updateModuleInfo()">修改</div>
			<div data-options="iconCls:'icon-remove',name:'remove'" onclick="deleteModuleInfo()">删除</div>
		</div>
		<!--新增-->
		<div id="addModule_window" class="easyui-window" title="新增模块信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="addModuleForm">
				<table cellpadding="5">
					<tr>
						<td>节点名称:</td>
						<td><div id="parentModulename"></div></td>
					</tr>
					<!-- <tr>
						<td>父节点Id：</td>
						<td><input class="easyui-textbox" type="text" name="m_id" id="m_id" data-options="required:true" style="display: none;"/></td>						
					</tr> -->
					<tr>
						<td>权重：</td>
						<td><input class="easyui-numberbox" type="text" name="m_weight" id="m_weight" data-options="required:true" /></td>						
					</tr>
					<tr>
						<td>URL：</td>
						<td><input class="easyui-textbox" type="text" name="m_path" id="m_path" data-options="required:true" /></td>						
					</tr>
					<tr>
						<td>模块名称：</td>
						<td><input class="easyui-textbox" type="text" name="m_name" id="m_name" data-options="required:true" /></td>						
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitModuleForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearModuleForm()">取消</a>
			</div>
		</div>
		<!--修改-->
			<div id="updateModule_window" class="easyui-window" title="修改模块信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
			<form id="UpdateModuleForm">
				<table cellpadding="5">
					<tr>
						<td>权重：</td>
						<td><input class="easyui-numberbox" type="text" name="m_weight" id="updatem_weight" data-options="required:true" /></td>						
					</tr>
					<tr>
						<td>URL：</td>
						<td><input class="easyui-textbox" type="text" name="m_path" id="updatem_path" data-options="required:true" /></td>						
					</tr>
					<tr>
						<td>模块名称：</td>
						<td><input class="easyui-textbox" type="text" name="m_name" id="updatem_name" data-options="required:true" /></td>						
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="submitupdateModuleForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="cleardeleteModuleForm()">取消</a>
			</div>
		</div>
</body>
</html>