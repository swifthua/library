package com.bjpowernode.core.extend.hqlsearch.parse.impl;

import com.bjpowernode.core.common.hibernate.qbc.CriteriaQuery;
import com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil;
import com.bjpowernode.core.extend.hqlsearch.parse.IHqlParse;

public class DoubleParseImpl implements IHqlParse {

	
	public void addCriteria(CriteriaQuery cq, String name, Object value) {
		if (HqlGenerateUtil.isNotEmpty(value))
			cq.eq(name, value);
	}

	
	public void addCriteria(CriteriaQuery cq, String name, Object value,
			String beginValue, String endValue) {
		if (HqlGenerateUtil.isNotEmpty(beginValue)) {
			cq.ge(name, Double.parseDouble(beginValue));
		}
		if (HqlGenerateUtil.isNotEmpty(endValue)) {
			cq.le(name, Double.parseDouble(endValue));
		}
		if (HqlGenerateUtil.isNotEmpty(value)) {
			cq.eq(name, value);
		}
	}

}
