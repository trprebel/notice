<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.bean.User" />
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
	font-size:12px;
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
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload.queue.js"></script>
<script type="text/javascript" src="js/fileprogress.js"></script>
<script type="text/javascript" src="js/handlers.js"></script>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript">
	function submitfun() {
		var activitytitle = document.getElementById("activitytitle").value;
		
		if (activitytitle == "" || activitytitle == null) {
			alert("活动标题不能为空！");
			return;
		}
		var f1 = document.getElementById("cactivityform");
		f1.submit();
	}
	var swfu;

	window.onload = function() {
		//alert("script");
		var settings = {
			flash_url : "swfupload.swf",
			upload_url: "pictureACTIVITY.action",
			file_post_name : "picture",
			//post_params: {"PHPSESSID" : "123"},
			file_size_limit : "500 MB",
			file_types : "*.*",
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
    	        	var imagepath=document.createElement("input");
    	        	imagepath.name="imagepath";
    	        	imagepath.type="hidden";
    	        	imagepath.value=serverData;
    	        	var div=document.getElementById("fsUploadProgress");
    	        	div.appendChild(imagepath);
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
		method="post" enctype="multipart/form-data">
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
											type="text" name="activitytitle" id="activitytitle" /></td>
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
										<td height="50" colspan="2" bgcolor="#FFFFFF"><div style="margin-top:20px;" align="center"><input
											type="button" onClick="javascript:submitfun()" value="发布">&nbsp;<input
											type="reset" value="重置"></div></td>
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

</body>
<script type="text/javascript">
  if('${messages}'!="")
  {
  	alert('${messages}');
  }
  </script>
</html>
