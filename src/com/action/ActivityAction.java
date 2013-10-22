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

/**�չʾ��ز���
 * @author zxj
 * 2013-10-21
 */
public class ActivityAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private String activityid;
	private String activitytitle;
	private File picture;   //�����ϴ����ļ�
	private String pictureContentType;	 //�����ϴ����ļ�����
	private String pictureFileName;   //�����ϴ����ļ���
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
			RecordLog.recordlog("�����"+activitytitle);
			int id=activityDao.findLastActivity(activitytitle);
			for (String path : imagepath) {
				Activity activity=new Activity();
				activity.setActivityid(id);
				activity.setImgpath(path);
				activityDao.addimage(activity);
				RecordLog.recordlog("Ϊ�"+activitytitle+"��ӻͼƬ"+path);
			}
			
			messages="�����ɹ���";
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

			//���ϴ����ļ������ɵ��������������
			//���ж����ɵ��ļ����Ƿ��Ѿ�����
			//������ڣ���������������������ֱ���Ҵ�ûʹ�õ������Ϊֹ
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
			RecordLog.recordlog("��IDΪ"+activityid+"�Ļ��Ϊ��ʾ���");
			
			addresult="���óɹ���";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			addresult="����ʧ�ܣ�";
		}
		return "addresult";
	}

}
