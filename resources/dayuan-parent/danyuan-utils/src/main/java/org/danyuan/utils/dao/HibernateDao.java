package org.danyuan.utils.dao;

import java.util.List;

/**
 * 文件名 ： HibernateDao.java
 * 包 名 ： org.eastone.utils.dao
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年2月21日 下午1:32:10
 * 版 本 ： V1.0
 */
public interface HibernateDao<T> {
	
	public void save(T t, String hibernatePropertPath);
	
	public void saveOrUpdate(T t, String hibernatePropertPath);
	
	public List<T> getObject(String hql, String hibernatePropertPath, int[] rownum);
	
	public List<String> getStringList(String hql, String hibernatePropertPath, int[] rownum);
	
	public Integer getInteger(String hql, String hibernatePropertPath);
	
	public T getUnionObject(String hql, String hibernatePropertPath);
	
	public Object UnionObject(String hql, String hibernatePropertPath);
	
	public void delete(T t, String hibernatePropertPath);
	
	public void delete(String hql, String hibernatePropertPath);
	
	public int update(String hql, String hibernatePropertPath);
}
