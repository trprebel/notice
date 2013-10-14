package com.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

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
			Calendar date = Calendar.getInstance();
			int wday=2-date.get(Calendar.DAY_OF_WEEK);
			if(wday>0) wday=-6;
			int lastwday=wday-8;
			date.add(Calendar.DAY_OF_MONTH, lastwday);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String sdate = format.format(date.getTime());
			List<Program> programs=programDao.findLastWeekPro(sdate);
			for (Program program : programs) {
				System.out.println(program.getProid());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
