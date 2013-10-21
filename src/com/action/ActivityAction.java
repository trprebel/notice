package com.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.Activity;
import com.dao.impl.ActivityDao;
import com.opensymphony.xwork2.ActionSupport;

/**活动展示相关操作
 * @author zxj
 * 2013-10-21
 */
public class ActivityAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private ActivityDao activityDao=new ActivityDao();
	public void activity() {
		try {
			Activity activity=activityDao.findShowActivity();
			//System.out.println(activity.getTitle());
			List<String> paths=activityDao.findActivityImgById(activity.getActivityid());
			activity.setImages(paths);
			
			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("activity");
			Element successful = result.addElement("successful");
			successful.addText("yes");
			Element record=result.addElement("record");
			Element title=record.addElement("title");
			title.addText(activity.getTitle());
			Element imgnum=record.addElement("imgnum");
			imgnum.addText(paths.size()+"");
			Element pathlist=record.addElement("pathlist");
			for (String path : paths) {
				Element e_path=pathlist.addElement("path");
				e_path.addText(path);
			}
			
			
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
