package com.action;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.ImportantPro;
import com.bean.Notice;
import com.dao.impl.NoticeDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.RecordLog;

/**公告相关操作
 * @author zxj
 * 2013-10-21
 */
public class NoticeAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	private String noticeid;
	private String noticetitle;
	private String noticecontent;
	private String addresult;
	
	public String getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getAddresult() {
		return addresult;
	}
	public void setAddresult(String addresult) {
		this.addresult = addresult;
	}
	private NoticeDao noticeDao=new NoticeDao();
	public void notice() {
		try {
			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("notice");
			Element successful = result.addElement("successful");
			successful.addText("yes");
			Element record=result.addElement("record");
			
			Notice notice=noticeDao.findShowNotice();
			int hasContent=0;
			if (notice.getContent()!=null&&!notice.getContent().equals("")) {
				hasContent=1;
			}
			Element e_hasContent=record.addElement("hascontent");
			Element title=record.addElement("title");
			
			if (hasContent==1) {
				Element content=record.addElement("content");
				content.addText(notice.getContent());
			}
			e_hasContent.addText(hasContent+"");
			
			title.addText(notice.getTitle());
			//System.out.println(notice.getContent());
			out.println(document.asXML());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				Document document = DocumentHelper.createDocument();
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				Element result = document.addElement("result");
				Element cmd = result.addElement("cmd");
				cmd.addText("weekprogress");
				Element successful = result.addElement("successful");
				successful.addText("no");
				Element errorno=result.addElement("errorno");
				errorno.addText("2003");
				out.println(document.asXML());
				out.flush();
				out.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	/**发布公告
	 * @return
	 */
	public String create()
	{
		try {
			noticeDao.setAllNotShow();
			Notice notice=new Notice();
			notice.setTitle(noticetitle);
			notice.setContent(noticecontent);
			notice.setIsshow(1);
			noticeDao.createNotice(notice);
			return "noticelist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String requestlist()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			//System.out.println("requestlist");
			List<Notice> notices=noticeDao.findRecentNotice();
			//System.out.println(notices.get(0).getContent());
			request.setAttribute("notices", notices);
			return "noticelist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String addshow()
	{
		try {
			//System.out.println(noticeid);
			noticeDao.setAllNotShow();
			noticeDao.setShowById(Integer.parseInt(noticeid));
			//RecordLog.recordlog("将proid为"+proid+"的项目设为"+month+"月重点项目！");
			addresult="设置成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addresult="设置失败！";
		}
		return "addresult";
	}
}
