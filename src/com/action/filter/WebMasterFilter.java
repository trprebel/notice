/**
 * 
 */
package com.action.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;




/**
 * @author zhangxiaoliang
 * @date   Dec 24, 2010
 * @version 1.0
 */
public class WebMasterFilter implements Filter{   
	private String[] commons={"authcode.jsp","login.jsp","login.action","pictureACTIVITY.action",
			"show.action","weekPROGRAM.action","monthPROGRAM.action","activityACTIVITY.action",
			"noticeNOTICE.action","top.jsp","left_activity.jsp","left_notice.jsp","left_sysconf.jsp","left.jsp"};  
	
    public void destroy() {   
    	
    }   
  
    public void doFilter(ServletRequest req, ServletResponse res,   
            FilterChain chain) throws IOException, ServletException {   
        HttpServletRequest request = (HttpServletRequest)req;   
        HttpServletResponse response = (HttpServletResponse)res;   
        HttpSession session = request.getSession();   

		String req_path = request.getRequestURI();
		if(req_path.equals("/Notice/"))
		{
			chain.doFilter(req, res);
			return;
		}
		
		User user = (User)session.getAttribute("user");

	
		for (String common : commons) {
			if (req_path.contains(common)) {
				chain.doFilter(req, res);
				return;
			}
		}
       
    	// 不过滤登录退出

        if(user == null){
        	System.out.println(req_path);
        	res.setCharacterEncoding("UTF-8");
        	response.setContentType("text/html; charset=UTF-8"); 
        	String str ="请先登录系统再进行操作!";
        		res.getWriter().write("<script>alert('"+str+"');window.parent.parent.parent.parent.parent.parent.parent.location.href='/Notice/login.jsp';</script>");
        		return; 
        } else
        	chain.doFilter(req, res);

    }
  
    public void init(FilterConfig arg0) throws ServletException {   
    	//commons = StringUtil.getSpPropeurl("common").split("\\|");     
    }   
  
}  
