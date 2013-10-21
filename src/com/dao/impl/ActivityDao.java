package com.dao.impl;

import java.util.List;

import com.bean.Activity;

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
}
