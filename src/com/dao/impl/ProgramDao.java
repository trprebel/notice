package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**����������Ŀ*/
	public List<Program> findThisWeekAllPro() throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findThisWeekAllPro");
	}
	/**���ұ�����Ŀ*/
	public List<Program> findThisWeekPagePro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisWeekPagePro",pageProgram);
	}
	/**���ұ����ص��¼�*/
	public List<Program> findThisMonthEmphasisEve(Map<String, String> map) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findThisMonthEmphasisEve",map);
	}
	/**���ұ��ܽ�����*/
	public Integer findFinishCount(Map<String, String> map) throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findFinishCount",map);
	}
	/**���ұ����ص�׷���¼�*/
	public Program findThisMonthTraceEve(int month) throws Exception{
		return (Program) SqlMap.getSqlMapClient().queryForObject("findThisTraceEve",month);
	}
	/**���Ұ汾��*/
	public Integer findVersion() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findVersion");
	}
	
}
