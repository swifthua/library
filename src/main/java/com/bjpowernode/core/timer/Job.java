package com.bjpowernode.core.timer;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bjpowernode.core.constant.Globals;
import com.bjpowernode.core.util.DataUtils;
import com.bjpowernode.web.buss.entity.base.TBBookEntity;
import com.bjpowernode.web.buss.entity.base.TBLendEntity;
import com.bjpowernode.web.system.pojo.base.TSBaseUser;
import com.bjpowernode.web.system.service.SystemService;

@Component
public class Job {

	@Autowired
	private SystemService systemService;
 
    //@Scheduled(cron="0 */1 * * * *") 
    /**
     * 每天1点执行一次
     * */
	@Scheduled(cron="0 0 1 * * ?")  
    public void bookFee(){
        com.bjpowernode.core.util.LogUtil.info("扣费统计执行");
        String date = DataUtils.getSpecifiedDayAfter(DataUtils.getDate(), -30);
        String hql = "from TBLendEntity tbe where tbe.lenddate <'" + date + "' and tbe.status <>" + Globals.BOOK_RETURN;
        List<TBLendEntity> tbLendList = systemService.findByQueryString(hql);
        for(TBLendEntity tbLend : tbLendList){
        	TSBaseUser tsbUser = systemService.findUniqueByProperty(TSBaseUser.class, "userName", tbLend.getUserName());
        	TBBookEntity tBook = systemService.get(TBBookEntity.class, tbLend.getBookid());
			tBook.setStatus(Globals.BOOK_DELAY);
    		BigDecimal debit = tsbUser.getDebit().subtract(BigDecimal.ONE);
    		tbLend.setDebit(tbLend.getDebit().subtract(BigDecimal.ONE));
    		tbLend.setStatus(Globals.BOOK_DELAY);
    		tsbUser.setDebit(debit);
        	if(-1 == debit.compareTo(BigDecimal.ZERO)){
        		tsbUser.setStatus((short)0);
        	}
        	systemService.saveOrUpdate(tBook);
    		systemService.updateEntitie(tsbUser);
        	systemService.updateEntitie(tbLend);
        }
    }
    
    
    
}