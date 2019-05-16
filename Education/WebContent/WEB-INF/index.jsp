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
		<script type="text/javascript" src="https://unpkg.com/vue"></script>
		<script type="text/javascript">
	 	$(function(){
	 		
	 		$('#tt').tree({
	 			onClick: function(node){
	 				
	 				var flag = $("#ta").tabs('exists', node.text);
	                var isLeaf = $('#m_id').tree('isLeaf',node.target); //是否是叶子节点
	                if (isLeaf) {//只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
	                    if(!flag) {
	                        $('#ta').tabs('add', { //在选项卡中，创建1个选项页
	                            title: node.text,   //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
	                            closable: true,
	                            content: "<iframe width='100%' height='100%' src='"+node.m_path+"'/>"    //此处做了调整，推荐使用iframe的方式实现
	                       });
	                    } else {
	                        $("#tt").tabs('select', re); //直接选中title对应的选项卡
	                    }
	                }
	 			}
	 		});
	 		var u_loginname = sessionStorage.getItem("u_loginname");
	 		var u_password = sessionStorage.getItem("u_password");
	 		$("#spUName").text(u_loginname);
	 		/* alert(u_loginname);
	 		alert(u_password); */
		$('#tt').tree({    
		    url:'ModulesAll',
		    method:'post',
		    queryParams:{
		    	u_loginname:u_loginname,
		    	u_password:u_password
		    }/* ,
		    function(res){  //res是返回的html代码
		    	if(res>0){
		    		alert(111);
		    	}
                
            } */
		    
		    
		    
		});
		/* $('#tt').tree({    
		    url:'ModulesAll',
		    method:'post',
		    loadFilter: function(res){    
		        alert(res)
		    }    
		});*/ 
		
		}); 
	 	
	 	function navTab(){
	 		/* var nodes = $('#tt').tree('getSelected'); */
	 		console.log(nodes);
	 		
	 		var flag = $("#ta").tabs('exists', re);
	        $('#tt').tree({ //和前边加载数据的代码中的"treeUIId"参数,保持一致即可
	        	onClick:function(node){
	            	alert(node.m_path);
	                var isLeaf = $('#m_id').tree('isLeaf',node.target); //是否是叶子节点
	                if (isLeaf) {//只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
	                    if(!flag) {
	                        $('#ta').tabs('add', { //在选项卡中，创建1个选项页
	                            title: re,   //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
	                            closable: true,
	                            content: "<iframe width='100%' height='100%' src='"+html+"'/>"    //此处做了调整，推荐使用iframe的方式实现
	                       });
	                    } else {
	                        $("#tt").tabs('select', re); //直接选中title对应的选项卡
	                    }
	                }
	            }
	        });
	    }	
		
		/* $(function() {  
	        $(document).ready(function() {  
	   
	            $.post("ModulesAll", {}, function(json) {  
	   
	                $("#tt").tree({  
	                    data : json.itemsList,  
	                    onClick : function(node) {  
	                        $.post("./test/tree.action", {  
	                            "id" : node.id  
	                        }, function(json) {  
	                            $('#tt').tree('append', {  
	                                parent : node.target,  
	                                data : json.data  
	                            });  
	                        }, "json");  
	   
	                    }  
	                });  
	            }, "json");  
	        });  
	    });   */
		function out(){
    		$.messager.confirm('确认', '您确认想要退出登录吗？', function(r) {
					if(r) { // 用户点击了确认按钮
						
							window.location.href="tologin"; 
						 
			

					}
				});
    		
    	}
		</script>
</body>
	
		<div style="margin:20px 0;">
    <div class="easyui-layout" style="width:100%;height:700px;">
        <div data-options="region:'north'" style="height:50px">
        	CRM系统&nbsp;&nbsp;欢迎您：<span id="spUName"></span>
        	<a id="btn" style="cursor: pointer;" onclick="out()">安全退出</a>
        </div>
        <div data-options="region:'south',split:true" style="height:50px;"></div>
        <!--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>-->
        <div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
           <div id="divTest" title="请选择模块" style="width: 650px;height: 500px;">
			<ul id="tt">
				
			</ul>
		</div>
        </div>
        <div id="centerTabs" data-options="region:'center',split:true" style="width: 100%;">
            <div id="ta" class="easyui-tabs" data-options="fit:'true'"> <!--这个地方采用tabs控件进行布局-->
             
            </div>
        </div>
        
    </div>
    </div>
    
    
    
    <!-- <ul id="treeUlId" class="easyui-tree">
    
    <li><span><a title="4" onclick="navTab('系统管理','')">系统管理</a></span>
    <ul>
    <li><span><a title="8" onclick="navTab('模块管理','syss/Modules.html')">模块管理</a></span></li>
    <li><span><a title="6" onclick="navTab('角色管理','sys/jdgl.html')">角色管理</a></span></li>
    <li><span><a title="5" onclick="navTab('用户管理','sys/yh.html')">用户管理</a></span></li>
    </ul>
    </li>
    </ul> -->
</html>