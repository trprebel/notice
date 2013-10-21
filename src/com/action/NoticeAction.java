package com.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.Notice;
import com.dao.impl.NoticeDao;
import com.opensymphony.xwork2.ActionSupport;

/**公告相关操作
 * @author zxj
 * 2013-10-21
 */
public class NoticeAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
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
}
