<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User" />
<%@taglib prefix="c" uri="/jstl/c.tld"%>
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

<script type="text/javascript" src="js/jquery-1.6.js"></script>

<body>
	<form action="confshowSYSTEM.action" name="confshowform"
		id="confshowform" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			
			<tr>
				<td height="30" background="images/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src="images/images/tab_03.gif" width="12" height="30" /></td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><div style="margin-top:7px;"><table  width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="images/images/tb.gif" width="16" height="16" />
														</div></td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统配置]-[设置展示项]</td>
												</tr>
											</table></div></td>
										<td width="54%"><table border="0" align="right"
												cellpadding="0" cellspacing="0">
												<tr>
													<td width="60"><table width="87%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center"></div></td>
																<td class="STYLE1"><div align="center"></div></td>
															</tr>
														</table></td>
													<td width="60"><table width="90%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1">&nbsp;</td>
																<td class="STYLE1">&nbsp;</td>
															</tr>
														</table></td>
													<td width="60"><table width="90%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center"></div></td>
																<td class="STYLE1"><div align="center"></div></td>
															</tr>
														</table></td>
													<td width="52"><table width="88%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center"></div></td>
															</tr>
														</table></td>
												</tr>
											</table></td>
									</tr>
								</table></td>
							<td width="16"><img src="images/images/tab_07.gif"
								width="16" height="30" /></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="8" background="program/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="0" bgcolor="b5d6e6">
									<tr>
										<td width="40%" height="28" bgcolor="#FFFFFF"><div
												align="right">
												<span class="STYLE1">显示内容： </span>
											</div>
										</td>
										<td bgcolor="#FFFFFF"><input type="radio" name="showtype"
											id="showtype1" value="1"
											<c:if test="${type==1 }">
            checked
            </c:if>>公告
											<input type="radio" name="showtype" id="showtype2" value="2"
											<c:if test="${type==2 }">
            checked
            </c:if>>项目
											<input type="radio" name="showtype" id="showtype3" value="3"
											<c:if test="${type==3 }">
            checked
            </c:if>>活动
										</td>
									</tr>

									<tr>
										<td height="28" colspan="2" bgcolor="#FFFFFF" align="center"><input
											type="button" onClick="submit()" value="设置">
										</td>
									</tr>
								</table>
							</td>
							<td width="8" background="program/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" background="program/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src="program/images/tab_18.gif" width="12" height="35" />
							</td>
							<td>&nbsp;</td>
							<td width="16"><img src="program/images/tab_20.gif"
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
