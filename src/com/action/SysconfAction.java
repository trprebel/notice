package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bean.Role;
import com.bean.ShowType;
import com.bean.User;
import com.dao.impl.SysConfDao;
import com.dao.impl.TVshowDao;
import com.dao.impl.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.RecordLog;

/**系统配置相关操作
 * @author zxj
 * 2013-10-23
 */
public class SysconfAction extends ActionSupport{


	private static final long serialVersionUID = 1L;
	private String showtype;
	private SysConfDao sysConfDao=new SysConfDao();
	private String roleid;
	private String edit;
	private String addimpro;
	private String notice;
	private String activity;
	private String result;
	private String username;
	private String password;
	public String messages;
	
	public String getShowtype() {
		return showtype;
	}
	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getAddimpro() {
		return addimpro;
	}
	public void setAddimpro(String addimpro) {
		this.addimpro = addimpro;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String requestshow()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			TVshowDao tvshowDao=new TVshowDao();
			ShowType showType=tvshowDao.findShowType();
			//System.out.println(showType.getType());
			request.setAttribute("type", showType.getType());
			return "show";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String confshow()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			//System.out.println(Integer.parseInt(showtype));
			sysConfDao.setAllTVShowNot();
			sysConfDao.setTVShowByType(Integer.parseInt(showtype));
			RecordLog.recordlog("设置显示类型为"+showtype);
			request.setAttribute("type", showtype);
			messages="设置成功！";
			return "show";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**请求角色列表
	 * @return
	 */
	public String requestrole()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			String page=(String)request.getParameter("page");
			List<Role> roles=sysConfDao.findAllRole();
			request.setAttribute("roles", roles);
			return page;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**修改用户角色
	 * @return
	 */
	public String modifyrole()
	{
		try {
			//System.out.println(edit);
			Role role=new Role();
			role.setRoleid(Integer.parseInt(roleid));
			if (edit.equals("true")) role.setEdit(1);
			else role.setEdit(0);
			if (addimpro.equals("true")) role.setAddimpro(1);
			else role.setAddimpro(0);
			if (notice.equals("true")) role.setNotice(1);
			else role.setNotice(0);
			if (activity.equals("true")) role.setActivity(1);
			else role.setActivity(0);
			if (showtype.equals("true")) role.setShowtype(1);
			else role.setShowtype(0);
			sysConfDao.modifyRole(role);
			result="修改成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result="修改失败！";
		}
		return "result";
	}
	public String createuser()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			//System.out.println("createuser");
			
			UserDao userDao=new UserDao();
			//User user=new User();
			
			User user=userDao.findUserByName(username);
			if (user!=null) {
				messages="用户已存在";
				List<Role> roles=sysConfDao.findAllRole();
				request.setAttribute("roles", roles);
				return "create";
			}
			else {
				user=new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setRoleid(Integer.parseInt(roleid));
				userDao.createUser(user);
				List<Role> roles=sysConfDao.findAllRole();			
				//System.out.println("user=="+user.getUsername());
				request.setAttribute("roles", roles);
				messages="创建成功！";
				return "create";
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}

}
