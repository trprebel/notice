<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.UsedMR" />
<jsp:directive.page import="com.bean.User" />
<jsp:directive.page import="net.sf.json.JSONArray;" />
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<UsedMR> usedmrs = (List<UsedMR>) request
			.getAttribute("usedmrlist");
	pageContext.setAttribute("usedmrs", usedmrs);
	User user = (User) session.getAttribute("user");
	//JSONArray jsarry=new JSONArray();
	JSONArray jsarry=JSONArray.fromObject(usedmrs);
	//System.out.println(jsarry);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'userdmr.jsp' starting page</title>

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
	<script language="javascript" type="text/javascript"
		src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">

	function modify(i)
  	{
  		//alert(i);
  		//alert(document.getElementById("id"+i).value);
		//return;
  		var postdata = {
  			id :document.getElementById("id"+i).value,
  			mrname:document.getElementById("mrname"+i).value
    	};
  	
		$.ajax({
     		type:'post',
     		data:postdata,
     		url:'cancelreMR.action',
     		dataType:'text',
     		success:function(data){
     			var obj = $.parseJSON(data);        
				alert(obj.value);
				var tb=document.getElementById("table");
				var tr=document.getElementById("seq"+i);
				//parent.removeChild(child);
				tb.deleteRow(tr.rowIndex);
     		},
    		error:function(){
       			alert("取消失败！");
    		}

    	});
  	}
  	function search()
  	{
  		//alert("search");
  		//alert($("#smrname").val());
  		var postdata = {
  			username :$("#susername").val(),
  			mrname:$("#smrname").val(),
  			starttime:$("#sstarttime").val(),
  			endtime:$("#sendtime").val()
    	};
  	
		$.ajax({
     		type:'post',
     		data:postdata,
     		url:'searchusedMR.action',
     		dataType:'json',
     		success:function(data){
     			//alert(data);
     			//var obj = $.parseJSON(data);
     			//alert(obj);
				//alert("success");
				//var json = eval("("+data+")");
     			//var tb=$("#table");
     			var tb=document.getElementById("table");
     			//alert(tb.rows.length);
     			var length=tb.rows.length;
     			for(var i=1;i<length;i++)
           		{
           			tb.deleteRow(-1);
           		}
     			$.each(data,function(i, usedmr) {  //遍历返回数组的每一个实体
           			//alert(usedmr.mrname);       //输出实体的sshortName属性的值
           			
					var tr=tb.insertRow(-1);
					tr.id="seq"+i;
					var td0=tr.insertCell(-1);
					td0.innerHTML="<input type='hidden' name='id' id='id"+i+"' border='0' readonly value='"+usedmr.id+"'>";
					var td1=tr.insertCell(-1);
					td1.innerHTML="<input type='text' name='username' id='username"+i+"' border='0' style='width: 100px' readonly value='"+usedmr.username+"'>";
					var td2=tr.insertCell(-1);
					td2.innerHTML="<input type='text' name='mrname' id='mrname"+i+"' border='0' style='width: 150px' readonly value='"+usedmr.mrname+"'>";
					var td3=tr.insertCell(-1);
					td3.innerHTML="<input type='text' name='floor' id='floor"+i+"' border='0' style='width: 50px' readonly value='"+usedmr.floor+"'>";
					var td4=tr.insertCell(-1);
					td4.innerHTML="<input type='text' name='station' id='station"+i+"' border='0' style='width: 200px' readonly value='"+usedmr.station+"'>";
					var td5=tr.insertCell(-1);
					td5.innerHTML="<input type='text' name='department' id='department"+i+"' border='0' style='width: 130px' readonly value='"+usedmr.department+"'>";
					var td6=tr.insertCell(-1);
					td6.innerHTML="<input type='text' name='starttime' id='starttime"+i+"' border='0' style='width: 160px' readonly value='"+usedmr.starttime+"'>";
					var td7=tr.insertCell(-1);
					td7.innerHTML="<input type='text' name='endtime' id='endtime"+i+"' border='0' style='width: 160px' readonly value='"+usedmr.endtime+"'>";
					//alert(usedmr.username);
					if("${user.username}"==usedmr.username||"${user.type}"==1)
					{
						var td8=tr.insertCell(-1);
						td8.innerHTML="<td><a href='javascript:modify(" + i+ ")'>取消</a></td>"
					}

           		})
     		},
    		error:function(){
       			alert("搜索失败！");
    		}

    	});
  		
  		
  	}
  	function jssearch()
  	{
  		var tb=document.getElementById("table");
     	//alert(tb.rows.length);
     	var length=tb.rows.length;
     	for(var i=1;i<length;i++)
		{
			tb.deleteRow(-1);
		}
		//alert(<%=jsarry.toString()%>);
		//var obj = $.parseJSON(<%=jsarry%>);
		//var mrname="<%=usedmrs.get(0).getMrname()%>";
		//alert(mrname);
		
		var smrname=new RegExp($("#smrname").val());
		var susername=new RegExp($("#susername").val());
		var now=Date();
		var sst,setime;
		if($("#sstarttime").val()=="") sst=now;
		else 
		{
			var vstarttime=$("#sstarttime").val().replace(/-/g,"/");
			//alert(vstarttime);
			sst=new Date(vstarttime);
		}
		var endtime;
		if($("#sendtime").val()=="")
		{
			vendtime ="2053-01-01 00:00:00";
			
		}
		else 
		{
			vendtime =$("#sendtime").val();
		}
		vendtime = vendtime.replace(/-/g,"/");
		//alert(vendtime);
		setime = new Date(vendtime);
  		//var vstarttime =$("#starttime").val();
  		
		//vstarttime = vstarttime.replace(/-/g,"/");
		//var st = new Date(vstarttime);
		var i=0;
		$.each(<%=jsarry%>,function(j, usedmr) {
			var vmrst =usedmr.starttime;
  			vmrst = vmrst.replace(/-/g,"/");
			var mrst = new Date(vmrst);
			var vmret =usedmr.endtime;
  			vmret = vmret.replace(/-/g,"/");
			var mret = new Date(vmret);
			//alert(vmrst);
			//alert(vmret);
			if(smrname.exec(usedmr.mrname)&&susername.exec(usedmr.username)&&(Date.parse(mrst)<Date.parse(setime))&&(Date.parse(mret)>Date.parse(sst)))
			{
				var tr=tb.insertRow(-1);
				tr.id="seq"+i;
				var td0=tr.insertCell(-1);
				td0.innerHTML="<input type='hidden' name='id' id='id"+i+"' border='0' readonly value='"+usedmr.id+"'>";
				var td1=tr.insertCell(-1);
				td1.innerHTML="<input type='text' name='username' id='username"+i+"' border='0' style='width: 100px' readonly value='"+usedmr.username+"'>";
				var td2=tr.insertCell(-1);
				td2.innerHTML="<input type='text' name='mrname' id='mrname"+i+"' border='0' style='width: 150px' readonly value='"+usedmr.mrname+"'>";
				var td3=tr.insertCell(-1);
				td3.innerHTML="<input type='text' name='floor' id='floor"+i+"' border='0' style='width: 50px' readonly value='"+usedmr.floor+"'>";
				var td4=tr.insertCell(-1);
				td4.innerHTML="<input type='text' name='station' id='station"+i+"' border='0' style='width: 200px' readonly value='"+usedmr.station+"'>";
				var td5=tr.insertCell(-1);
				td5.innerHTML="<input type='text' name='department' id='department"+i+"' border='0' style='width: 130px' readonly value='"+usedmr.department+"'>";
				var td6=tr.insertCell(-1);
				td6.innerHTML="<input type='text' name='starttime' id='starttime"+i+"' border='0' style='width: 160px' readonly value='"+usedmr.starttime+"'>";
				var td7=tr.insertCell(-1);
				td7.innerHTML="<input type='text' name='endtime' id='endtime"+i+"' border='0' style='width: 160px' readonly value='"+usedmr.endtime+"'>";
				//alert(usedmr.username);
				if("${user.username}"==usedmr.username||"${user.type}"==1)
				{
					var td8=tr.insertCell(-1);
					td8.innerHTML="<td><a href='javascript:modify(" + i+ ")'>取消</a></td>"
				}
				i++;
			}
		})
	}
  </script>
	<body>
		<!-- 搜索模块 -->
		<div align="center">
			<select id="smrname" onchange="javascript:jssearch()" >
				<option value=".">全部会议室</option>
				<c:forEach var="mr" items="${mrlist}">
					<c:if test="${mr.state==1 }">
						<option value="${mr.mrname }">
							${mr.mrname }
						</option>
					</c:if>
				</c:forEach>
			</select>
			<select id="susername" onchange="javascript:jssearch()" >
				<option value=".">全部用户</option>
				<c:forEach var="user" items="${usernames}">
					<option value="${user }">
						${user }
					</option>
				</c:forEach>
			</select>
			<!-- 搜索的开始和结束时间 -->
			开始时间：
			<input class="Wdate" name="sstarttime" id="sstarttime" type="text" onchange="javascript:jssearch()"
				onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"
				style="width: 230px" />
			结束时间：
			<input class="Wdate" name="sendtime" id="sendtime" type="text" onchange="javascript:jssearch()"
				onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"
				style="width: 230px" />
			<input type="button" name="search" id="search"
				onclick="javascript:search()" value="搜索" />
		</div>
		<table id="table" align="center">
			<caption>
				会议室预定表
			</caption>
			<tr>
				<td>
				</td>
				<td>
					预订人
				</td>
				<td>
					会议室名称
				</td>
				<td>
					楼层
				</td>
				<td>
					位置
				</td>
				<td>
					所属部门
				</td>
				<td>
					开始时间
				</td>
				<td>
					结束时间
				</td>
				<td>
					操作
				</td>
			</tr>
			<%
				int i = 0;
				for (UsedMR usedmr : usedmrs) {
			%>

			<tr id="<%="seq" + i%>">
				<td>
					<input type="hidden" name="id" id="<%="id" + i%>" border="0"
						readonly value="<%=usedmr.getId()%>">
				</td>
				<td>
					<input type="text" name="username" id="<%="username" + i%>"
						border="0" style="width: 100px" readonly
						value="<%=usedmr.getUsername()%>">
				</td>
				<td>
					<input type="text" name="mrname" id=<%="mrname" + i%>
						style="width: 150px" readonly value="<%=usedmr.getMrname()%>">
				</td>
				<td>
					<input type="text" name="floor" id=<%="floor" + i%>
						style="width: 50px" readonly value="<%=usedmr.getFloor()%>">
				</td>
				<td>
					<input type="text" name="station" id=<%="station" + i%>
						style="width: 200px" readonly value="<%=usedmr.getStation()%>">
				</td>
				<td>
					<input type="text" name="department" id=<%="department" + i%>
						style="width: 130px" readonly value="<%=usedmr.getDepartment()%>">
				</td>
				<td>
					<input type="text" name="starttime" id=<%="starttime" + i%>
						style="width: 160px" readonly value="<%=usedmr.getStarttime()%>">
				</td>
				<td>
					<input type="text" name="endtime" id="<%="endtime" + i%>"
						style="width: 160px" readonly readonly
						value="<%=usedmr.getEndtime()%>">
				</td>
				<%
					if ((user.getUsername().equals(usedmr.getUsername()))
								|| (user.getType() == 1)) {
							out.print("<td><a href='javascript:modify(" + i
									+ ")'>取消</a></td>");
						}
				%>

			</tr>

			<%
				i++;
				}
			%>

		</table>
	</body>
</html>
