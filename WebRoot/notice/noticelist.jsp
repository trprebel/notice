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

	function addshow()
	{
		var isshow=document.getElementsByName("isshow");
		for(var i=0;i<isshow.length;i++){
            if(isshow[i].checked){
                //alert(important[i].value);
                var postdata = {
              			noticeid :isshow[i].value
                	};
              	
            		$.ajax({
                 		type:'post',
                 		data:postdata,
                 		url:'addshowNOTICE.action',
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
	<form action="requestlistNOTICE.action" id="noticelistform"
		name="noticelistform" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="images/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src="images/images/tab_03.gif" width="12" height="30" />
							</td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><table width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="images/images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[公告管理]-[公告列表]</td>
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
																			<img src="images/images/22.gif" width="14"
																				height="14" onclick="addshow()" />
																		</c:if>
																	</div>
																</td>
																<td class="STYLE1"><div align="center">
																		<c:if test="${user.addimpro==1 }">
																			<a href="javascript:addshow()">设置显示公告</a>
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
							<td width="16"><img src="images/images/tab_07.gif"
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
							<td width="8" background="images/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="b5d6e6" style="margin-bottom: 12px;">
									
									
								</table></td>
							<td width="8" background="images/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="8" background="images/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td width="6%" height="22" background="images/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
											<span class="STYLE1">显示项</span></div>
										</td>
										<td width="10%" height="22" background="images/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">公告标题</span>
											</div>
										</td>
										<td width="*" height="22" background="images/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">公告内容</span>
											</div>
										</td>
										<td width="15%" height="22" background="images/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">创建时间</span>
											</div>
										</td>
										
									</tr>
									<c:forEach var="notice" items="${notices}">
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<input type="radio" name="isshow" id="isshow"
														value="${notice.noticeid }"
														<c:if test="${notice.isshow==1 }">
														checked
													</c:if> />
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"
													class="STYLE1">
													<div align="center">${notice.title}</div>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${notice.content }</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${notice.createdate }</span>
												</div></td>
								

										</tr>
									</c:forEach>

								</table>
							</td>

							<td width="8" background="images/images/tab_15.gif">&nbsp;
							</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35" background="images/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src="images/images/tab_18.gif" width="12" height="35" />
							</td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										
									</tr>
								</table>
							</td>
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
<SCRIPT type="text/javascript">
  
 if('${messages}'!="")
 {
   alert('${messages}');
   
 }
</SCRIPT>
</html>
