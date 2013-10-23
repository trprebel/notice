package com.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bean.ShowType;
import com.dao.impl.TVshowDao;
import com.opensymphony.xwork2.ActionSupport;

/**系统配置相关操作
 * @author zxj
 * 2013-10-23
 */
public class SysconfAction extends ActionSupport{


	private static final long serialVersionUID = 1L;
	private String showtype;
	
	public String getShowtype() {
		return showtype;
	}
	public void setShowtype(String showtype) {
		this.showtype = showtype;
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
		try {
			//System.out.println(Integer.parseInt(showtype));
			
			return "show";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	

}
