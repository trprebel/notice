package com.dao.impl;

import java.util.List;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**查找上周项目*/
	public List<Program> findLastWeekPro(String date) throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findLastWeekPro",date);
	}
	/**查找本周项目*/
	public List<Program> findThisWeekPro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisWeekPro",pageProgram);
	}
	
}
