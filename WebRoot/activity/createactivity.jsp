<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="filter.StringUtil"%>
<jsp:directive.page import="com.bean.User" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
	String httpimagePath=StringUtil.getSpPropeurl("httpimagePath");
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
	font-size:12px;
}



.button_chuang {
	border: 1px solid #e9eff2;
	width: 180px;
	height: 20px;
}
.mydiv2 {
text-align: left;
text-indent:20px;
line-height: 40px;
font-size: 12px;
font-weight: bold;
z-index:99;
left:28%;/*FF IE7*/
top: 1%;/*FF IE7*/

margin-left:-100px!important;/*FF IE7 ��ֵΪ��������һ�� */
margin-top:50px!important;/*FF IE7 ��ֵΪ�����ߵ�һ��*/

margin-top:0px;

position:fixed!important;/*FF IE7*/
position:absolute;/*IE6*/

_top:       expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/

}
.bg {
background-color:#000000;
width: 100%;
height: 100%;
left:0;
top:0;/*FF IE7*/
filter:alpha(opacity=20);/*IE*/
opacity:0.2;/*FF*/
z-index:1;

position:fixed!important;/*FF IE7*/
position:absolute;/*IE6*/

_top:       expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/

}
#closeimg {
	position: relative;
	width:14px;
	height:14px; 
	overflow:hidden;
	top: -117px;
	right: 14px;
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
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload.queue.js"></script>
<script type="text/javascript" src="js/fileprogress.js"></script>
<script type="text/javascript" src="js/handlers.js"></script>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
	function submitfun() {
		var activitytitle = document.getElementById("activitytitle").value;
		var div=document.getElementById("preview");
		if (activitytitle == "" || activitytitle == null) {
			alert("活动标题不能为空！");
			return;
		}
		if(div.innerHTML=="" || div.innerHTML==null)
		{
			alert("活动图片不能为空！");
			return;
		}
		//else alert(div.innerHTML);
		var f1 = document.getElementById("cactivityform");
		f1.submit();
	}
	function resetfun()
	{
		var div=document.getElementById("preview");
		var div1=document.getElementById("divStatus");
    	div.innerHTML="";
    	div1.innerHTML="0 图片已上传！";
    	imageid=0;
    	document.forms[0].reset();
    	
	}
	function deleteimg(id)
	{
		var div=document.getElementById("preview");
		//var imagepath=document.getElementById("imagepath"+id);
		//var image=document.getElementById("image"+id);
		var span=document.getElementById("span"+id);
		//div.removeChild(imagepath);
		//div.removeChild(image);
		div.removeChild(span);
		imagenum--;
	}
	function butOnClick() { 
 		if(event.keyCode == 13) { 
 			submitfun();
 			return false;
 		}
 	}

	function showDiv3(image){
		document.getElementById("popimage").src=image;
		document.getElementById('popDiv3').style.display='block';
		document.getElementById('bg').style.display='block';
		//document.getElementById("spanButtonPlaceHolder").display="none";
	}

	function closeDiv3(){
		document.getElementById('popDiv3').style.display='none';
		document.getElementById('bg').style.display='none';
	}


	var swfu;
	var imageid=0;
	var imagenum=0;
	window.onload = function() {
		//alert("script");
		var settings = {
			flash_url : "swfupload.swf",
			upload_url: "pictureACTIVITY.action",
			file_post_name : "picture",
			//post_params: {"PHPSESSID" : "123"},
			file_size_limit : "30 MB",
			file_types : "*.jpg;*.jpeg;*.png;*.gif;*.bmp",
			file_types_description : "All Files",
			file_upload_limit : 0,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress",
				cancelButtonId : "btnCancel"
			},
			debug: false,

			// Button settings
			button_image_url: "../images/TestImageNoText_65x29.png",
			button_width: "65",
			button_height: "29",
			button_placeholder_id: "spanButtonPlaceHolder",
			button_text: '<span class="theFont">浏览</span>',
			button_text_style: ".theFont { font-size: 16; }",
			button_text_left_padding: 12,
			button_text_top_padding: 3,
			button_window_mode:"opaque",
			
			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete	// Queue plugin event
		};

		swfu = new SWFUpload(settings);
     };
     function uploadSuccess(file, serverData) {
    		try {
    			if (serverData.substring(0, 7) === "FILEID:") {
    				progress.setStatus("上传失败.");
    	            progress.toggleCancel(false);
    	            alert(serverData);
    				
    	        } else {
    	        	var v_imageid=imageid;
    	        	var imagepath=document.createElement("input");
    	        	imagepath.name="imagepath";
    	        	imagepath.type="hidden";
    	        	//imagepath.id="imagepath"+imageid;
    	        	imagepath.value=serverData;
    	        	
    	        	var image=document.createElement("img");
    	        	//image.id="image"+imageid;
    	        	image.src=""+serverData;
    	        	image.width="200";
    	        	image.height="132";
    	        	image.onclick=function(){showDiv3("<%=httpimagePath%>"+serverData);};
    	        	image.title="点击放大";
    	        	
    	        	var close=document.createElement("img");
    	        	close.id="closeimg";
    	        	close.src="images/cancelbutton1.gif";
    	        	//close.position="relative";
    	        	//close.top="-130px";
    	        	//close.right="14px";
    	        	close.onclick=function(){deleteimg(v_imageid);};
    	        	//close.width="14";
    	        	//var magnifyimg=document.createElement("magnifyimg");
    	        	//magnifyimg.src="images/exp.jsp";
    	        	//magnifyimg.width="38";
    	        	//magnifyimg.height="38";
    	        	//magnifyimg.border="0";
    	        	
    	        	//<img onclick="javascript:showDiv3()" src="images/exp.jpg" width="38" height="38" border="0" />
    	        	
    	        	
    	        	
    	        	var div=document.getElementById("preview");
    	        	var span=document.createElement("span");
    	        	span.id="span"+imageid;
 
    	        	div.appendChild(span);
    	        	span.appendChild(imagepath);
    	        	//div.innerHTML="<img id='image"+imageid+"' src='"+serverData+"' width='200' onclick='alert("+imageid+")'>";
    	        	span.appendChild(image);
    	        	span.appendChild(close);
    	        	//span.appendChild(magnifyimg);
    	        	imageid++;
    	        	imagenum++;
    	            var currentTime = new Date();
    				var progress = new FileProgress(file, this.customSettings.progressTarget);
    				progress.setComplete();
    				//Calculate upload time
    				var cTime = (Math.ceil(currentTime-iTime)/1000);
    				var zmin = 0;
    				var zsec = 0;
    				zmin = Math.floor(cTime/60);
    				if (zmin < 10) {
    					zmin = "0" + zmin; 
    				}
    				zsec = Math.ceil(cTime % 60);
    				if (zsec < 10) {
    					zsec = "0" + zsec; 
    				}
    				//Show how long the upload took
    				progress.setStatus("上传完成，用时:<b><font color=red> " + zmin + "分:" + zsec + '秒</font></b>');
    				progress.toggleCancel(false);
    				//			uploadSuccessUpdateParent(serverData.substring(7));
    				// addImage("thumbnail.php?id=" + serverData.substring(7));
    	        }
    		} catch (ex) {
    			this.debug(ex);
    		}
    	}
     
</script>
<body>
	<form action="createACTIVITY" name="cactivityform" id="cactivityform"
		method="post" enctype="multipart/form-data" onSubmit="return false;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="images/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src="images/images/tab_03.gif" width="12" height="30" /></td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><div style="margin-top:7px;"><table  width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="images/images/tb.gif" width="16" height="16" />
														</div></td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[活动管理]-[展示活动]</td>
												</tr>
											</table></div></td>
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
							<td width="16"><img src="images/images/tab_07.gif"
								width="16" height="30" /></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="8" background="images/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" style="margin-top:15px;" cellpadding="0"
									cellspacing="0" bgcolor="b5d6e6">
									<tr>
										<td width="40%" height="28" bgcolor="#FFFFFF"><div
												align="right">
												<span class="STYLE1">活动标题： </span>
											</div></td>
										<td bgcolor="#FFFFFF"><input class="button_chuang"
											type="text" name="activitytitle" id="activitytitle" onkeydown="javascript:butOnClick();"/></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">活动图片：</span>
											</div>
											<div id="path"></div>
											</td>
										<td bgcolor="#FFFFFF"><div class="fieldset flash"
												id="fsUploadProgress">
												<span class="legend">上传活动图片</span>
											</div>
											<div id="divStatus">0 图片已上传！</div>
											<div>
												<span id="spanButtonPlaceHolder"></span> <input
													id="btnCancel" type="button" value="取消上传所有图片"
													onclick="swfu.cancelQueue();" disabled="disabled"
													style="margin-left: 2px; font-size: 8pt; height: 29px;" />
											</div></td>
									</tr>
									<tr>
										<td height="28" bgcolor="#FFFFFF"><div align="right">
												<span class="STYLE1">图片预览：</span>
											</div>
										</td>
										<td bgcolor="#FFFFFF">
										<div id="preview"></div>
										</td>
									</tr>
									<tr>
										<td height="50" colspan="2" bgcolor="#FFFFFF"><div style="margin-top:20px;" align="center"><input
											type="button" id="release" onclick="javascript:submitfun()" value="发布">&nbsp;<input
											type="button" onclick="resetfun()" value="重置"></div></td>
									</tr>
								</table></td>
							<td width="8" background="images/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35" background="images/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src="images/images/tab_18.gif" width="12" height="35" /></td>
							<td>&nbsp;</td>
							<td width="16"><img src="images/images/tab_20.gif"
								width="16" height="35" /></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
	<div id="popDiv3" class="mydiv2" style="display:none;">
	<div align="right" class="pop_button"><a href="javascript:closeDiv3()"><img id="popimage" src="images/ima.jpg" border="0" width="800" /></a></div>
	</div>
	<div id="bg" class="bg" style="display:none;"></div>
</body>
<script type="text/javascript">
  if('${messages}'!="")
  {
  	alert('${messages}');
  }
  </script>
</html>
