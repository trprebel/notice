package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**查找上周项目*/
	public List<Program> findThisWeekAllPro() throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findThisWeekAllPro");
	}
	/**查找本周项目*/
	public List<Program> findThisWeekPagePro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisWeekPagePro",pageProgram);
	}
	/**查找本月重点事件*/
	public List<Program> findThisMonthEmphasisEve(Map<String, String> map) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisMonthEmphasisEve",map);
	}
	/**查找本周结项数*/
	public Integer findFinishCount(Map<String, String> map) throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findFinishCount",map);
	}
	/**查找本月重点追踪事件*/
	public Program findThisMonthTraceEve(int month) throws Exception{
		return (Program) SqlMap.getSqlMapClient().queryForObject("findThisTraceEve",month);
	}
	/**查找版本号*/
	public Integer findVersion() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findVersion");
	}
	
}
