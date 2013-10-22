package com.dao.impl;

import java.util.List;

import com.bean.Activity;
import com.sun.accessibility.internal.resources.accessibility;

public class ActivityDao {

	/**������ʾ�Ļ*/
	public Activity findShowActivity() throws Exception
	{
		return (Activity) SqlMap.getSqlMapClient().queryForObject("findShowActivity");
	}
	/**���һ��Ӧ��ͼƬ*/
	public List<String> findActivityImgById(int activityid) throws Exception
	{
		return (List<String>) SqlMap.getSqlMapClient().queryForList("findActivityImgById",activityid);
	}
	/**�����л������Ϊ����ʾ*/
	public void setAllNotShow() throws Exception 
	{
		SqlMap.getSqlMapClient().update("setActivityAllNotShow");
	}
	/**�����*/
	public void createActivity(String activitytitle) throws Exception
	{
		SqlMap.getSqlMapClient().insert("createActivity",activitytitle);
	}
	/**���������ӵĻID*/
	public Integer findLastActivity(String activitytitle) throws Exception
	{
		return (Integer)SqlMap.getSqlMapClient().queryForObject("findLastActivity",activitytitle);
	}
	/**��ӻ��Ӧ��ͼƬ*/
	public void addimage(Activity activity) throws Exception
	{
		SqlMap.getSqlMapClient().insert("addimage",activity);
	}
	/**���������X���*/
	public List<Activity> findRecentActivity() throws Exception
	{
		return (List<Activity>)SqlMap.getSqlMapClient().queryForList("findRecentActivity");
	}
	/**ͨ��ID������ʾ�Ļ*/
	public void setShowById(int activityid) throws Exception
	{
		SqlMap.getSqlMapClient().update("setShowActivityById",activityid);
	}
}
