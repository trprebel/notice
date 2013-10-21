package com.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.ShowType;
import com.dao.impl.TVshowDao;

/**显示内容类型相关操作
 * @author zxj
 * 2013-10-21
 */
public class TVshowAction extends ActivityAction{


	private static final long serialVersionUID = 1L;

	private TVshowDao tvshowDao=new TVshowDao();
	public void show() {
		try {
			ShowType showType=tvshowDao.findShowType();
			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("tvshow");
			Element successful = result.addElement("successful");
			successful.addText("yes");
			Element type=result.addElement("type");
			Element record=result.addElement("record");
			if (showType.getType()==1) {
				
				type.addText("1");
				Element e_url=record.addElement("url");
				String url=showType.getUrl()+"noticeNOTICE.action";
				e_url.addText(url);
			}
			else if(showType.getType()==2){
				//Element type=record.addElement("type");
				type.addText("2");
				Element weekurl=record.addElement("weekurl");
				Element monthurl=record.addElement("monthurl");
				String url1=showType.getUrl()+"weekPROGRAM.action?page=1";
				String url2=showType.getUrl()+"monthPROGRAM.action";
				
				weekurl.addText(url1);
				monthurl.addText(url2);
			}else if (showType.getType()==3) {
				//Element type=record.addElement("type");
				type.addText("3");
				Element e_url=record.addElement("url");
				String url=showType.getUrl()+"activityACTIVITY.action";
				e_url.addText(url);
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
