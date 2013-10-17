package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.Log;
import com.bean.User;
import com.dao.impl.LogDao;
import com.opensymphony.xwork2.ActionSupport;

public class RecordLog extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//¼ÇÂ¼²Ù×÷
	public static void recordlog (String operate)
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		User user=(User)session.getAttribute("user");
		try{
			Date now=new Date();
			String snow=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(now);
			Log log=new Log();
			log.setUsername(user.getUsername());
			log.setOperate(operate);
			log.setTime(snow);
			LogDao logdao=new LogDao();
			logdao.insertLog(log);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
