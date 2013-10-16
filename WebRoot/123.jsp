<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script language="javascript" type="text/javascript" src="tab/My97DatePicker/WdatePicker.js"></script>


<input class="Wdate" type="text" onClick="WdatePicker()"> <font color=red>&lt;- 点我弹出日期控件</font>


<br><br><br><br>


