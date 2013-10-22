package com.dao.impl;

import java.util.List;

import com.bean.Notice;

public class NoticeDao {

	/**查找要展示的公告*/
	public Notice findShowNotice() throws Exception
	{
		return (Notice)SqlMap.getSqlMapClient().queryForObject("findShowNotice");
	}
	/**将所有公告都设置为不显示*/
	public void setAllNotShow() throws Exception 
	{
		SqlMap.getSqlMapClient().update("setAllNotShow");
	}
	/**发布公告*/
	public void createNotice(Notice notice) throws Exception 
	{
		SqlMap.getSqlMapClient().insert("createNotice",notice);
	}
	/**查找最近x条公告*/
	public List<Notice> findRecentNotice() throws Exception
	{
		return (List<Notice>) SqlMap.getSqlMapClient().queryForList("findRecentNotice");
	}
	/**通过ID设置显示的公告*/
	public void setShowById(int noticeid) throws Exception
	{
		SqlMap.getSqlMapClient().update("setShowById",noticeid);
	}
}
