package com.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	/**
	 * 本周概况
	 */
	public void week() {
		try {
			//System.out.println(page);
			String sdate;
			Calendar monday = Calendar.getInstance();//当前周周一日期
			Calendar sunday = Calendar.getInstance();//当前周周日日期
			Date currDate=new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			int wday=2-monday.get(Calendar.DAY_OF_WEEK);
			if(wday>0) wday=-6;
			monday.add(Calendar.DAY_OF_MONTH, wday);
			String s_monday=format.format(monday.getTime());


			wday=8-sunday.get(Calendar.DAY_OF_WEEK);
			sunday.add(Calendar.DAY_OF_MONTH, wday);
			String s_sunday=format.format(sunday.getTime());



			//sdate = format.format(date.getTime());
			PageProgram pageProgram=new PageProgram();
			pageProgram.setStart((Integer.parseInt(page)-1)*8);
			pageProgram.setLength(8);
			//pageProgram.setDate(sdate);
			List<Program> thisWeekPagePro=programDao.findThisWeekPagePro(pageProgram);

			List<Program> thisWeekAllPro=programDao.findThisWeekAllPro();

			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("weekprocess");
			Element successful = result.addElement("successful");
			successful.addText("yes");

			Element version=result.addElement("version");
			int i_version=programDao.findVersion();
			version.addText(i_version+"");


			int i_total=0;
			int i_activePro=0;
			int i_exceedPro=0;
			int i_arrivePro=0;
			int i_finishPro=0;
			int i_finishRate=0;
			for (Program program : thisWeekAllPro) {
				//System.out.println(program.getProid());
				Date d_plandate=format.parse(program.getPlandate());
				//Date d_compdate=format.parse(program.getCompdate());
				if(d_plandate.getTime()<currDate.getTime())//超期
				{
					i_exceedPro++;

				}else if((d_plandate.getTime()>=monday.getTime().getTime())&&(d_plandate.getTime()<=sunday.getTime().getTime()))//本周到期
				{
					i_arrivePro++;
				}
				i_total++;

			}
			i_activePro=i_total-i_exceedPro;
			Map<String, String>map=new HashMap<String, String>();
			map.put("monday", s_monday);
			map.put("sunday", s_sunday);
			i_finishPro=programDao.findFinishCount(map);

			i_finishRate=(i_total-i_exceedPro)*100/i_total;

			Element activePro=result.addElement("activepro");
			Element exceedPro=result.addElement("exceedpro");
			Element arrivePro=result.addElement("arrivepro");
			Element finishPro=result.addElement("finishpro");
			Element finishRate=result.addElement("finishrate");
			activePro.addText(i_activePro+"");
			exceedPro.addText(i_exceedPro+"");
			arrivePro.addText(i_arrivePro+"");
			finishPro.addText(i_arrivePro+"");
			finishRate.addText(i_finishRate+"%");

			Element record=result.addElement("record");
			Element total=record.addElement("totalpronum");
			total.addText(i_total+"");
			Element pageno=record.addElement("page");
			pageno.addText(page);
			Element pagesize=record.addElement("pagesize");
			pagesize.addText("8");
			Element prolist=record.addElement("prolist");
			//prolist.addText("prolist");

			//System.out.println("……");
			for (Program program : thisWeekPagePro) {
				//System.out.println(program.getProid());
				Element e_program=prolist.addElement("program");
				Element proname=e_program.addElement("proname");
				proname.addText(program.getProname());
				Element tvtype=e_program.addElement("tvtype");
				tvtype.addText(program.getTvtype());
				Element state=e_program.addElement("state");
				Date d_plandate=format.parse(program.getPlandate());
				//Date d_compdate=format.parse(program.getCompdate());


				if (d_plandate.getTime()>=currDate.getTime())
				{
					if(((d_plandate.getTime()-currDate.getTime())/(24*60*60*1000))<4)
					{
						state.addText("风险");
					}
					else state.addText("正常");
				}
				else {
					state.addText("超期");
				}

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
			try {
				Document document = DocumentHelper.createDocument();
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				Element result = document.addElement("result");
				Element cmd = result.addElement("cmd");
				cmd.addText("weekprocess");
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
	/**
	 * 本月重点事件
	 */
	public void month() {
		try {
			Calendar dateCalendar=Calendar.getInstance();
			String s_monthstart=dateCalendar.get(Calendar.YEAR)+"-"+(dateCalendar.get(Calendar.MONTH)+1)+"-01";
			String s_monthend=dateCalendar.get(Calendar.YEAR)+"-"+(dateCalendar.get(Calendar.MONTH)+1)+"-32";
			Date currDate=new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			//programDao.findThisMonthEmphasisPro(sdate);
			int currMonth=dateCalendar.get(Calendar.MONTH)+1;

			Program tracePro=programDao.findThisMonthTraceEve(currMonth);

			Map<String, String>monthmap=new HashMap<String, String>();
			monthmap.put("monthstart", s_monthstart);
			monthmap.put("monthend", s_monthend);
			List<Program> currMonthEmphasisEve = programDao.findThisMonthEmphasisEve(monthmap);

			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("currmontheve");
			Element successful = result.addElement("successful");
			successful.addText("yes");
			Element version=result.addElement("version");
			int i_version=programDao.findVersion();
			version.addText(i_version+"");
			Element record=result.addElement("record");
			Element importantPro=record.addElement("importantpro");
			importantPro.addAttribute("proname", tracePro.getProname());
			Date d_plandate=format.parse(tracePro.getPlandate());
			if (d_plandate.getTime()>=currDate.getTime())
			{
				if(((d_plandate.getTime()-currDate.getTime())/(24*60*60*1000))<4)
				{
					importantPro.addAttribute("state", "风险");
				}
				else importantPro.addAttribute("state", "正常");
			}
			else {
				importantPro.addAttribute("state", "超期");
			}

			Element programlist=record.addElement("programlist");

			for (Program program : currMonthEmphasisEve) {
				Element e_program=programlist.addElement("program");
				Element proname=e_program.addElement("proname");
				proname.addText(program.getProname());
				String evaluateMonth=program.getEvaluatedate().substring(5,7);//获得月份
				String systestMonth=program.getSystestdate().substring(5,7);
				String modelevaluate=program.getModelevaluatedate().substring(5,7);
				String subass=program.getSubassdate().substring(5,7);
				if(Integer.parseInt(evaluateMonth)==currMonth)
				{
					Element event=e_program.addElement("event");
					event.addAttribute("type","评审会议");
					event.addAttribute("date", program.getEvaluatedate());
				}
				if (Integer.parseInt(systestMonth)==currMonth) 
				{
					Element event=e_program.addElement("event");
					event.addAttribute("type","系统测试");
					event.addAttribute("date", program.getSystestdate());
				}
				if(Integer.parseInt(modelevaluate)==currMonth)
				{
					Element event=e_program.addElement("event");
					event.addAttribute("type","样评");
					event.addAttribute("date", program.getModelevaluatedate());
				}
				if(Integer.parseInt(subass)==currMonth)
				{
					Element event=e_program.addElement("event");
					event.addAttribute("type","主观评价");
					event.addAttribute("date", program.getSubassdate());
				}

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
