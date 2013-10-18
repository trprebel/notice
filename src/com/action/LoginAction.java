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
	 * ��¼����
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
	//��¼ģ��
	public String login()
	{

		try
		{
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession sessions = request.getSession();
			String  validatecode=(String)sessions.getAttribute("rand");
			//1.��֤�벻��ȷ
			if(validatecode==null)
			{
				messages="��֤�벻���ڣ�";
				return "login";
			}
			if(!validatecode.equals(loginCode))
			{
				messages="��֤�벻��ȷ��";
				return "login";
			}
			user=this.userdao.findUserByName(getUsername());

			if(user==null)
			{
				messages="�û��������ڣ�";
				//System.out.println("�û���������");
				return "login";
			}
			else if(user.getPassword().equals(getPassword()))
			{
				
				sessions.setAttribute("user", user);
				RecordLog.recordlog("��½ϵͳ��");
				return "success";
			}
			else
			{
				//System.out.println("�������!");
				messages="�������";
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
