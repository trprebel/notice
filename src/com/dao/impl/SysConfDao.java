package com.dao.impl;

import java.util.List;

import com.bean.Role;


public class SysConfDao {

	/**������������Ϊ����ʾ*/
	public void setAllTVShowNot() throws Exception
	{
		SqlMap.getSqlMapClient().update("setAllTVShowNot");
	}
	/**ͨ��������ʾ����*/
	public void setTVShowByType(int showtype) throws Exception
	{
		SqlMap.getSqlMapClient().update("setTVShowByType",showtype);
	}
	/**�������н�ɫ*/
	public List<Role> findAllRole() throws Exception
	{
		return (List<Role>) SqlMap.getSqlMapClient().queryForList("findAllRole");
	}
	/**�޸Ľ�ɫȨ��*/
	public void modifyRole(Role role) throws Exception
	{
		SqlMap.getSqlMapClient().update("modifyRole",role);
	}
}
