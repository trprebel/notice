package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.bean.Activity;
import com.bean.Notice;
import com.dao.impl.ActivityDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.RecordLog;

import filter.StringUtil;

/**活动展示相关操作
 * @author zxj
 * 2013-10-21
 */
public class ActivityAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private String activityid;
	private String activitytitle;
	private File picture;   //保存上传的文件
	private String pictureContentType;	 //保存上传的文件类型
	private String pictureFileName;   //保存上传的文件名
	private ActivityDao activityDao=new ActivityDao();
	private List<String> imagepath;
	private String addresult;
	public String messages;

	public String getActivityid() {
		return activityid;
	}
	public void setActivityid(String activityid) {
		this.activityid = activityid;
	}
	public String getActivitytitle() {
		return activitytitle;
	}
	public void setActivitytitle(String activitytitle) {
		this.activitytitle = activitytitle;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public String getPictureContentType() {
		return pictureContentType;
	}
	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}
	public String getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	public List<String> getImagepath() {
		return imagepath;
	}
	public void setImagepath(List<String> imagepath) {
		this.imagepath = imagepath;
	}
	public String getAddresult() {
		return addresult;
	}
	public void setAddresult(String addresult) {
		this.addresult = addresult;
	}
	public void activity() {
		try {
			Activity activity=activityDao.findShowActivity();
			//System.out.println(activity.getTitle());
			List<String> paths=activityDao.findActivityImgById(activity.getActivityid());
			//activity.setImages(paths);
			
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
	public String create()
	{
		try {
			activityDao.setAllNotShow();
			//System.out.println(imagepath.get(0));
			//System.out.println(imagepath.get(1));
			activityDao.createActivity(activitytitle);
			RecordLog.recordlog("创建活动"+activitytitle);
			int id=activityDao.findLastActivity(activitytitle);
			for (String path : imagepath) {
				Activity activity=new Activity();
				activity.setActivityid(id);
				activity.setImgpath(path);
				activityDao.addimage(activity);
				RecordLog.recordlog("为活动"+activitytitle+"添加活动图片"+path);
			}
			
			messages="发布成功！";
			return "request";
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
			List<Activity> activities=activityDao.findRecentActivity();
			request.setAttribute("activities", activities);
			//System.out.println(activities.get(0).getTitle());
			return "activitylist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public void picture()
	{
		try {


			//StringUtil.getSpPropeurl("imagePath");
			String uploadPath=StringUtil.getSpPropeurl("imagePath");

			String filename = pictureFileName; 
			Random random = new Random();

			//把上传的文件用生成的随机数重新命名
			//并判断生成的文件名是否已经存在
			//如果存在，则继续生成随机数命名，直到找打还没使用的随机数为止
			String dbfilename="images/"+random.nextLong()+ filename.substring(filename.lastIndexOf("."));
			filename = uploadPath + dbfilename;

			while (new File(filename).exists()) {
				dbfilename="images/"+random.nextLong()+ filename.substring(filename.lastIndexOf("."));
				filename = uploadPath + dbfilename;
			}

			//System.out.println(dbfilename);
			FileOutputStream fos = new FileOutputStream(filename);
			//System.out.println(filename);
			InputStream is = new FileInputStream(picture);
			try
			{

				byte[] buffer = new byte[4*1024];
				int count = 0;
				while ((count = is.read(buffer)) > 0) {
					fos.write(buffer, 0, count);
				}
				//System.out.println(filename);
				
				
			  	PrintWriter out =  ServletActionContext.getResponse().getWriter();
			  	out.write(dbfilename);
			  	out.flush();
			  	out.close();

			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally
			{
				fos.close();
				is.close();
			}
			


		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public String addshow()
	{
		try {
			//System.out.println(noticeid);
			activityDao.setAllNotShow();
			activityDao.setShowById(Integer.parseInt(activityid));
			RecordLog.recordlog("将ID为"+activityid+"的活动设为显示活动！");
			
			addresult="设置成功！";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addresult="设置失败！";
		}
		return "addresult";
	}

}
