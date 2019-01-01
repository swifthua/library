package com.bjpowernode.web.buss.service.impl;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bjpowernode.core.common.service.impl.CommonServiceImpl;
import com.bjpowernode.web.buss.entity.base.TBLendEntity;
import com.bjpowernode.web.buss.service.TBLendServiceI;

@Service("tBLendService")
@Transactional
public class TBLendServiceImpl extends CommonServiceImpl implements TBLendServiceI {

	
 	public <T> void delete(T entity) {
 		super.delete(entity);
 		//执行删除操作配置的sql增强
		this.doDelSql((TBLendEntity)entity);
 	}
 	
 	public <T> Serializable save(T entity) {
 		Serializable t = super.save(entity);
 		//执行新增操作配置的sql增强
 		this.doAddSql((TBLendEntity)entity);
 		return t;
 	}
 	
 	public <T> void saveOrUpdate(T entity) {
 		super.saveOrUpdate(entity);
 		//执行更新操作配置的sql增强
 		this.doUpdateSql((TBLendEntity)entity);
 	}
 	
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(TBLendEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(TBLendEntity t){
	 	return true;
 	}
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(TBLendEntity t){
	 	return true;
 	}
 	
 	public int findLendCount(TBLendEntity t){
 		String hql = "from TBLendEntity tbl where tbl.userName='" + t.getUserName() + "'";
 		List<TBLendEntity> tbLends =  super.findByQueryString(hql);
 		return tbLends.size();
 	}
 	
 	/**
	 * 替换sql中的变量
	 * @param sql
	 * @return
	 */
 	public String replaceVal(String sql,TBLendEntity t){
 		sql  = sql.replace("#{id}",String.valueOf(t.getId()));
 		sql  = sql.replace("#{bookid}",String.valueOf(t.getBookid()));
 		sql  = sql.replace("#{bookname}",String.valueOf(t.getBookname()));
 		sql  = sql.replace("#{author}",String.valueOf(t.getAuthor()));
 		sql  = sql.replace("#{isbn}",String.valueOf(t.getIsbn()));
 		sql  = sql.replace("#{userid}",String.valueOf(t.getUserid()));
 		sql  = sql.replace("#{realname}",String.valueOf(t.getRealName()));
 		sql  = sql.replace("#{lenddate}",String.valueOf(t.getLenddate()));
 		sql  = sql.replace("#{returndate}",String.valueOf(t.getReturndate()));
 		sql  = sql.replace("#{debit}",String.valueOf(t.getDebit()));
 		sql  = sql.replace("#{totalcount}",String.valueOf(t.getTotalcount()));
 		sql  = sql.replace("#{status}",String.valueOf(t.getStatus()));
 		sql  = sql.replace("#{username}",String.valueOf(t.getUserName()));
 		sql  = sql.replace("#{UUID}",UUID.randomUUID().toString());
 		return sql;
 	}
}