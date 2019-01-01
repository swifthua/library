package com.bjpowernode.web.buss.controller;
import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bjpowernode.core.common.controller.BaseController;
import com.bjpowernode.core.common.exception.BusinessException;
import com.bjpowernode.core.common.hibernate.qbc.CriteriaQuery;
import com.bjpowernode.core.common.model.json.AjaxJson;
import com.bjpowernode.core.common.model.json.DataGrid;
import com.bjpowernode.core.constant.Globals;
import com.bjpowernode.core.util.DataUtils;
import com.bjpowernode.core.util.MyBeanUtils;
import com.bjpowernode.core.util.ResourceUtil;
import com.bjpowernode.core.util.StringUtil;
import com.bjpowernode.tag.core.easyui.TagUtil;
import com.bjpowernode.web.buss.entity.base.TBBookEntity;
import com.bjpowernode.web.buss.entity.base.TBLendEntity;
import com.bjpowernode.web.buss.service.TBLendServiceI;
import com.bjpowernode.web.system.pojo.base.TSBaseUser;
import com.bjpowernode.web.system.pojo.base.TSUser;
import com.bjpowernode.web.system.service.SystemService;


/**   
 * @Title: Controller
 * @Description: 借阅表
 * @author onlineGenerator
 * @date 2014-04-21 13:17:53
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tBLendController")
public class TBLendController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TBLendController.class);

	@Autowired
	private TBLendServiceI tBLendService;
	@Autowired
	private SystemService systemService;


	/**
	 * 借阅表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tBLend")
	public ModelAndView tBLend(HttpServletRequest request) {
		return new ModelAndView("buss/lend/tBLendList");
	}

	/**
	 * 图书表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "book")
	public ModelAndView press(HttpServletRequest request) {
		return new ModelAndView("buss/lend/book");
	}
	
	/**
	 * 图书显示列表
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 */
	@RequestMapping(params = "datagridBook")
	public void datagridBook(TBBookEntity tbBook, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TBBookEntity.class, dataGrid);
		tbBook.setStatus(Globals.BOOK_RETURN);
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbBook, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 图书表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "user")
	public ModelAndView user(HttpServletRequest request) {
		return new ModelAndView("buss/lend/user");
	}
	
	/**
	 * 图书显示列表
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 */
	@RequestMapping(params = "datagridUser")
	public void datagridUser(TSBaseUser tsBaseUser, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TSBaseUser.class, dataGrid);
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tsBaseUser, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(TBLendEntity tBLend,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		TSUser user = ResourceUtil.getSessionUserName();
		if(!(Globals.ADMIN_ID.equals(user.getId()) || Globals.LIBRARYER_ID.equals(user.getId()))){
			tBLend.setUserName(user.getUserName());
		}
		CriteriaQuery cq = new CriteriaQuery(TBLendEntity.class, dataGrid);
		//查询条件组装器
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tBLend, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.tBLendService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除借阅表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(TBLendEntity tBLend, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tBLend = systemService.getEntity(TBLendEntity.class, tBLend.getId());
		String message = "借阅表删除成功";
		if(Globals.BOOK_RETURN.equals(tBLend.getStatus())){
			try{
				tBLendService.delete(tBLend);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}catch(Exception e){
				e.printStackTrace();
				message = "借阅表删除失败";
				throw new BusinessException(e.getMessage());
			}
		}else{
			message = "请先还书之后再进行删除操作";
		}
		
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除借阅表
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "借阅表删除成功";
		try{
			for(String id:ids.split(",")){
				TBLendEntity tBLend = systemService.getEntity(TBLendEntity.class, id);
				if(Globals.BOOK_RETURN.equals(tBLend.getStatus())){
					tBLendService.delete(tBLend);
					systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
				}else{
					message = "请先归还\"" + tBLend.getBookname() + "\"后再进行删除操作" ;
					break;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "借阅表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加借阅表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(TBLendEntity tBLend, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "借阅表添加成功";
		int lendCount = tBLendService.findLendCount(tBLend);
		if(lendCount > 1){
			message = "该用户超过最大借书量，每个用户最多只能借2本书";
		}else{
			try{
				tBLend.setDebit(BigDecimal.ZERO);
				tBLend.setLenddate(DataUtils.getDate());
				tBLend.setStatus(Globals.BOOK_LEND);
				tBLend.setTotalcount("1");
				TBBookEntity t = tBLendService.get(TBBookEntity.class, tBLend.getBookid());
				t.setStatus(Globals.BOOK_LEND);
				systemService.saveOrUpdate(t);
				tBLendService.save(tBLend);
				systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
			}catch(Exception e){
				e.printStackTrace();
				message = "借阅表添加失败";
				throw new BusinessException(e.getMessage());
			}
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新借阅表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(TBLendEntity tBLend, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "借阅表更新成功";
		TBLendEntity t = tBLendService.get(TBLendEntity.class, tBLend.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(tBLend, t);
			tBLendService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "借阅表更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 还书
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doReturn")
	@ResponseBody
	public AjaxJson doReturn(TBLendEntity tBLend, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "还书成功";
		TBLendEntity t = tBLendService.get(TBLendEntity.class, tBLend.getId());
		TSBaseUser tsbUser = systemService.findUniqueByProperty(TSBaseUser.class, "userName", t.getUserName());
		if(tsbUser.getDebit().compareTo(BigDecimal.ZERO) == -1){
			message = "读者有欠款，先归还欠款后再还书";
		}else{
			try {
				t.setStatus(Globals.BOOK_RETURN);
				t.setReturndate(DataUtils.getDate());
				
				TBBookEntity tBook = tBLendService.get(TBBookEntity.class, t.getBookid());
				tBook.setStatus(Globals.BOOK_RETURN);
				systemService.saveOrUpdate(tBook);
				tBLendService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "还书失败";
				throw new BusinessException(e.getMessage());
			}
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 续借
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doContinue")
	@ResponseBody
	public AjaxJson doContinue(TBLendEntity tBLend, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "续借更新成功";
		TBLendEntity t = tBLendService.get(TBLendEntity.class, tBLend.getId());
		int count = Integer.parseInt(t.getTotalcount());
		BigDecimal debit = t.getDebit();
		if(debit.compareTo(BigDecimal.ZERO) == -1){
			message = "已超出续借时间，账户有欠款，不能续借";
		}else{
			if(count <= 0){
				message = "已超过续借次数，不能再续借";
			}else{
				try {
					tBLend.setTotalcount(String.valueOf(--count));
					tBLend.setLenddate(DataUtils.getDate());
					MyBeanUtils.copyBeanNotNull2Bean(tBLend, t);
					tBLendService.saveOrUpdate(t);
					systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
				} catch (Exception e) {
					e.printStackTrace();
					message = "续借更新失败";
					throw new BusinessException(e.getMessage());
				}
			}
		}
		
		
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 借阅表新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(TBLendEntity tBLend, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBLend.getId())) {
			tBLend = tBLendService.getEntity(TBLendEntity.class, tBLend.getId());
			req.setAttribute("tBLendPage", tBLend);
		}
		return new ModelAndView("buss/lend/tBLend-add");
	}
	/**
	 * 借阅表编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(TBLendEntity tBLend, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBLend.getId())) {
			tBLend = tBLendService.getEntity(TBLendEntity.class, tBLend.getId());
			req.setAttribute("tBLendPage", tBLend);
		}
		return new ModelAndView("buss/lend/tBLend-update");
	}
}
