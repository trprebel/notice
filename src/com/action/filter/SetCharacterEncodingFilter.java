//package com.action.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import konka.util.Constants;
//
//import com.bean.Oauth_user;
//import com.client.ClientUser;
//
//public class SetCharacterEncodingFilter implements Filter {
//	protected String encoding = "utf-8";
//
//	// 不需要验证登录的链接
//	private static final String[] validateLoginbnUrl = { "authcode.jsp","login.jsp","login.action","pictureACTIVITY.action",
//		"show.action","weekPROGRAM.action","monthPROGRAM.action","activityACTIVITY.action",
//		"noticeNOTICE.action","top.jsp","left_activity.jsp","left_notice.jsp","left_sysconf.jsp","left.jsp"};
//
//	public void doFilter(ServletRequest httprequest,
//			ServletResponse httpResponse, FilterChain chain)
//			throws IOException, ServletException {
//
//		HttpServletRequest request = (HttpServletRequest) httprequest;
//		request.setCharacterEncoding(encoding);
//		HttpServletResponse response = (HttpServletResponse) httpResponse;
//		response.setHeader("Pragma", "No-cache");
//		response.setHeader("Cache-Control", "no-cache");
//		response.setDateHeader("Expires", 0);
//		response.setCharacterEncoding(encoding);
//		response.setContentType("text/html; charset=UTF-8");
//
//		String url = request.getRequestURI();
//		HttpSession session = request.getSession();
//		Oauth_user u = (Oauth_user) session.getAttribute(Constants.LOGIN_USER);
//		String userid = request.getParameter("userid");
//		String programid = request.getParameter("programid");
//		String none = "<script>alert('您无权限访问该项目，请联系管理员!');window.parent.location.href='/webservices/program.jsp';</script>";
//		if (null != userid && null != programid) {
//			u = ClientUser.getUserInfo(Integer.parseInt(userid), Integer
//					.parseInt(programid));
//			if (u.getListRole().size() > 0) {
//				session.setAttribute(Constants.LOGIN_USER, u);
//				response.sendRedirect("index.jsp");
//				return;
//			}
//		}
//		String loginUrl = "window.parent.location.href='/webservices/login.jsp';</script>";
//		if (url.contains("LogOut.jsp")) {
//			resWrite(response, "<script>" + loginUrl);
//			session.invalidate();
//			return;
//		}
//		if (u == null) {
//			resWrite(response, "<script>alert('登录超时，请重新登录！');" + loginUrl);
//			return;
//		}
//		if (u.getListRole().size() == 0) {
//			resWrite(response, none);
//			session.invalidate();
//			return;
//		}
//		if (isUrl(url)) {
//			if (!ClientUser.checkUrl(u.getAllUrl(), url)) {
//				resWrite(response, "<script>alert('无权限访问，请联系管理员！');</script>");
//				session.invalidate();
//				return;
//			}
//		}
//		chain.doFilter(request, response);
//	}
//
//	private boolean isUrl(String url) {
//		for (int i = 0; i < validateLoginbnUrl.length; i++) {
//			if (url.indexOf(validateLoginbnUrl[i]) > 0) {
//				return false;
//			}
//		}
//		return true;
//	}
//
//	private void resWrite(HttpServletResponse response, String msg)
//			throws IOException {
//		response.getWriter().write(msg);
//	}
//
//	public void destroy() {
//	}
//
//	public void init(FilterConfig arg0) throws ServletException {
//	}
//}