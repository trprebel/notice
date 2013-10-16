<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%@taglib prefix="page" uri="/WEB-INF/oss-page.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link href="<%=basePath%>/css/page/page.css" rel="stylesheet" type="text/css">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'log.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<script src="<%=basePath%>js/page.js" language="JavaScript" type="text/javascript" charset="utf-8"></script>
	<body>
		<table border="1">
			<caption>
				操作日志
			</caption>
			<tr>
				<td>
					ID
				</td>
				<td>
					用户
				</td>
				<td>
					操作
				</td>
				<td>
					时间
				</td>
			</tr>
			<c:forEach var="log" items="${paginator.items}">
				<tr>
					<td>
						${log.id }
					</td>
					<td>
						${log.username }
					</td>
					<td>
						${log.operate }
					</td>
					<td>
						${log.time }
					</td>
				</tr>
			</c:forEach>
		</table>
		<form action="requestlog.action" method="post" id="fromID">
		<table width="100%" border="0">
			<tr>
				<div class="warp-page">
					<page:page></page:page>
				</div>
				<td align="right">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
