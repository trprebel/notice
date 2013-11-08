<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
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
	width: 400px;
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
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
	function submitfun() {
		var noticetitle = document.getElementById("noticetitle").value;
		
		if (noticetitle == "" || noticetitle == null) {
			alert("公告标题不能为空！");
			return;
		}
		var f1 = document.getElementById("cnoticeform");
		f1.submit();
	}
</script>
<body>
	<form action="createNOTICE" name="cnoticeform" id="cnoticeform"
		method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="program/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src="program/images/tab_03.gif" width="12" height="30" /></td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><table width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="program/images/tb.gif" width="16" height="16" />
														</div></td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[公告管理]-[公告发布]</td>
												</tr>
											</table></td>

									</tr>
								</table></td>
							<td width="16"><img src="program/images/tab_07.gif"
								width="16" height="30" /></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="8" background="images/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="0" bgcolor="b5d6e6">
									<tr>
										<td width="40%" height="28" bgcolor="#FFFFFF"><div
												align="right">
												<span class="STYLE1">公告标题： </span>
											</div>
										</td>
										<td bgcolor="#FFFFFF"><input class="button_chuang" maxlength="70"
											type="text" name="noticetitle" id="noticetitle"/>（35个字以内）
										</td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">公告内容：</span>
											</div>
										</td>
										<td bgcolor="#FFFFFF"><textarea
												style="border: 1px solid #e9eff2;" rows="15" cols="40"
												name="noticecontent" id="noticecontent" readonly>预留！</textarea>
										</td>
									</tr>

									<tr>
										<td height="28" colspan="2" bgcolor="#FFFFFF" align="center"><input
											type="button" onClick="javascript:submitfun()" value="发布">&nbsp;<input
											type="reset" value="重置">
										</td>
									</tr>
								</table>
							</td>
							<td width="8" background="images/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" background="images/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src="images/images/tab_18.gif" width="12" height="35" />
							</td>
							<td>&nbsp;</td>
							<td width="16"><img src="images/images/tab_20.gif"
								width="16" height="35" />
							</td>
						</tr>
					</table>
				</td>
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
