<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Oauth_resource"%>
<%@ page import="com.bean.Oauth_user"%>
<%@ page import="konka.util.Constants"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Oauth_user user = (Oauth_user)request.getSession().getAttribute(Constants.LOGIN_USER);
List<Oauth_resource> list = user.getListResource();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0038)http://test.kkapp.com/sninput/left.jsp -->
<HTML><HEAD><TITLE></TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="css/sdmenu.css">
<SCRIPT type=text/javascript src="js/sdmenu.js"></SCRIPT>

<SCRIPT type=text/javascript>
var myMenu;
window.onload = function() {
myMenu = new SDMenu("my_menu");
myMenu.init();
};
function changeClass(menu){
var menu_id=menu.id;
var menuid="menu00,menu01,menu02,menu03,menu04,menu05,menu10,menu11,menu12,menu13,menu14,menu15,menu20,menu21,menu22";
var array=menuid.split(",");
for(i=0; i<array.length; i++){
	try{
		document.getElementById(array[i]).className="selecte";
		}catch(ex){}
	}
	document.getElementById(menu_id).className="selected";
}            

</SCRIPT>

<STYLE>BODY {
	BORDER-RIGHT-WIDTH: 0px; BACKGROUND-COLOR: #156493; MARGIN: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px
}
.bk_top {
	BACKGROUND-IMAGE: url(images/toptitle.jpg); WIDTH: 173px; HEIGHT: 27px
}
.txt_top {
	DISPLAY: block; COLOR: white; CURSOR: default; FONT-WEIGHT: bold
}
.titlebar {
	COLOR: #ffffff; FONT-WEIGHT: bold
}
* {
	FONT-FAMILY: "宋体"; FONT-SIZE: 12px
}
</STYLE>

<META name=GENERATOR content="MSHTML 8.00.6001.19400"></HEAD>
<BODY>
<TABLE style="BACKGROUND-COLOR: #fff;" border=0 cellSpacing=0 cellPadding=0
height="100%">
  <TBODY>
  <TR>
    <TD class=bk_top colSpan=4>
      <TABLE border=0 align=center>
        <TBODY>
        <TR>
          <TD height=4></TD></TR>
        <TR>
          <TD class=titlebar>菜单列表</TD></TR></TBODY></TABLE></TD></TR>
  <TR vAlign=top>
    <TD width=2></TD>
    <TD bgColor=#156493 width=6></TD>
    <TD width=7></TD>
    <TD>
      <div style="FLOAT: left" id=my_menu class=sdmenu>
      <%
      	if(null!=list&&!list.isEmpty()){
      	  for(int i=0;i<list.size();i++){
      	    Oauth_resource r = list.get(i);
      	  %>
	      	 <div>
	          <span><%=r.getResname()%></span>
	          <%
	            if(!r.getListChildren().isEmpty()){
      	          for(int j=0;j<r.getListChildren().size();j++){
      	            Oauth_resource c = r.getListChildren().get(j);
      	            %>
      	            <a id="menu<%=i+""+j%>" class=selecte onmousedown=changeClass(this) href="<%=c.getResparam()%>" target="mainframe"><%=c.getResname()%></a>
      	            <%
      	          }
      	        }
	           %>
	         </div>
      	  <%}
      	}
       %>
	  </div>
	  </TD></TR></TBODY></TABLE></BODY></HTML>
