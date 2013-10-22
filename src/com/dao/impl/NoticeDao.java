package com.dao.impl;

import java.util.List;

import com.bean.Notice;

public class NoticeDao {

	/**����Ҫչʾ�Ĺ���*/
	public Notice findShowNotice() throws Exception
	{
		return (Notice)SqlMap.getSqlMapClient().queryForObject("findShowNotice");
	}
	/**�����й��涼����Ϊ����ʾ*/
	public void setAllNotShow() throws Exception 
	{
		SqlMap.getSqlMapClient().update("setAllNotShow");
	}
	/**��������*/
	public void createNotice(Notice notice) throws Exception 
	{
		SqlMap.getSqlMapClient().insert("createNotice",notice);
	}
	/**�������x������*/
	public List<Notice> findRecentNotice() throws Exception
	{
		return (List<Notice>) SqlMap.getSqlMapClient().queryForList("findRecentNotice");
	}
	/**ͨ��ID������ʾ�Ĺ���*/
	public void setShowById(int noticeid) throws Exception
	{
		SqlMap.getSqlMapClient().update("setShowById",noticeid);
	}
}
