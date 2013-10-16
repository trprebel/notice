<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User"/>
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
  	var proname=document.getElementById("proname").value;
  	var tvtype=document.getElementById("tvtype").value;
  	var chargeperson=document.getElementById("chargeperson").value;
  	var plandate=document.getElementById("plandate").value;
  	var evaluatedate=document.getElementById("evaluatedate").value;
  	var systestdate=document.getElementById("systestdate").value;
  	var modelevaluatedate=document.getElementById("modelevaluatedate").value;
  	var subassdate=document.getElementById("subassdate").value;
	if(proname==""||proname==null)
	{
		alert("项目名称不能为空！");
		return;
	}
	else if(tvtype==""||tvtype==null)
	{
		alert("电视类型不能为空！");
		return;
	}
	else if(chargeperson==""||chargeperson==null)
	{
		alert("责任人不能为空！");
		return;
	}
	else if(plandate==""||plandate==null)
	{
		alert("计划完成时间不能为空！");
		return;
	}
	if(evaluatedate==""||evaluatedate==null)
	{
		alert("评审会议时间不能为空！");
		return;
	}
	else if(systestdate==""||systestdate==null)
	{
		alert("系统测试时间不能为空！");
		return;
	}
	else if(modelevaluatedate==""||modelevaluatedate==null)
	{
		alert("样评时间不能为空！");
		return;
	}
	else if(subassdate==""||subassdate==null)
	{
		alert("主观评价时间不能为空！");
		return;
	}
	var f1=document.getElementById("cproform");
	f1.submit();
  }
  </script>
  <body>
  <form action="editPROGRAM.action" name="cproform" id="cproform" method="post">
	<table align="center" id="createpro">
		<caption>修改项目属性</caption>
		<tr>
			<td>项目名称：</td>
			<td>
				<input type="hidden" name="proid" id="proid" value="${program.proid }">
				<input type="text" name="proname" id="proname" value="${program.proname }">
				
			</td>
		</tr>
		<tr>
			<td>电视类型：</td>
			<td>
				<input type="text" name="tvtype" id="tvtype" value="${program.proname }">
			</td>
		</tr>
		<tr>
			<td>完成状态：</td>
			<td>
				<select name="state" id="state">
					<option value="0" selected>未完成</option>
					<option value="1" >已完成</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>责任人：</td>
			<td>
				<input type="text" name="chargeperson" id="chargeperson" value="${program.chargeperson }">
			</td>
		</tr>
		<tr>
			<td>本周进度:</td>
			<td>
				<textarea rows="3" cols="25" name="weekprogress" id="weekprogress">${program.weekprogress }</textarea>
				<input type="hidden" name="oriweekprogress" id="oriweekprogress" value="${program.weekprogress }">
			</td>
		</tr>
		<tr>
			<td>计划完成时间：</td>
			<td>
				<input class="Wdate" name="plandate" id="plandate" type="text"
							onClick="WdatePicker()" value="${program.plandate }"
							 />
			</td>
		</tr>
		<tr>
			<td>评审会议时间：</td>
			<td>
				<input class="Wdate" name="evaluatedate" id="evaluatedate" type="text"
							onClick="WdatePicker()" value="${program.evaluatedate }"
							 />
			</td>
		</tr>
		<tr>
			<td>系统测试时间：</td>
			<td>
				<input class="Wdate" name="systestdate" id="systestdate" type="text"
							onClick="WdatePicker()" value="${program.systestdate}"
							 />
			</td>
		</tr>
		<tr>
			<td>样评时间：</td>
			<td>
				<input class="Wdate" name="modelevaluatedate" id="modelevaluatedate" type="text"
							onClick="WdatePicker()" value="${program.modelevaluatedate }"
							 />
			</td>
		</tr>
		<tr>
			<td>主观评价时间：</td>
			<td>
				<input class="Wdate" name="subassdate" id="subassdate" type="text"
							onClick="WdatePicker()" value="${program.subassdate }"
							 />
			</td>
		</tr>
		<tr>
			<td><input type="button" onClick="javascript:submitfun()" value="创建"></td>
			<td><input type="reset" value="重置"></td>
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
