<%@ page language="java" import="com.crm.util.MD5" contentType="text/html; charset=UTF-8"
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
		<script type="text/javascript" src="https://unpkg.com/vue"></script>
		<script type="text/javascript" src="js/incubator-echarts-4.2.1/dist/echarts.min.js"></script>
		<!-- <script type="text/javascript" src="js/incubator-echarts-4.2.1/dist/echarts.js"></script>
		<script type="text/javascript" src="js/incubator-echarts-4.2.1/test/lib/esl.js"></script>
        <script type="text/javascript" src="js/incubator-echarts-4.2.1/test/lib/config.js"></script>
       
        <script type="text/javascript" src="js/incubator-echarts-4.2.1/test/lib/facePrint.js"></script>
        <script type="text/javascript" src="js/incubator-echarts-4.2.1/test/lib/testHelper.js"></script> -->
		<script type="text/javascript">
	 	$(function(){
	 		var myChart = echarts.init(document.getElementById('main'));
	 		 $.ajax({
	 			url:'SelectTongJi',
	 			type:'post',
	 			async: true,
	 			dataType:'json',
	 			success:function (result) {
	 				var option = {
	 					    title : {
	 					        text: 'CRM系统用户来源渠道',
	 					        subtext: '数据显示',
	 					        x:'center'
	 					    },
	 					    tooltip : {
	 					        trigger: 'item',
	 					        formatter: "{a} <br/>{b} : {c} ({d}%)"
	 					    },
	 					    legend: {
	 					        orient: 'vertical',
	 					        left: 'left',
	 					        data:result
	 					    },
	 					    series : [
	 					        {
	 					            name: '访问来源',
	 					            type: 'pie',
	 					            radius : '55%',
	 					            center: ['50%', '60%'],
	 					           data:result,
	 					            itemStyle: {
	 					                emphasis: {
	 					                    shadowBlur: 10,
	 					                    shadowOffsetX: 0,
	 					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	 					                }
	 					            }
	 					        }
	 					    ]
	 					};
	 				myChart.setOption(option);
	 			}
	 		 })
	 		
			/* // 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'));

			// 指定图表的配置项和数据
			var option = {
				    title : {
				        text: '某站点用户访问来源',
				        subtext: '纯属虚构',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data: ['百度','百度移动端','360','360移动端','搜狗','搜狗移动端']
				    },
				    series : [
				        {
				            name: '访问来源',
				            type: 'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data:[
				                {value:335, name:'百度'},
				                {value:310, name:'百度移动端'},
				                {value:234, name:'360'},
				                {value:135, name:'360移动端'},
				                {value:1548, name:'搜狗'},
				                {value:666, name:'搜狗移动端'}
				            ],
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				            }
				        }
				    ]
				};


			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option); */
	 		qiandaosize();
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
	                        $("#tt").tabs('select',node.text); //直接选中title对应的选项卡
	                    }
	                }
	 			}
	 		});
	 		var u_loginname='${sessionScope.users.u_loginname}';
	 		var u_password='${sessionScope.users.u_password}';
	 		
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
						sessionStorage.clear();
							window.location.href="tologin"; 
						 
			

					}
				});
    		
    	}
function qiandao(){
	    	
	    
	    	
	    	var date=$("#time").text();
	    	var dat=new Date();
	    	
	    	/* alert(dat.getMinutes()); */
	    	
	    	if(dat.getHours!="08"){
	    		if(dat.getMinntes>15){
	    			$.messager.alert("操作提示", "抱歉不在签到时间","error");
		    		return false;
	    		}
	    		
	    	}
	    	var uc_userid='${sessionScope.users.u_id}';
	    	var uc_loginname='${sessionScope.users.u_loginname}';
	    /* 	alert(uc_userid);
	    	alert(uc_loginname); */
	    	$.post("insertUserchaecks",{
	    		uc_userid:uc_userid,
	    		uc_loginname:uc_loginname
	    	},function(res){
	    		if(res>0){
	    			$.messager.alert("操作提示", "签到成功","info");
	    		}else{
	    			$.messager.alert("操作提示", "签到失败","error");
	    		}
	    	},"json")
	    	$('#qiandao').linkbutton('disable');
	    }
	    
	    function UpdatePassword() {	    	
			$("#updateuser_window").window("open"); //打开窗口。 
		}
	    function submitupdateUserForm() {
	    	var u_id='${sessionScope.users.u_id}';
	    	var u_password='${sessionScope.users.u_password}';
			
	    	var flag = $("#updateuserForm").form("validate");
			var initPassword = $("#initPassword").val();
			var NewPassword = $("#NewPassword").val();
			var NextNewPassword = $("#NextNewPassword").val();	
			var patt1 = /^[a-zA-Z]\w{5,17}$/;
			var upwd=hex_md5(initPassword);			
		if(u_password==upwd){
			if(NewPassword==NextNewPassword){
				if(!patt1.test(NextNewPassword)){
					$.messager.alert("操作提示", "密码以字母开头，长度在6~18之间，只能包含字符、数字和下划线","error");
					return false;
				}
			if(flag) {				
				var Newupwd=hex_md5(NextNewPassword);
				$.post(
					"UpdatePassword", {
						u_id: u_id,
						u_password: Newupwd											
					},
					function(res) {
						//alert(res.success);
						if(res>0) {
							$.messager.alert("操作提示", "修改成功,请重新登录","info");
							$("#updateuser_window").window("close");
							window.location.href="inlogin";
						}
					}, "json");
					}
			}else{
				$.messager.alert("操作提示", "两次密码不一致","error");
			}
		}else{
			$.messager.alert("操作提示", "原密码输入错误","error");
		}
			
		}
	    function qiandaosize(){
	    	var date=new Date();
	    	var year=date.getFullYear();/* 年 */
	    	var Moth=date.getMonth()+1;/*月*/
	    	var Day=date.getDate();/*日*/
	    	
	    	var time='';
	    	if(Moth<10){
	    		time=year+"-"+"0"+Moth+"-"+Day
	    	}else{
	    		time=year+"-"+Moth+"-"+Day
	    	}
	    	
	    	var uc_userid='${sessionScope.users.u_id}';
	 		$.post("qiandao",{
	 			uc_userid:uc_userid,
	 			uc_checkintime:time
	 		},function(res){
	 			if(res>0){
	 				$('#qiandao').linkbutton('disable');
	 			}else{
	 				
	 			}
	 		},"json")
	    }
function qiandao(){
	    	
	    
	    	
	    	
	    	var dat=new Date();
	    	var hours=dat.getHours();   
	    	var Minntes=dat.getMinutes();
	    	/* alert(hours);
	    	alert(Minntes); */
	    	if(hours!=8){
	    		$.messager.alert("操作提示", "抱歉，不在签到时间","error");
	    		return ;
	    	}else{
	    		if(Minntes>15){
	    			$.messager.alert("操作提示", "抱歉，不在签到时间","error");
	    			return;
	    		}else{
	    			var uc_userid='${sessionScope.users.u_id}';
	    	    	var uc_loginname='${sessionScope.users.u_loginname}';
	    	    	$.post("insertUserchaecks",{
	    	    		uc_userid:uc_userid,
	    	    		uc_loginname:uc_loginname
	    	    	},function(res){
	    	    		if(res>0){
	    	    			$.messager.alert("操作提示", "签到成功","info")
	    	    		}else{
	    	    			$.messager.alert("操作提示", "签到失败","error");
	    	    		}
	    	    	},"json")
	    	    	$('#qiandao').linkbutton('disable');
	    		}
	    	}
	    	
	    	
	    }
	    
   


//打开消息表单
function xiaoxi() {
	$("#Notice_window").window("open");
	initNotice();
}

//初始化消息表格
function initNotice() {
	var n_userid='${sessionScope.users.u_id}';
	$("#NoticeTab").datagrid({
		url:'SelectNotice',
		method:'post',
		pagination:true,
		queryParams:{
			no_userid:n_userid
			
		}	
		
	})
	 window.addEventListener("mousewheel", (e) => {
		   if (e.deltaY === 1) {
		     e.preventDefault();
		   }
		 })
}
//格式化查看日志详情
function formatterLookNotice(value,row,index){	
	return "<a href='javascript:void(0)' onclick='lookNotice("+index+")'>查看</a>"
}
//格式化状态
	function formatterno_state(value,row,index) {
		return value == 1 ? '<font color="blue">已读</font>':'<font color="red">未读</font>';
	}
//日志详情查看
function lookNotice(index) {
	var data = $("#NoticeTab").datagrid("getData"); 
	var row = data.rows[index]; 
	$("#no_state").textbox('setValue',row.no_state == 0? "未读":"已读");
	$("#LookNoticeForm").form("load", row);
	$("#LookNotice_window").window("open");
	$.post("UpdateNotice", {
				no_id:$("#no_id").val(),
				no_state:1
						
		},
		function(res) {
		if(res>0) {
			
			$("#NoticeTab").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
			
		}else{
			
		}
	}, "json");

	
}  

self.setInterval("Notices()",10000); 

function Notices() {
	var u_id='${sessionScope.users.u_id}';
	$.post("SelectNoticeCount", {
		no_userid:u_id,
		no_state:0
				
},
function(res) {
if(res>0) {
	$("#source").text(res);
	
}else{
	
}
}, "json");
}
		</script>
</body>
	
		<div style="margin:20px 0;">
    <div class="easyui-layout" style="width:100%;height:700px;">
        <div data-options="region:'north'" style="height:50px">
        	CRM系统&nbsp;&nbsp;欢迎您：<span id="spUName"></span>
        	<a id="btn" style="cursor: pointer;" onclick="out()">安全退出</a>
        	<a id="btn" style="cursor: pointer;" onclick="UpdatePassword()">修改密码</a>
        	<a id="qiandao" onclick="qiandao()" class="easyui-linkbutton" value="0" text="签到"></a>
        	<a style="float:right;margin-top: 10px" id="xiaoxi" onclick="xiaoxi()" class="easyui-linkbutton" iconCls="icon-tip"><span id="source" style="background-color: red" class="badge"></span></a>
        </div>
         <div id="time">
			 <script>
		        document.getElementById('time').innerHTML = new Date().toLocaleString()
		                + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
		        setInterval(
		                "document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
		                1000);
    </script>			
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
              <div data-options="region:'center',split:true" title="首页" >
                <div id="main" style="width: 600px;height:400px;"></div>

              </div>
            </div>
        </div>
        
    </div>
    </div>
    
    <!-- 消息表格  -->
		  <div id="Notice_window" class="easyui-window" title="消息信息" data-options="closed:true,   
            left:'1550px',top:'66px'" style="width:365px;height:300px;">
			<table id="NoticeTab" class="easyui-datagrid">
				<thead>
					<tr>
						<!-- <th data-options="field:'no_id'">ID</th> -->
						
						<th data-options="field:'username'">发送人姓名</th>
						
						<!-- <th data-options="field:'no_userid'">接收人id</th> -->
						
						<th data-options="field:'sendingtime'">发送时间</th>	
							
						<!-- <th data-options="field:'receivingtime'">接收时间</th> -->
						
						<!-- <th data-options="field:'no_content'">消息内容</th> -->
						
						<th data-options="field:'no_state',formatter:formatterno_state">状态</th>
		
						<th data-options="field:'look',title:'查看',formatter:formatterLookNotice"></th>
					</tr>
				</thead>
			</table>
		  </div>
		  <!-- Look消息  -->
		  <div id="LookNotice_window" class="easyui-window" title="消息详情" data-options="closed:true,left:'1550px',top:'66px'" style="width:360px;height:300px;padding:10px;">
			<form id="LookNoticeForm" class="easyui-form">
				<table cellpadding="5">
					
					<tr style="display: none">
						<td>ID:</td>
						<td><input class="easyui-textbox" name="no_id" id="no_id"></input>
						</td>
					</tr>
					<tr>
						<td>发送人姓名:</td>
						<td><input class="easyui-textbox" name="username" id="username"></input>
						</td>
					</tr>
					<!-- <tr style="display: none">
						<td>接收人id:</td>
						<td><input class="easyui-textbox" name="no_userid" id="no_userid"></input>
						</td>
					</tr> -->
					<tr>
						<td>发送时间:</td>
						<td><input class="easyui-textbox" name="sendingtime" id="sendingtime"></input>
						</td>
					</tr>
					<!-- <tr> 
						<td>接收时间:</td>
						<td><input class="easyui-textbox" name="receivingtime" id="receivingtime"></input>
						</td>
					</tr> -->
					<tr>
						<td>消息内容:</td>
						<td><!-- <input class="easyui-textbox" name="no_content" id="no_content"></input> -->
							<textarea rows="4" cols="30" name="no_content" id="no_content"></textarea>
						</td>
					</tr>
					<tr>
						<td>状态:</td>
						<td><input class="easyui-textbox" name="no_states"  id="no_state"></input>
						</td>
					</tr>
					

				</table>
			</form>
			
		</div>
    
    <!--修改-->
		<div id="updateuser_window" class="easyui-window" title="修改您的密码" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:15px;">
			<form id="updateuserForm">
				<table cellpadding="5">
					<tr>
						<td>原密码:</td>
						<td><input class="easyui-textbox" type="password" name="initPassword"  id="initPassword" data-options="required:true""></input>
						</td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input class="easyui-textbox" type="password" name="NewPassword"   id="NewPassword" data-options="required:true"></input>
						</td>
					</tr>					
					<tr>
						<td>确认新密码:</td>
						<td><input class="easyui-textbox" type="password" name="NextNewPassword" id="NextNewPassword" data-options="required:true"></input>
						</td>
					</tr>					
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitupdateUserForm()">保存</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUserForm()">取消</a>
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