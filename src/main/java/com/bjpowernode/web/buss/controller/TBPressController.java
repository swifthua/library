package com.bjpowernode.web.buss.controller;
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
import com.bjpowernode.core.util.MyBeanUtils;
import com.bjpowernode.core.util.StringUtil;
import com.bjpowernode.tag.core.easyui.TagUtil;
import com.bjpowernode.web.buss.entity.base.TBPressEntity;
import com.bjpowernode.web.buss.service.TBPressServiceI;
import com.bjpowernode.web.system.service.SystemService;


/**   
 * @Title: Controller
 * @Description: 出版社
 * @author onlineGenerator
 * @date 2014-04-16 09:57:16
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tBPressController")
public class TBPressController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TBPressController.class);

	@Autowired
	private TBPressServiceI tBPressService;
	@Autowired
	private SystemService systemService;


	/**
	 * 出版社列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tBPress")
	public ModelAndView tBPress(HttpServletRequest request) {
		return new ModelAndView("buss/press/tBPressList");
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
	public void datagrid(TBPressEntity tBPress,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TBPressEntity.class, dataGrid);
		//查询条件组装器
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tBPress, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.tBPressService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除出版社
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(TBPressEntity tBPress, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tBPress = systemService.getEntity(TBPressEntity.class, tBPress.getId());
		String message = "出版社删除成功";
		try{
			tBPressService.delete(tBPress);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "出版社删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除出版社
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "出版社删除成功";
		try{
			for(String id:ids.split(",")){
				TBPressEntity tBPress = systemService.getEntity(TBPressEntity.class, 
				id
				);
				tBPressService.delete(tBPress);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "出版社删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加出版社
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(TBPressEntity tBPress, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "出版社添加成功";
		try{
			tBPressService.save(tBPress);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "出版社添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新出版社
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(TBPressEntity tBPress, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "出版社更新成功";
		TBPressEntity t = tBPressService.get(TBPressEntity.class, tBPress.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(tBPress, t);
			tBPressService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "出版社更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 出版社新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(TBPressEntity tBPress, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBPress.getId())) {
			tBPress = tBPressService.getEntity(TBPressEntity.class, tBPress.getId());
			req.setAttribute("tBPressPage", tBPress);
		}
		return new ModelAndView("buss/press/tBPress-add");
	}
	/**
	 * 出版社编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(TBPressEntity tBPress, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBPress.getId())) {
			tBPress = tBPressService.getEntity(TBPressEntity.class, tBPress.getId());
			req.setAttribute("tBPressPage", tBPress);
		}
		return new ModelAndView("buss/press/tBPress-update");
	}
}
