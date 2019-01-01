package com.bjpowernode.web.buss.service;
import java.io.Serializable;

import com.bjpowernode.core.common.service.CommonService;
import com.bjpowernode.web.buss.entity.base.TBLendEntity;

public interface TBLendServiceI extends CommonService{
	
 	public <T> void delete(T entity);
 	
 	public <T> Serializable save(T entity);
 	
 	public <T> void saveOrUpdate(T entity);
 	
 	public int findLendCount(TBLendEntity t);
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(TBLendEntity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(TBLendEntity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(TBLendEntity t);
}
