package com.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.Program;
import com.dao.impl.ProgramDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.PageProgram;
import com.util.Paginator;

/**项目管理相关操作
 * @author zxj
 * 2013-10-14
 */
public class ProgramAction extends ActionSupport{


	private static final long serialVersionUID = 1L;
	private String page;
	public Paginator paginator=new Paginator(8);
	private PageProgram pageProgram=new PageProgram();
	private ProgramDao programDao=new ProgramDao();
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	public PageProgram getPageProgram() {
		return pageProgram;
	}
	public void setPageProgram(PageProgram pageProgram) {
		this.pageProgram = pageProgram;
	}
	public void week() {
		try {
			System.out.println(page);
			String sdate;
			Calendar date = Calendar.getInstance();
			Date currDate=new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			int wday=1-date.get(Calendar.DAY_OF_WEEK);
			date.add(Calendar.DAY_OF_MONTH, wday);
			//if(wday>0) wday=-6;
			sdate = format.format(date.getTime());
			PageProgram pageProgram=new PageProgram();
			pageProgram.setStart((Integer.parseInt(page)-1)*8);
			pageProgram.setLength(8);
			pageProgram.setDate(sdate);
			List<Program> thisWeekPros=programDao.findThisWeekPro(pageProgram);
			
			int lastwday=wday-7;
			date.add(Calendar.DAY_OF_MONTH, lastwday);
			
			sdate = format.format(date.getTime());
			List<Program> lastWeekPros=programDao.findLastWeekPro(sdate);
			
			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("getxml");
			Element successful = result.addElement("successful");
			successful.addText("yes");
			
			
			int i;
			for (Program program : lastWeekPros) {
				System.out.println(program.getProid());
			}
			
			Element pageno=result.addElement("page");
			pageno.addText(page);
			Element pagesize=result.addElement("pagesize");
			pagesize.addText("8");
			Element prolist=result.addElement("prolist");
			prolist.addText("prolist");
			
			System.out.println("……");
			for (Program program : thisWeekPros) {
				System.out.println(program.getProid());
				Element e_program=prolist.addElement("program");
				Element proname=e_program.addElement("proname");
				proname.addText(program.getProname());
				Element tvtype=e_program.addElement("tvtype");
				tvtype.addText(program.getTvtype());
				Element state=e_program.addElement("state");
				Date d_plandate=format.parse(program.getPlandate());
				Date d_compdate=format.parse(program.getCompdate());
				if (program.getState()==0||(d_compdate.getTime()>d_plandate.getTime())) {
					state.addText("3");
				}
				else if (program.getState()==0&&(((d_plandate.getTime()-currDate.getTime())/(24*60*60*1000))<4)) {
					state.addText("2");
				}
				else state.addText("1");
				Element chargeperson=e_program.addElement("chargeperson");
				chargeperson.addText(program.getChargeperson());
				Element weekProgress=e_program.addElement("weekprogress");
				weekProgress.addText(program.getWeekprocess());
				Element plandate=e_program.addElement("plandate");
				plandate.addText(program.getPlandate());
			}
			
			out.println(document.asXML());
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
