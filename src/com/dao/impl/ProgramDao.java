package com.dao.impl;

import java.util.List;
import java.util.Map;

import com.bean.EWProgress;
import com.bean.ImportantPro;
import com.bean.Program;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
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
	/**���ұ����ص�׷���¼�id,ֻҪ��Ŀid*/
	public Integer findThisTraceEveNo(int month) throws Exception {
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findThisTraceEveNo",month);
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
	public Integer findUnFinishCount(PageProgram pageProgram) throws Exception
	{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findUnFinishCount",pageProgram);
	}
	/**����ID������Ŀ*/
	public Program findProgramById(int proid) throws Exception {
		return (Program) SqlMap.getSqlMapClient().queryForObject("findProgramById",proid);
	}
	/**��ӱ��ܽ�չ*/
	public void addWeekProgress(EWProgress ewProgress) throws Exception {
		SqlMap.getSqlMapClient().insert("addWeekProgress",ewProgress);
	}
	/**�޸���Ŀ*/
	public void modifyProgram(Program program) throws Exception{
		SqlMap.getSqlMapClient().update("modifyProgram", program);
	}
	/**����ص���Ŀ��һ�����3���£��Է��ص���ĿĿû�иı�*/
	public void addImportantPro(ImportantPro pro) throws Exception{
		SqlMap.getSqlMapClient().update("addImportantPro",pro);
	}
	
}
