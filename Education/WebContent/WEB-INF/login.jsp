<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link type="text/css" rel="stylesheet" href="js/style.css">
		<script type="text/javascript" src="js/md5.js"></script>
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/img_ver.js"></script>
		<link rel="stylesheet" type="text/css" href="js/insdep.easyui.min.css" />
		<link rel="stylesheet" type="text/css" href="js/icon.css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/insdep.extend.min.js"></script>
		<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">

 
	

	
	 //遍历获取cookie中的值
	  function getCookie(name){
		  var strCookie=document.cookie; 
		 
		  var arrCookie=strCookie.split("; "); 
		  for(var i=0;i<arrCookie.length;i++){ 
		  var arr=arrCookie[i].split("="); 
		  if(arr[0]==name)return arr[1]; 
		  } 
		  return ""; 
	 } 


/* $(function(){
	var nameCookie= decodeURI(document.cookie.split("nameCookie=")[1].split(";")[0]);
	var pwdCookie= decodeURI(document.cookie.split("pwdCookie=")[1].split(";")[0]);	
	var JLogname = document.getElementById("u_loginname").value;  */
	/*  var Logname= $("input[id='u_loginname']").attr("value"); */ 
/* 	if(nameCookie!=null && nameCookie!="" && pwdCookie!=null && pwdCookie!=""){
		var chk = document.getElementById('ch');
		chk.checked = true;
	}
}) 
 */
function btnLogin(){	
/* 	var useru_loginname='${sessionScope.users.u_loginname}';
	var useru_password='${sessionScope.users.u_password}';
	var useru_islockout='${sessionScope.users.u_islockout}';
	var kie=$("#kie").val();
	var pwd=$("#pwd").val(); */
	var u_loginname=$("#u_loginname").val();  //获取表单中的用户名。注意：验证框可以使用jQuery的val方法获取，如果是textbox，则需要通过$("#ename").textbox("getValue"); 来获取
	var u_password=$("#u_password").val();//获取用户密码 
	var inputStr = $("#checks").val();
	var ch=$("#ch").prop("checked");
	var yh = /^[\u4E00-\u9FA5]{2,5}$/;
	var patt1 = /^[a-zA-Z]\w{5,17}$/;
/* 	var nameCookie= decodeURI(document.cookie.split("nameCookie=")[1].split(";")[0]);
	var pwdCookie= decodeURI(document.cookie.split("pwdCookie=")[1].split(";")[0]); */
	 var nameCookie= decodeURI(getCookie('nameCookie'));
	 var pwdCookie= decodeURI(getCookie('pwdCookie'));
/*  	alert(nameCookie);
	alert(pwdCookie);			
	alert(u_loginname);	  */
	if(nameCookie!=null && nameCookie!="" && pwdCookie!=null && pwdCookie!="" && nameCookie== u_loginname){
		  		$.post(
			        "login",  //注意地址
			        {    
			        	nameCookie:nameCookie,
			        	pwdCookie:pwdCookie			        		        	
			        },  
			        function(res){			        	        	
			        		if(res.success){	        				                             
				            	window.location.href="inindex";  
			        		}else{ 
			        			alert(res.message);
			        			window.location.href="inlogin";	        			
			        		 } 	        			        		        		  	        	                         
			    },"json");
		}else{
	
				if(u_loginname==null || u_loginname ==""){	 
					  /* alert(inputStr); */
					  	alert("用户名不可为空");
				}else if(u_password==null || u_password ==""){
						alert("密码不可为空");
				}else if(inputStr==null || inputStr==""){
						alert("请输入验证码");
				}/* else if(!yh.test(u_loginname)){
					    alert("用户名只能是汉字并且在2-5位之间");
				} */else if(!patt1.test(u_password)){			
					    alert("密码以字母开头，长度在6~18之间，只能包含字符、数字和下划线");	
				}else{
					inputStr = inputStr.toUpperCase();//将验证码转为大写
					var upwd=hex_md5(u_password);
				    $.post(
				        "login",  //注意地址
				        {    
				        	u_loginname:u_loginname,
				        	u_password:upwd,
				        	ch:ch,
				        	inputStr:inputStr	        	
				        },  
				        function(res){				               	
				        		if(res.success){	        				                             
					            	window.location.href="inindex";  
				        		}else{
				        			if(res.message=="验证码错误！！！"){
				        				getVerify();
				        				document.getElementById("checks").value="";
				        			}else{
				        				alert(res.message);
					        			window.location.href="inlogin";	      
				        			}
				        			  			
				        		 } 	        			        		        		  	        	                         
				    },"json");
				}
			}
		}


	//清除cookie
	function clearCookie(name) {
		   var exp = new Date();
		    exp.setTime(exp.getTime() - 1);
		    var cval=getMyCookie(name);

	}
	function ClearPassword() {
		alert(11);
		
		 $.messager.confirm('确认', '您确认想要忘记密码吗？', function(r) {
				if(r) { // 用户点击了确认按钮
					clearCookie(getCookie('nameCookie')); 
					clearCookie(getCookie('pwdCookie')); 
					alert(11);
				}
			});
	}



	$(document.body).ready(function () {	
	        //首次获取验证码	
	        $("#imgVerify").attr("src","/Education/getVerify?"+Math.random());	
	    });	
	    //获取验证码	
	    function getVerify(){	
	        var src1=document.getElementById('imgVerify')	
	        src1.src = "/Education/getVerify?"+Math.random();	
	    }

    //校验验证码

/*     function checkSum(){

        var html1=document.getElementById('loginingForm');

        var inputStr = $("#checks").val();

        if(inputStr!=null && inputStr!="" && inputStr!="验证码:"){

            inputStr = inputStr.toUpperCase();//将输入的字母全部转换成大写

            html1.action="/user/login?inputStr="+inputStr;//提交表单

        }else{

            alert("验证码不能为空!");

        }

    } */

    //登录验证

/*     function doLogin() {

        var userName=document.getElementById('userName').value;

        var password=document.getElementById('password').value;

        if(null==userName||null==password||""==userName||""==password){

            alert('用户名或密码不能为空!');

        }else {

            //校验验证码

            checkSum();

        }

    } */

    function _b()//绑定回车键登录
    {
    if(event.keyCode ==13)
    	btnLogin();
    }

</script>
<style>
        .bxs-row {
            margin-bottom:12px;
        }
        .logo-box {
            width:404px;
            margin:120px auto;
            border:1px solid #e5e5e5;
            border-radius:4px;
            box-shadow:0 4px 18px rgba(0,0,0,0.2);
            position:relative;
            overflow:hidden;
            height:390px;
        }
        .login {
            position:absolute;
            width:320px;left:0;
            top:0;
            padding: 42px 42px 36px;
            transition:all 0.8s;
        }
        .username,.password,.btn {
            height: 44px;
            width: 100%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background: #fff;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;
        }
        .submit {
            background-color: #0070ba;
            color:#fff;
            border:1px solid #0070ba;
        }
        .submit:hover {
            background-color:#005ea6;
        }
        .verBox {
            position:absolute;
            width:100%;
            text-align:center;
            left:404px;
            top:0;
            opacity:0;
            transition:all 0.8s;
            padding-top:55px;
        }
        .err {
            margin:12px 0 0;
            line-height:12px;
            height:12px;
            font-size:12px;
            color:red;
        }
</style>

</head>

<body onKeyDown = "_b()">
	<div class="logo-box">
		<div class="login">			
			<div class="bxs-row">
				<input type="text" class="username" id="u_loginname" name="Logname" placeholder="用户名/手机号/邮箱">
				<p class=" err err-username"></p>
			</div>
			<div class="bxs-row">
				<input type="password" id="u_password" class="password" placeholder="密码">
				<p class="err err-password"></p>
			</div>
			<div class="bxs-row">
				 <input id="checks"  type="text" style="width: 112px;height: 44px; border: 1px solid #9da3a6;border-radius: 5px"/>
			                 <img id="imgVerify" src="" alt="点击更换验证码" />
			                 <a href="javascript:void(0)" rel="nofollow" onclick="getVerify()">看不清,换一张</a>			                          
			</div>
			<div class="bxs-row">
				<input type="checkbox" id="ch" value="" style="width: 20px;height: 20px;"><a style="font-size: 17px;padding-bottom: 10px">记住密码</a><a href="javascript:void(0)" style="font-size: 17px;padding-bottom: 10px;padding-left: 150px" onclick="ClearPassword()">忘机密码</a>
				<p class="err err-password"></p>
				
			</div>

			<div class="bxs-row">
				<input type="submit" class="submit btn" onclick="btnLogin()" value="登录">
			</div>
		</div>
		<div class="verBox">
			<div id="imgVer" style="display:inline-block;"></div>
		</div>
	</div>
</body>
</html>