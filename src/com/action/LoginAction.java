package com.action;


import javax.management.relation.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.User;
import com.dao.impl.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.RecordLog;

public class LoginAction extends ActionSupport{

	/**
	 * 登录功能
	 * @author trprebel
	 * 2013-09-16
	 */
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private User user;
	private String loginCode;
	private UserDao userdao=new UserDao();
	public String messages;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginCode() {
		return loginCode;
	}
	public void setLoginCode(String loginCode) {
		this.loginCode = loginCode;
	}
	//登录模块
	public String login()
	{

		try
		{
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession sessions = request.getSession();
			String  validatecode=(String)sessions.getAttribute("rand");
			//1.验证码不正确
			if(validatecode==null)
			{
				messages="验证码不存在！";
				return "login";
			}
			if(!validatecode.equals(loginCode))
			{
				messages="验证码不正确！";
				return "login";
			}
			user=this.userdao.findUserByName(getUsername());

			if(user==null)
			{
				messages="用户名不存在！";
				//System.out.println("用户名不存在");
				return "login";
			}
			else if(user.getPassword().equals(getPassword()))
			{
				
				sessions.setAttribute("user", user);
				RecordLog.recordlog("登陆系统！");
				return "success";
			}
			else
			{
				//System.out.println("密码错误!");
				messages="密码错误！";
				return "login";
			}
			//System.out.println(user.getUsername());
			//System.out.println(user.getPassword());
			//System.out.println(user.getRole());
			//System.out.println(user.getEdit());
			//System.out.println(user.getAddimpro());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}


	
}
