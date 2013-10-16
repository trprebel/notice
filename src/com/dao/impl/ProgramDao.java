package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**查找所有未结项的项目*/
	public List<Program> findAllUnFinishPro() throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findAllUnFinishPro");
	}
	/**查找分页后未结项的项目*/
	public List<Program> findUnFinishPagePro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findUnFinishPagePro",pageProgram);
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
	/**创建项目*/
	public void createProgram(Program program) throws Exception
	{
		SqlMap.getSqlMapClient().insert("createProgram",program);
	}
	/**查找未完成项目数量*/
	public Integer findUnFinishCount() throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findUnFinishCount");
	}
	
}
