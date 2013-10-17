package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.EWProgress;
import com.bean.ImportantPro;
import com.bean.Program;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
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
	/**查找本月重点追踪事件id,只要项目id*/
	public Integer findThisTraceEveNo(int month) throws Exception {
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findThisTraceEveNo",month);
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
	public Integer findUnFinishCount(PageProgram pageProgram) throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findUnFinishCount",pageProgram);
	}
	/**根据ID查找项目*/
	public Program findProgramById(int proid) throws Exception {
		return (Program) SqlMap.getSqlMapClient().queryForObject("findProgramById",proid);
	}
	/**添加本周进展*/
	public void addWeekProgress(EWProgress ewProgress) throws Exception {
		SqlMap.getSqlMapClient().insert("addWeekProgress",ewProgress);
	}
	/**修改项目*/
	public void modifyProgram(Program program) throws Exception{
		SqlMap.getSqlMapClient().update("modifyProgram", program);
	}
	/**添加重点项目，一次添加3个月，以防重点项目目没有改变*/
	public void addImportantPro(ImportantPro pro) throws Exception{
		SqlMap.getSqlMapClient().update("addImportantPro",pro);
	}
	
}
