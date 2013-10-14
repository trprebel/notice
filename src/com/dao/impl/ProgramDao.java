package com.dao.impl;

import java.util.List;

import com.bean.Program;

public class ProgramDao {

	/**根据上周项目*/
	public List<Program> findLastWeekPro(String date) throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findLastWeekPro",date);
	}
}
