<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User" />
<%@page import="com.util.Paginator;"%>
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
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script src="<%=basePath%>js/page.js" language="JavaScript"
	type="text/javascript" charset="utf-8"></script>
<script>
	var  highlightcolor='#c1ebff';
	//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
	var  clickcolor='#51b2f6';
	function  changeto(){
		source=event.srcElement;
		if  (source.tagName=="TR"||source.tagName=="TABLE")
			return;
		while(source.tagName!="TD")
			source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
		//alert(cs.length);
		if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
			for(var i=0;i<cs.length;i++){
				cs[i].style.backgroundColor=highlightcolor;
				}
		}

	function  changeback(){
		if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
			return
			if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
				//source.style.backgroundColor=originalcolor
				for(var i=0;i<cs.length;i++){
	
					cs[i].style.backgroundColor="";
					}
		}

	function  clickto(){
		source=event.srcElement;
		if  (source.tagName=="TR"||source.tagName=="TABLE")
			return;
		while(source.tagName!="TD")
			source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
		//alert(cs.length);
		if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
			for(var i=0;i<cs.length;i++){
	
				cs[i].style.backgroundColor=clickcolor;
				}
		else
			for(var i=0;i<cs.length;i++){
				cs[i].style.backgroundColor="";
				}
	}

</script>

</head>

<body>
	<form action="requestlog.action" id="loglistform"
		name="loglistform" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="program/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src="program/images/tab_03.gif" width="12" height="30" />
							</td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><table width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="program/images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[系统配置]-[日志]</td>
												</tr>
											</table>
										</td>
										<td width="54%"><table border="0" align="right"
												cellpadding="0" cellspacing="0">
												<tr>
													<td width="100"><table width="90%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img src="program/images/22.gif" width="14"
																			height="14" onclick="addimportant()"/>
																	</div>
																</td>
																<td class="STYLE1"><div align="center"><a href="javascript:addimportant()">添加重点项目</a></div>
																</td>
															</tr>
														</table>
													</td>
													
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td width="16"><img src="program/images/tab_07.gif"
								width="16" height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="8" background="program/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td width="5%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">日志ID</span>
											</div>
										</td>
										<td width="5%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">用户</span>
											</div>
										</td>
										<td width="75%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">操作</span>
											</div>
										</td>
										<td width="15%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">时间</span>
											</div>
										</td>
										
									</tr>
									<c:forEach var="log" items="${paginator.items}">
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center"
													class="STYLE1">
													<div align="center">${log.logid}</div>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${log.username }</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${log.operate }</span>
												</div></td>
										
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${log.time}</span>
												</div></td>
								

										</tr>
									</c:forEach>
									
								</table>
							</td>
							
							<td width="8" background="program/images/tab_15.gif">&nbsp;
							<input type="hidden" id="proid" name="proid"/>
							</td>
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
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td class="STYLE4">&nbsp;&nbsp;共有
											${paginator.totalRowsAmount} 条记录，当前第 ${paginator.currentPage
											}/${paginator.totalPages } 页</td>
										<td>

											<table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="40"><img src="program/images/first.gif"
														width="37" height="15" onclick="javascript:goPage(1)" />
													</td>
													<td width="45">
													
													<img src="program/images/back.gif"
														width="43" height="15"
														<c:if test="${paginator.currentPage!=1 }">
														onclick="javascript:goPage('${paginator.currentPage-1 }')" 
														</c:if>
														/>
													
													</td>
													<td width="45"><input name='paginator.currentPage'
														id='paginator.currentPage' type='hidden'
														value='${paginator.currentPage }' />
														<input name='paginator.totalPages'
														id='paginator.totalPages' type='hidden'
														value='${paginator.totalPages }' />
														
														<img
														src="program/images/next.gif" width="43" height="15"
														<c:if test="${paginator.currentPage<paginator.totalPages}">
														onclick="javascript:goPage('${paginator.currentPage+1 }')" 
														</c:if>
														/>
														
													</td>
													<td width="40"><img src="program/images/last.gif"
														width="37" height="15"
														onclick="javascript:goPage('${paginator.totalPages}')" />
													</td>
													<td width="100"><div align="center">
															<span class="STYLE1">转到第 <input name="gopagenum"
																id="gopagenum" type="text" size="4"
																style="height:16px; width:20px; border:1px solid #999999;" />
																页 </span>
														</div>
													</td>
													<td width="40"><img src="program/images/go.gif"
														width="37" height="15"
														onclick="javascript:goPage(document.getElementById('gopagenum').value)" />
													</td>
												</tr>
											</table></td>
									</tr>
								</table>
							</td>
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
</html>
