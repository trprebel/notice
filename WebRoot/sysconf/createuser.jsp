<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User" />
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)session.getAttribute("user");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'admin.jsp' starting page</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px;
	margin-right: 10px;
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.button_chuang {
	border: 1px solid #e9eff2;
	width: 180px;
	height: 20px;
}

-->
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
  function submitfun()
  {
  	var username=document.getElementById("username").value;
  	var password=document.getElementById("password").value;
  	var repassword=document.getElementById("repassword").value;
  	
	if(username==""||username==null)
	{
		alert("用户名不能为空！");
		return;
	}
	else if(password==""||password==null)
	{
		alert("密码不能为空！");
		return;
	}
	if(repassword!=password)
	{
		alert("两次输入的密码不相同！");
		return;
	}
	
	var f1=document.getElementById("cuserform");
	f1.submit();
  }
  </script>
<body>
<form action="createuserSYSTEM" name="cuserform" id="cuserform"
		method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="program/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="program/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="program/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统配置]-[添加用户]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1">&nbsp;</td>
                    <td class="STYLE1">&nbsp;</td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="program/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="program/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="b5d6e6" >
          <tr>
            <td width="40%" height="28" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">用户名： </span></div></td>
            <td bgcolor="#FFFFFF"><input class="button_chuang" type="text" name="username" id="username" /></td>
          </tr>
          <tr>
            <td height="28" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">密码：</span></div></td>
            <td bgcolor="#FFFFFF"><input class="button_chuang" type="text" name="password" id="password" /></td>
            </tr>
          <tr>
            <td height="28" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">重复密码： </span></div></td>
            <td bgcolor="#FFFFFF"><input class="button_chuang" type="text" name="repassword" id="repassword" /></td>
            </tr>
          <tr>
            <td height="28" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">角色：</span></div></td>
            <td bgcolor="#FFFFFF">
            <select name="roleid" id="roleid">
            	<c:forEach var="role" items="${roles }">
            	<option value="${role.roleid }"
            	<c:if test="${role.role=='user' }">
            	selected="selected"
            	</c:if>
            	>${role.role }</option>
            	</c:forEach>
            </select>
			</td>
            </tr>
          
          <tr>
            <td height="28" colspan="2" bgcolor="#FFFFFF" align="center"><input type="button" onClick="javascript:submitfun()" value="创建">&nbsp;<input type="reset" value="重置"></td>
            </tr>
        </table></td>
        <td width="8" background="program/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
 <tr>
    <td height="35" background="program/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="program/images/tab_18.gif" width="12" height="35" /></td>
        <td>&nbsp;</td>
        <td width="16"><img src="program/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>

</body>
<script type="text/javascript">
  if('${messages}'!="")
  {
  	alert('${messages}');
  }
  </script>
</html>
