<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="js/style.css">

<script src="js/jquery-1.10.2.js"></script>
<script src="js/img_ver.js"></script>
<script type="text/javascript">
function btnLogin(){
/*      var username = "";
    var password = "";
    //获取当前站点的所有Cookie
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++) {//对cookies中的数据进行遍历，找到用户名、密码的数据
        if ("u_loginname".equals(cookies[i].getName())) {
               username = cookies[i].getValue();
        } else if ("password".equals(cookies[i].getName())) {
            password = cookies[i].getValue();
        }
    }  */
/* var flag=$("#login").form("validate"); */  //使用validate验证表单的所有验证是否全部通过，通过为true，否则为false
/* if(u_loginname!=null && u_loginname==kie){
		
		
	} */
	var useru_loginname='${sessionScope.users.u_loginname}';
	var useru_password='${sessionScope.users.u_password}';
	var useru_islockout='${sessionScope.users.u_islockout}';

	var kie=$("#kie").val();
	var pwd=$("#pwd").val();
	var u_loginname=$("#u_loginname").val();  //获取表单中的用户名。注意：验证框可以使用jQuery的val方法获取，如果是textbox，则需要通过$("#ename").textbox("getValue"); 来获取
	var u_password=$("#u_password").val();//获取用户密码 
	var inputStr = $("#checks").val();
	var ch=$("#ch").val();
	 
	/* var japtcha=$("#japtcha").val();
	alert(japtcha); */
if(u_loginname==null || u_loginname ==""){	 
	  /* alert(inputStr); */
	  	alert("用户名不可为空");
}else if(u_password==null || u_password ==""){
		alert("密码不可为空");
}else if(inputStr==null || inputStr==""){
		alert("请输入验证码");
}else{			
	inputStr = inputStr.toUpperCase();//将验证码转为大写	
	    $.post(
	        "login",  //注意地址
	        {    
	        	u_loginname:u_loginname,
	        	u_password:u_password,
	        	ch:ch,
	        	inputStr:inputStr
	        	/* japtcha:japtcha */
	        },  
	        function(res){
	        	/* var uu='${sessionScope.uu}';
	        	alert(uu); */
	        	/* alert(res); */
	    		/* for (var i = 0; i < uu.length; i++) {
	    			alert(u_loginname);
	    			if(uu.get(i).getU_lastlogintime()!=u_loginname){
	    				
	    				alert(uu.get(i).getU_lastlogintime());
	    				
	    				alert("用户名不存在");
	    				window.location.href="inlogin";
	    			}else if(uu.get(i).getU_password()!=u_password){
	    				alert("密码错误");
	    				window.location.href="inlogin";
	    			}else if(uu.get(i).getU_islockout()=1) {
	    				alert("该用户已锁定");
	    				window.location.href="inlogin";
	    			}else{ */
	        /* 	if(u_loginname!=useru_loginname){
	        		window.location.href="inlogin";
	        		alert("用户名错误或者不存在");
	        	}else if(u_password!=useru_password){
	        		window.location.href="inlogin";
	        		alert("密码错误");
	        	}else if(useru_islockout!=0){
	        		window.location.href="inlogin";
	        		alert("用户已被锁定");
	        	}else{ */
	        	 /* 	var imgCheck='${sessionScope.imgCheck}';
	        		alert(imgCheck); */
	        		if(res!="inindex"){
	        			alert("验证码错误");
	        			window.location.href="inlogin";
	        		}else{ 
	        			sessionStorage.setItem("u_loginname",u_loginname);
		                sessionStorage.setItem("u_password",u_password);
		                /*window.location.href="index.jsp"; */               
		            	window.location.href=res;  
	        			
	        		 } 
	        		
	        	
	        		  
	        	/* } */
	    		/* 	}
	    			
	    		} */
	                         
	    });


	
	
}

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

    function checkSum(){

        var html1=document.getElementById('loginingForm');

        var inputStr = $("#checks").val();

        if(inputStr!=null && inputStr!="" && inputStr!="验证码:"){

            inputStr = inputStr.toUpperCase();//将输入的字母全部转换成大写

            html1.action="/user/login?inputStr="+inputStr;//提交表单

        }else{

            alert("验证码不能为空!");

        }

    }

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

<body>

<%-- <%
         String username = "";
         String password = "";
         //获取当前站点的所有Cookie
         Cookie[] cookies = request.getCookies();
         for (int i = 0; i < cookies.length; i++) {//对cookies中的数据进行遍历，找到用户名、密码的数据
             if ("邝成坤".equals(cookies[i].getName())) {
                    username = cookies[i].getValue();
             } else if ("123456".equals(cookies[i].getName())) {
                 password = cookies[i].getValue();
             }
         }
%> --%>
	<div class="logo-box">
		<div class="login">
			<!-- <div class="bxs-row" style="text-align:center;">
				<img id="logo" src="images/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">忍住不哭来段口技</span>
			</div> -->
			
			<div class="bxs-row">
				<input type="text" class="username" id="u_loginname" placeholder="用户名">
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
			   <!-- <div class="formControls col-xs-8 col-xs-offset-3">              
			   <input id="checks" class="input-text size-L" type="text" value="" style="width:150px;" />
			                 <img id="imgVerify" src="" alt="点击更换验证码" />
			                 <a href="" rel="nofollow">看不清，换一张</a>          
			   </div> -->

		<!-- 	<div class="bxs-row">
				 <img src="jcaptcha.jpg"/> <input type="text" id="japtcha" name="japtcha" value="" />
				<p class="err err-password"></p>
			</div> -->
			<div class="bxs-row">
				<input type="checkbox" id="ch" value="true" style="width: 20px;height: 20px;"><a style="font-size: 17px;padding-bottom: 10px">7天免登陆</a>
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
	     <%--  <c:forEach items="${uu}" var="u" varStatus="s">
	      	<c:if test="${u.u_loginname}">
	      	
	      	</c:if>
        	<input type="text" id="name${s.index}" value="${u.u_loginname}">
        	<input type="text" id="pass${s.index}" value="${u.u_password}"><br>
        </c:forEach>  --%>
 	<%-- <input type="text" class="kie" id="kie" placeholder="${username}" value="${msg}"> --%>
	 <%--<input type="text" class="pwd" id="pwd" placeholder="${password}">  --%>
</body>
</html>