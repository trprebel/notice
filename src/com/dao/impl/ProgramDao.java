package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.Program;
import com.util.PageProgram;

public class ProgramDao {

	/**��������δ�������Ŀ*/
	public List<Program> findAllUnFinishPro() throws Exception
	{
		return (List<Program>) SqlMap.getSqlMapClient().queryForList("findAllUnFinishPro");
	}
	/**���ҷ�ҳ��δ�������Ŀ*/
	public List<Program> findUnFinishPagePro(PageProgram pageProgram) throws Exception
	{
		return (List<Program>)SqlMap.getSqlMapClient().queryForList("findUnFinishPagePro",pageProgram);
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
	/**������Ŀ*/
	public void createProgram(Program program) throws Exception
	{
		SqlMap.getSqlMapClient().insert("createProgram",program);
	}
	/**����δ�����Ŀ����*/
	public Integer findUnFinishCount() throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findUnFinishCount");
	}
	
}
