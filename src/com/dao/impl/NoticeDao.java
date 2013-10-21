package com.dao.impl;

import com.bean.Notice;

public class NoticeDao {

	/**查找要展示的公告*/
	public Notice findShowNotice() throws Exception
	{
		return (Notice)SqlMap.getSqlMapClient().queryForObject("findShowNotice");
	}
}
