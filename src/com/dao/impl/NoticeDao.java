package com.dao.impl;

import com.bean.Notice;

public class NoticeDao {

	/**����Ҫչʾ�Ĺ���*/
	public Notice findShowNotice() throws Exception
	{
		return (Notice)SqlMap.getSqlMapClient().queryForObject("findShowNotice");
	}
}
