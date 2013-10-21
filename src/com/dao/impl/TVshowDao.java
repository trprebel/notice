package com.dao.impl;

import com.bean.ShowType;

public class TVshowDao {

	/**查找显示类型*/
	public ShowType	findShowType() throws Exception{
		return (ShowType) SqlMap.getSqlMapClient().queryForObject("findShowType");
	}
}
