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
<script language="javascript" type="text/javascript"
	src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
	function submitfun() {
		var proname = document.getElementById("proname").value;
		var tvtype = document.getElementById("tvtype").value;
		var chargeperson = document.getElementById("chargeperson").value;
		var plandate = document.getElementById("plandate").value;
		var evaluatedate = document.getElementById("evaluatedate").value;
		var systestdate = document.getElementById("systestdate").value;
		var modelevaluatedate = document.getElementById("modelevaluatedate").value;
		var subassdate = document.getElementById("subassdate").value;
		if (proname == "" || proname == null) {
			alert("项目名称不能为空！");
			return;
		} else if (tvtype == "" || tvtype == null) {
			alert("项目类型不能为空！");
			return;
		} else if (chargeperson == "" || chargeperson == null) {
			alert("责任人不能为空！");
			return;
		} else if (plandate == "" || plandate == null) {
			alert("计划完成时间不能为空！");
			return;
		}
		if (evaluatedate == "" || evaluatedate == null) {
			alert("评审会议时间不能为空！");
			return;
		} else if (systestdate == "" || systestdate == null) {
			alert("系统测试时间不能为空！");
			return;
		} else if (modelevaluatedate == "" || modelevaluatedate == null) {
			alert("样评时间不能为空！");
			return;
		} else if (subassdate == "" || subassdate == null) {
			alert("主观评价时间不能为空！");
			return;
		}
		var f1 = document.getElementById("cproform");
		f1.submit();
	}
</script>
<body>
	<form action="editPROGRAM.action" name="cproform" id="cproform"
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
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[项目管理]-[编辑项目]</td>
												</tr>
											</table></td>
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
							<td width="16"><img src="program/images/tab_07.gif"
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
												<span class="STYLE1">项目名称： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><input type="hidden" name="proid"
											id="proid" value="${program.proid }"> <input
											class="button_chuang" type="text" name="proname" id="proname"
											value="${program.proname }" /></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">项目类型：</span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="button_chuang"
											type="text" name="tvtype" id="tvtype"
											value="${program.proname }" /></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">完成状态： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><select class="button_chuang"
											name="state" id="state">
												<option value="0" selected>未完成</option>
												<option value="1">已完成</option>
										</select></td>
									</tr>
									<c:if test="${program.isrisk!=2 }">
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">活动状态： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><select class="button_chuang"
											name="isrisk" id="isrisk">
												<option value="0"
												<c:if test="${program.isrisk==0 }">selected</c:if>
												>正常</option>
												<option value="1"
												<c:if test="${program.isrisk==1 }">selected</c:if>
												>风险</option>
										</select></td>
									</tr>
									</c:if>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">责任人： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="button_chuang"
											type="text" name="chargeperson" id="chargeperson"
											value="${program.chargeperson }" /></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right"
												style="vertical-align: text-top;">
												<span class="STYLE1">本周进度： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><textarea
												style="border: 1px solid #e9eff2;" rows="3" cols="25"
												name="weekprogress" id="weekprogress">${program.weekprogress }</textarea>
											<input type="hidden" name="oriweekprogress"
											id="oriweekprogress" value="${program.weekprogress }">
										</td>
									</tr>


									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">计划完成时间：</span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="Wdate"
											name="plandate" id="plandate" type="text"
											onClick="WdatePicker()" value="${program.plandate }" /></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">评审会议时间：</span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="Wdate"
											name="evaluatedate" id="evaluatedate" type="text"
											onClick="WdatePicker()" value="${program.evaluatedate }" />
										</td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">系统测试时间：</span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="Wdate"
											name="systestdate" id="systestdate" type="text"
											onClick="WdatePicker()" value="${program.systestdate}" /></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">样评时间：</span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="Wdate"
											name="modelevaluatedate" id="modelevaluatedate" type="text"
											onClick="WdatePicker()" value="${program.modelevaluatedate }" />
										</td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">主观评价时间： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="Wdate"
											name="subassdate" id="subassdate" type="text"
											onClick="WdatePicker()" value="${program.subassdate }" /></td>
									</tr>
									<tr>
										<td height="28" colspan="2" bgcolor="#FFFFFF" align="center"><input
											type="button" onClick="javascript:submitfun()" value="完成">&nbsp;<input
											type="reset" value="重置"></td>
									</tr>
								</table></td>
							<td width="8" background="program/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35" background="program/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src="program/images/tab_18.gif" width="12" height="35" /></td>
							<td>&nbsp;</td>
							<td width="16"><img src="program/images/tab_20.gif"
								width="16" height="35" /></td>
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
