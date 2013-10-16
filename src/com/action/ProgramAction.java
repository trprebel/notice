package com.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;


import com.bean.EWProgress;
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
	
	private String proid;
	private String proname;
	private String tvtype;
	private String state;
	private String chargeperson;
	private String weekprogress;
	private String oriweekprogress;
	private String plandate;
	private String evaluatedate;
	private String systestdate;
	private String modelevaluatedate;
	private String subassdate;
	private String page;
	public String messages;
	public Paginator paginator=new Paginator(5);
	private PageProgram pageProgram=new PageProgram();
	private ProgramDao programDao=new ProgramDao();

	
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getTvtype() {
		return tvtype;
	}
	public void setTvtype(String tvtype) {
		this.tvtype = tvtype;
	}
	public String getChargeperson() {
		return chargeperson;
	}
	public void setChargeperson(String chargeperson) {
		this.chargeperson = chargeperson;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getWeekprogress() {
		return weekprogress;
	}
	public void setWeekprogress(String weekprogress) {
		this.weekprogress = weekprogress;
	}
	
	public String getOriweekprogress() {
		return oriweekprogress;
	}
	public void setOriweekprogress(String oriweekprogress) {
		this.oriweekprogress = oriweekprogress;
	}
	public String getPlandate() {
		return plandate;
	}
	public void setPlandate(String plandate) {
		this.plandate = plandate;
	}
	public String getEvaluatedate() {
		return evaluatedate;
	}
	public void setEvaluatedate(String evaluatedate) {
		this.evaluatedate = evaluatedate;
	}
	public String getSystestdate() {
		return systestdate;
	}
	public void setSystestdate(String systestdate) {
		this.systestdate = systestdate;
	}
	public String getModelevaluatedate() {
		return modelevaluatedate;
	}
	public void setModelevaluatedate(String modelevaluatedate) {
		this.modelevaluatedate = modelevaluatedate;
	}
	public String getSubassdate() {
		return subassdate;
	}
	public void setSubassdate(String subassdate) {
		this.subassdate = subassdate;
	}
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
	
	public String create()
	{
		try {
			//System.out.println("create");
			Program program=new Program();
			program.setProname(proname);
			program.setTvtype(tvtype);
			program.setChargeperson(chargeperson);
			program.setPlandate(plandate);
			program.setEvaluatedate(evaluatedate);
			program.setSystestdate(systestdate);
			program.setModelevaluatedate(modelevaluatedate);
			program.setSubassdate(subassdate);
			program.setWeekprogress("项目开始！");
			programDao.createProgram(program);
			messages="创建成功！";
			return "create";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 请求项目列表
	 */
	public String requestlist()
	{
		try {
			
			
			pageProgram.setStart(paginator.getOffset());
			pageProgram.setLength(paginator.getPageSize());
			int allRow = programDao.findUnFinishCount();
			//System.out.println(allRow);
			if(allRow==0){
				paginator.setData(0, null);
				return "success";
			}
			Date currDate=new Date();
			List<Program> programs=programDao.findUnFinishPagePro(pageProgram);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			for (Program program : programs) {
				Date d_plandate=format.parse(program.getPlandate());
				if (d_plandate.getTime()>=currDate.getTime())
				{
					if(((d_plandate.getTime()-currDate.getTime())/(24*60*60*1000))<4)
					{
						program.setState(2);
					}
					else program.setState(1);
				}
				else {
					program.setState(3);
				}

			}
			//List list = videoDao.findPageList(program, Constants.IBATIS_VIDEO);
			paginator.setData(allRow, programs);
			return "programlist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 查找要编辑的项目的源数据
	 */
	public String requestedit()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			//System.out.println(proid);
			Program program=programDao.findProgramById(Integer.parseInt(proid));
			request.setAttribute("program", program);
			return "edit";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 编辑项目
	 */
	public String edit()
	{
		try {
			Program program=new Program();
			program.setProid(Integer.parseInt(proid));
			program.setProname(proname);
			program.setTvtype(tvtype);
			program.setState(Integer.parseInt(state));
			program.setChargeperson(chargeperson);
			program.setWeekprogress(weekprogress);
			program.setPlandate(plandate);
			program.setEvaluatedate(evaluatedate);
			program.setSystestdate(systestdate);
			program.setModelevaluatedate(modelevaluatedate);
			program.setSubassdate(subassdate);
			if (state.equals("1")) {
				Date now=new Date();
				String snow=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(now);
				program.setCompdate(snow);
			}
			else program.setCompdate("2013-01-01");
			programDao.modifyProgram(program);
			if(!weekprogress.equals(oriweekprogress))
			{
				Calendar cal=Calendar.getInstance(); 
				int weeknum=cal.get(Calendar.WEEK_OF_YEAR);
				EWProgress ewProgress=new EWProgress();
				ewProgress.setProgramid(Integer.parseInt(proid));
				ewProgress.setCwprogress(weekprogress);
				ewProgress.setWeeknum(weeknum);
				programDao.addWeekProgress(ewProgress);
			}
			
			
			return "requestlist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 本周概况
	 */
	public void week() {
		try {
			//System.out.println(page);
			//String sdate;
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
			List<Program> thisWeekPagePro=programDao.findUnFinishPagePro(pageProgram);

			List<Program> thisWeekAllPro=programDao.findAllUnFinishPro();

			Document document = DocumentHelper.createDocument();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Element result = document.addElement("result");
			Element cmd = result.addElement("cmd");
			cmd.addText("weekprogress");
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
				weekProgress.addText(program.getWeekprogress());
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
