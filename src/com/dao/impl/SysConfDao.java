package com.dao.impl;

import java.util.List;

import com.bean.Role;


public class SysConfDao {

	/**将所有类型设为不显示*/
	public void setAllTVShowNot() throws Exception
	{
		SqlMap.getSqlMapClient().update("setAllTVShowNot");
	}
	/**通过设置显示类型*/
	public void setTVShowByType(int showtype) throws Exception
	{
		SqlMap.getSqlMapClient().update("setTVShowByType",showtype);
	}
	/**查找所有角色*/
	public List<Role> findAllRole() throws Exception
	{
		return (List<Role>) SqlMap.getSqlMapClient().queryForList("findAllRole");
	}
	/**修改角色权限*/
	public void modifyRole(Role role) throws Exception
	{
		SqlMap.getSqlMapClient().update("modifyRole",role);
	}
}
