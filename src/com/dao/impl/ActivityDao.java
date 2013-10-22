package com.dao.impl;

import java.util.List;

import com.bean.Activity;

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
}
