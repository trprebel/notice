<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,java.text.*" language="java" errorPage=""%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<script src="<%=basePath%>js/jquery-1.6.js" type="text/javascript"></script>
<title>基于安卓电视的公告展示系统后台管理系统</title>
<style type="text/css">
<!--
.img_bk {
	width: 640px;
	height: 362px;
	background-image: url(images/bk_login.jpg);
}

.ed_s1 {
	width: 122px;
	background-color: #333;
	border: 1px solid #CCC;
	color: #FFF;
}

a {
	color: #FFFFFF;
}

.title {
	font-size: 12px;
}

body {
	background-color: #006AA8;
}
</style>
<script type="text/javascript">

  function changepic(){
        document.getElementById("pic").innerHTML="<img src='authcode.jsp?ra"+Math.random()+"'  align='middle' onclick='changepic()'  style='cursor: hand' width='45' height='18'/>";
  }
  function login()
  {
       if($("#username").val()==""){
         alert("用户名不能为空！");
         return;
       }	
       if($("#password").val()==""){
         alert("密码不能为空！");
         return ;
       }
       if($("#loginCode").val()==""){
         alert("验证码不能为空！");
         return;
        }
		var f1=document.getElementById("loginform");
		f1.submit();
  }   
</script>
</head>
<body>
	<form action="login.action" name=loginform method="post">
		<table align="center">
			<tr>
				<td height=25></td>
			</tr>
			<tr align="center">
				<td class="img_bk">
					<table align="center">
						<tr>
							<td colspan="5" height="20px"></td>
						</tr>
						<tr>
							<td class="title">管理员账号:</td>
							<td colspan="3"><input type="text" name="username"
								id="username" class="ed_s1" value="${user.username }"
								maxlength="16">
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="title" align="right">密码:</td>
							<td colspan="3"><input type="password" name="password"
								id="password" class="ed_s1" value="" maxlength="16">
							</td>
							<td></td>
						</tr>
						<tr>
							<td class="title" align="right">验证码:</td>
							<td><input type="text" name="loginCode" id="loginCode"
								class="ed_s1" style="width:50px" />
							</td>
							<td><span id="pic"><img src="authcode.jsp" width="45"
									height="18" onClick="changepic();">
							</span>
							</td>
							<td><a class="title" href="javascript:changepic()"
								>换一个</a></td>
							<td><input type="image" id="image" src="images/bn_login.jpg"
								width="49" height="18" onclick="login()">
							</td>
							<td></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
<SCRIPT type="text/javascript">
  
 if('${messages}'!="")
 {
   alert('${messages}');
   
 }
</SCRIPT>
</html>

