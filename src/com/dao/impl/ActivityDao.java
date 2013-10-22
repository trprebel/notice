package com.dao.impl;

import java.util.List;

import com.bean.Activity;
import com.sun.accessibility.internal.resources.accessibility;

public class ActivityDao {

	/**查找显示的活动*/
	public Activity findShowActivity() throws Exception
	{
		return (Activity) SqlMap.getSqlMapClient().queryForObject("findShowActivity");
	}
	/**查找活动对应的图片*/
	public List<String> findActivityImgById(int activityid) throws Exception
	{
		return (List<String>) SqlMap.getSqlMapClient().queryForList("findActivityImgById",activityid);
	}
	/**将所有活动都设置为不显示*/
	public void setAllNotShow() throws Exception 
	{
		SqlMap.getSqlMapClient().update("setActivityAllNotShow");
	}
	/**发布活动*/
	public void createActivity(String activitytitle) throws Exception
	{
		SqlMap.getSqlMapClient().insert("createActivity",activitytitle);
	}
	/**查找最后添加的活动ID*/
	public Integer findLastActivity(String activitytitle) throws Exception
	{
		return (Integer)SqlMap.getSqlMapClient().queryForObject("findLastActivity",activitytitle);
	}
	/**添加活动对应的图片*/
	public void addimage(Activity activity) throws Exception
	{
		SqlMap.getSqlMapClient().insert("addimage",activity);
	}
	/**查找最近的X个活动*/
	public List<Activity> findRecentActivity() throws Exception
	{
		return (List<Activity>)SqlMap.getSqlMapClient().queryForList("findRecentActivity");
	}
	/**通过ID设置显示的活动*/
	public void setShowById(int activityid) throws Exception
	{
		SqlMap.getSqlMapClient().update("setShowActivityById",activityid);
	}
}
