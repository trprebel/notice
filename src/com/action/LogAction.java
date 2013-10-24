package com.action;

import java.util.List;


import com.bean.Log;
import com.dao.impl.LogDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.PageProgram;

/**日志文件相关操作
 * @author zxj
 * 2013-10-17
 */
public class LogAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	public Paginator paginator=new Paginator(20);
	private PageProgram program=new PageProgram();
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String requestlog()
	{

		try
		{
			LogDao logdao=new LogDao();

			program.setStart(paginator.getOffset());
			program.setLength(paginator.getPageSize());
		
			int allRow = logdao.findPageCount();
			//System.out.println(allRow);
			if(allRow==0){
				paginator.setData(0, null);
				return "success";
			}
			List<Log> logs=logdao.findLogList(program);
			//System.out.println(logs.get(0).getOperate());
			paginator.setData(allRow, logs);
			
			
			
			return "success";
		}
		catch (Exception e){
			e.printStackTrace();
			return "error";
		}
	}

}
