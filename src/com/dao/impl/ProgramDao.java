package com.dao.impl;

import java.util.List;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**����������Ŀ*/
	public List<Program> findLastWeekPro(String date) throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findLastWeekPro",date);
	}
	/**���ұ�����Ŀ*/
	public List<Program> findThisWeekPro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisWeekPro",pageProgram);
	}
	
}
