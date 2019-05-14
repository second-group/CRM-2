<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
/* var flag=$("#login").form("validate"); */  //使用validate验证表单的所有验证是否全部通过，通过为true，否则为false
var u_loginname=$("#u_loginname").val();  //获取表单中的用户名。注意：验证框可以使用jQuery的val方法获取，如果是textbox，则需要通过$("#ename").textbox("getValue"); 来获取
var u_password=$("#u_password").val();   //获取用户密码
/* alert(u_loginname); */
/* if(flag){//当flag为true时，发送请求 */
    $.post(
        "ModulesAll",  //注意地址
        {    
        	u_loginname:u_loginname,
        	u_password:u_password
           
        },   //参数需要和数据接口中指定的一致，有简单的做法么？当然有，自己去学习jQuery中$("#formId").serialize()方法，快速得到表单参数值。
        function(res){
            if(res!=null && res !=""){   //返回值被转为json对象，其中包含 success、message、remark 三个属性。请看接口文档中的返回值说明。
             /*   $.messager.show({  //不喜欢用show方法的，可以选择$.messager.alert方法，自己查easyUI的帮助文档进行修改。
                title:'提示信息',
                msg:'登录成功',
                showType:'show'
                }); */
                          /* sessionStorage.setItem("userId",JSON.parse(res.message).u_loginname);
                sessionStorage.setItem("roleNames",JSON.parse(res.message).u_password); */
                alert("登录成功");
                sessionStorage.setItem("u_loginname",u_loginname);
                sessionStorage.setItem("u_password",u_password);
                window.location.href="index.jsp";
              
                
            }else{
               alert("账号或者密码错误");
            }
    },"json");
/* }  */
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
            height:360px;
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
	<div class="logo-box">
		<div class="login" style="">
			<div class="bxs-row" style="text-align:center;">
				<img id="logo" src="images/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">忍住不哭来段口技</span>
			</div>
			<div class="bxs-row">
				<input type="text" class="username" id="u_loginname" placeholder="用户名">
				<p class=" err err-username"></p>
			</div>
			<div class="bxs-row">
				<input type="password" id="u_password" class="password" placeholder="密码">
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