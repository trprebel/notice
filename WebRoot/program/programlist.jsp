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
	font-size: 12px;
	margin-right: 5px;
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
	margin-left: 5px;
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
	function editpro(id)
	{
		
		document.getElementById("proid").value=id;
		var f1=document.getElementById("programlistform");
		f1.action="requesteditPROGRAM.action";
		f1.submit();
	}
	function addimportant()
	{
		var important=document.getElementsByName("important");
		for(var i=0;i<important.length;i++){
            if(important[i].checked){
                //alert(important[i].value);
                var postdata = {
              			proid :important[i].value
                	};
              	
            		$.ajax({
                 		type:'post',
                 		data:postdata,
                 		url:'addimportantPROGRAM.action',
                 		dataType:'json',
                 		success:function(data){
                 			//var obj = $.parseJSON(data);        
            				alert(data);
                 		},
                		error:function(){
                   			alert("添加失败！");
                		}

                	});
                break;
            }
        }

	}

</script>

</head>

<body>
	<form action="requestlistPROGRAM.action" id="programlistform"
		name="programlistform" method="post">
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
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[项目管理]-[项目列表]</td>
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
																		<c:if test="${user.addimpro==1 }">
																			<img src="program/images/22.gif" width="14"
																				height="14" onclick="addimportant()" />
																		</c:if>
																	</div>
																</td>
																<td class="STYLE1"><div align="center">
																		<c:if test="${user.addimpro==1 }">
																			<a href="javascript:addimportant()">添加重点项目</a>
																		</c:if>
																	</div>
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
									cellspacing="1" bgcolor="b5d6e6" style="margin-bottom: 12px;">
									<tr>
										<td height="22" colspan="5" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="left">
												<span class="STYLE1"><b>&nbsp;&nbsp;搜索</b> </span>
											</div></td>
									</tr>
									<tr>
										<td height="28" width="16%" bgcolor="#FFFFFF"><div
												align="right" class="STYLE1">
												<div align="right">项目名称</div>
											</div></td>
										<td width="22%" height="20" bgcolor="#FFFFFF"><input
											class="button_chuang" type="text" name="sproname"
											id="sproname" value="${pageprogram.sproname }" /></td>
										<td width="16%" height="20" bgcolor="#FFFFFF"><div
												align="right">
												<span class="STYLE1">责任人</span>
											</div></td>
										<td width="22%" bgcolor="#FFFFFF"><input
											class="button_chuang" type="text" name="schargeperson"
											id="schargeperson" value="${pageprogram.schargeperson }" />
										</td>
										<td height="20" bgcolor="#FFFFFF"><div align="center">
												<input type="submit" value="搜索" />
											</div></td>
									</tr>
								</table></td>
							<td width="8" background="program/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8" background="program/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td width="3%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">重点项</span></div>
										</td>
										<td width="3%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">项目ID</span>
											</div>
										</td>
										<td width="10%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">项目名称</span>
											</div>
										</td>
										<td width="10%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">项目类型</span>
											</div>
										</td>
										<td width="5%" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">当前状态</span>
											</div>
										</td>
										<td width="5%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">责任人</span>
											</div>
										</td>
										<td width="15%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">本周进展</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">计划完成时间</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">评审会议时间</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">系统测试时间</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">样评时间</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">主观评价时间</span>
											</div>
										</td>
										<td width="8%" height="22" background="program/images/bg.gif"
											bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div>
										</td>
									</tr>
									<c:forEach var="program" items="${paginator.items}">
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<input type="radio" name="important" id="important"
														value="${program.proid }"
														<c:if test="${program.proid==impro }">
														checked
													</c:if> />
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"
													class="STYLE1">
													<div align="center">${program.proid}</div>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.proname }</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.tvtype }</span>
												</div></td>
											<td bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1"> <c:if
															test="${program.state==1}">
													正常
													</c:if> <c:if test="${program.state==2}">
													风险
													</c:if> <c:if test="${program.state==3}">
													超期
													</c:if> </span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.chargeperson}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.weekprogress}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.plandate}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.evaluatedate}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.systestdate}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.modelevaluatedate}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${program.subassdate}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE4"> <c:if test="${user.edit==1 }">

															<a href="javascript:editpro('${program.proid}')"> <img
																src="program/images/edt.gif" width="16" height="16" />编辑

															</a>
														</c:if>
														<c:if test="${user.edit==0&&program.chargeperson==user.username}">
														<a href="javascript:editpro('${program.proid}')"> <img
																src="program/images/edt.gif" width="16" height="16" />编辑

															</a>
														</c:if>
														
														
														</span>

												</div></td>

										</tr>
									</c:forEach>

								</table>
							</td>

							<td width="8" background="program/images/tab_15.gif">&nbsp;
								<input type="hidden" id="proid" name="proid" />
							</td>
						</tr>
					</table></td>
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
													<td width="45"><img src="program/images/back.gif"
														width="43" height="15"
														<c:if test="${paginator.currentPage!=1 }">
														onclick="javascript:goPage('${paginator.currentPage-1 }')" 
														</c:if> />

													</td>
													<td width="45"><input name='paginator.currentPage'
														id='paginator.currentPage' type='hidden'
														value='${paginator.currentPage }' /> <input
														name='paginator.totalPages' id='paginator.totalPages' type='hidden'
														value='${paginator.totalPages }' /> <img
														src="program/images/next.gif" width="43" height="15"
														<c:if test="${paginator.currentPage<paginator.totalPages}">
														onclick="javascript:goPage('${paginator.currentPage+1 }')" 
														</c:if> />

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
<SCRIPT type="text/javascript">
  
 if('${messages}'!="")
 {
   alert('${messages}');
   
 }
</SCRIPT>
</html>
