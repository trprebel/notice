package com.dao.impl;

import com.bean.ShowType;

public class TVshowDao {

	/**������ʾ����*/
	public ShowType	findShowType() throws Exception{
		return (ShowType) SqlMap.getSqlMapClient().queryForObject("findShowType");
	}
}
