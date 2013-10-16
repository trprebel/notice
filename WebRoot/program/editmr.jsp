<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.MeetingRoom" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	List<MeetingRoom> meetingrooms=(List<MeetingRoom>)session.getAttribute("mrlist");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'editmr.jsp' starting page</title>

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
  
  		function modify(i)
  		{
  			//alert(document.getElementById("uname"+i).value);
  			var userdata = {
           	id :document.getElementById("id"+i).value,
           	mrname : document.getElementById("mrname"+i).value,
           	floor : document.getElementById("floor"+i).value,
           	station : document.getElementById("station"+i).value,
           	department : document.getElementById("department"+i).value,
           	state : document.getElementById("state"+i).value
        	};
  	
			$.ajax({
     			type:'post',
     			data:userdata,
     			url:'modifyMR.action',
     			dataType:'text',
     			success:function(data){
     			var obj = $.parseJSON(data); 
     			//var json = eval("("+data+")");
				//alert(json.result);       
				alert(obj.value);
     			},
    			error:function(){
       			alert("修改失败");
    			}
    		});
  		}
  </script>
	<body>
		<table align="center">
		<caption>会议室列表</caption>
			<tr>
				<td>
					ID
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
					部门
				</td>
				<td>
					状态
				</td>
				<td>
					创建时间
				</td>
				<td>
					操作
				</td>
			</tr>
			<%
				int i = 0;
				for (MeetingRoom meetingroom: meetingrooms) {
			%>

			<tr>
				<td>
					<input type="text" name="id" id="<%="id" + i%>" border="0" readonly
						value="<%=meetingroom.getId()%>">
				</td>

				<td>
					<input type="text" name="mrname" id=<%="mrname" + i%>
						value="<%=meetingroom.getMrname()%>">
				</td>
				<td>
					<input type="text" name="floor" id=<%="floor" + i%>
						value="<%=meetingroom.getFloor()%>">
				</td>
				<td>
					<input type="text" name="station" id=<%="station" + i%>
						value="<%=meetingroom.getStation()%>">
				</td>
				<td>
					<input type="text" name="department" id=<%="department" + i%>
						value="<%=meetingroom.getDepartment()%>">
				</td>
				<td>
					<select name="state" id=<%="state" + i%>>
						<option id="used" value="1"
							<%if(meetingroom.getState()==1) out.print("selected"); %>>
							可用
						</option>
						<option id="unused" value="0"
							<%if(meetingroom.getState()==0) out.print("selected"); %>>
							不可用
						</option>
					</select>
				</td>
				<td>
					<input type="text" name="createtime" id="<%="createtime"+i %>" readonly
						value="<%=meetingroom.getCreatetime() %>">
				</td>

				<td>
					<a href="javascript:modify(<%=i%>)">修改</a>
				</td>

			</tr>

			<%
				i++;
				}
			%>

		</table>
	</body>
</html>
