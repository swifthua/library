package com.bjpowernode.web.buss.controller;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.batik.transcoder.Transcoder;
import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.JPEGTranscoder;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.fop.svg.PDFTranscoder;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bjpowernode.core.common.controller.BaseController;
import com.bjpowernode.core.common.exception.BusinessException;
import com.bjpowernode.core.common.hibernate.qbc.CriteriaQuery;
import com.bjpowernode.core.common.model.json.AjaxJson;
import com.bjpowernode.core.common.model.json.DataGrid;
import com.bjpowernode.core.common.model.json.Highchart;
import com.bjpowernode.core.constant.Globals;
import com.bjpowernode.core.util.ExceptionUtil;
import com.bjpowernode.core.util.MyBeanUtils;
import com.bjpowernode.core.util.StringUtil;
import com.bjpowernode.poi.excel.ExcelImportUtil;
import com.bjpowernode.poi.excel.entity.ImportParams;
import com.bjpowernode.tag.core.easyui.TagUtil;
import com.bjpowernode.web.buss.entity.base.TBBookEntity;
import com.bjpowernode.web.buss.entity.base.TBPressEntity;
import com.bjpowernode.web.buss.service.TBBookServiceI;
import com.bjpowernode.web.system.pojo.base.TSDepart;
import com.bjpowernode.web.system.pojo.base.TSType;
import com.bjpowernode.web.system.pojo.base.TSUser;
import com.bjpowernode.web.system.service.SystemService;


/**   
 * @Title: Controller
 * @Description: 图书表
 * @author onlineGenerator
 * @date 2014-04-16 09:51:39
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tBBookController")
public class TBBookController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TBBookController.class);

	@Autowired
	private TBBookServiceI tBBookService;
	@Autowired
	private SystemService systemService;


	/**
	 * 图书表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tBBook")
	public ModelAndView tBBook(HttpServletRequest request) {
		return new ModelAndView("buss/book/tBBookList");
	}

	/**
	 * 出版社表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "press")
	public ModelAndView press(HttpServletRequest request) {
		return new ModelAndView("buss/book/press");
	}
	
	/**
	 * 出版社显示列表
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 */
	@RequestMapping(params = "datagridPress")
	public void datagridPress(TBPressEntity tbPress, HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TBPressEntity.class, dataGrid);
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPress, request.getParameterMap());
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
	public void datagrid(TBBookEntity tBBook,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TBBookEntity.class, dataGrid);
		//查询条件组装器
		com.bjpowernode.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tBBook, request.getParameterMap());
		try{
		//自定义追加查询条件
		}catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
		cq.add();
		this.tBBookService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除图书表
	 * 
	 * @return
	 */
	@RequestMapping(params = "doDel")
	@ResponseBody
	public AjaxJson doDel(TBBookEntity tBBook, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tBBook = systemService.getEntity(TBBookEntity.class, tBBook.getId());
		String message = "图书表删除成功";
		try{
			tBBookService.delete(tBBook);
			systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "图书表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 批量删除图书表
	 * 
	 * @return
	 */
	 @RequestMapping(params = "doBatchDel")
	@ResponseBody
	public AjaxJson doBatchDel(String ids,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		String message = "图书表删除成功";
		try{
			for(String id:ids.split(",")){
				TBBookEntity tBBook = systemService.getEntity(TBBookEntity.class, 
				id
				);
				tBBookService.delete(tBBook);
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "图书表删除失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加图书表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doAdd")
	@ResponseBody
	public AjaxJson doAdd(TBBookEntity tBBook, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "图书表添加成功";
		try{
			tBBook.setStatus(Globals.BOOK_RETURN);
			tBBookService.save(tBBook);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}catch(Exception e){
			e.printStackTrace();
			message = "图书表添加失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	
	/**
	 * 更新图书表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "doUpdate")
	@ResponseBody
	public AjaxJson doUpdate(TBBookEntity tBBook, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String message = "图书表更新成功";
		TBBookEntity t = tBBookService.get(TBBookEntity.class, tBBook.getId());
		try {
			MyBeanUtils.copyBeanNotNull2Bean(tBBook, t);
			tBBookService.saveOrUpdate(t);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = "图书表更新失败";
			throw new BusinessException(e.getMessage());
		}
		j.setMsg(message);
		return j;
	}
	

	/**
	 * 图书表新增页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goAdd")
	public ModelAndView goAdd(TBBookEntity tBBook, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBBook.getId())) {
			tBBook = tBBookService.getEntity(TBBookEntity.class, tBBook.getId());
			req.setAttribute("tBBookPage", tBBook);
		}
		return new ModelAndView("buss/book/tBBook-add");
	}
	/**
	 * 图书表编辑页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "goUpdate")
	public ModelAndView goUpdate(TBBookEntity tBBook, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tBBook.getId())) {
			tBBook = tBBookService.getEntity(TBBookEntity.class, tBBook.getId());
			req.setAttribute("tBBookPage", tBBook);
		}
		return new ModelAndView("buss/book/tBBook-update");
	}
	
	/**
	 * 统计集合页面
	 * 
	 * @return
	 */
	@RequestMapping(params = "bookStatisticTabs")
	public ModelAndView bookStatisticTabs(HttpServletRequest request) {
		return new ModelAndView("buss/book/tBBookReport");
	}
	
	/**
	 * 报表数据生成
	 * 
	 * @return
	 */
	@RequestMapping(params = "bookCount")
	@ResponseBody
	public List<Highchart> bookCount(HttpServletRequest request,String reportType, HttpServletResponse response) {
		List<Highchart> list = new ArrayList<Highchart>();
		Highchart hc = new Highchart();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT booktype ,count(booktype) FROM TBBookEntity group by booktype");
		List bookTypeList = systemService.findByQueryString(sb.toString());
		Long count = systemService.getCountForJdbc("SELECT COUNT(1) FROM T_B_book WHERE 1=1");
		List lt = new ArrayList();
		hc = new Highchart();
		hc.setName("图书种类统计");
		hc.setType(reportType);
		Map<String, Object> map;
		String hql = "from TSType where typegroupid='" + Globals.TYPEGROUP_ID+ "'";
		List<TSType> typeList = systemService.findByQueryString(hql);
		Map<String, String> typeMap = new HashMap<String, String>();
		if(typeList.size() > 0){
			for(TSType type : typeList){
				typeMap.put(type.getTypecode(), type.getTypename());
			}
		}
		if (bookTypeList.size() > 0) {
			for (Object object : bookTypeList) {
				
				map = new HashMap<String, Object>();
				Object[] obj = (Object[]) object;
				map.put("name", typeMap.get(obj[0]));
				map.put("y", obj[1]);
				Long groupCount = (Long) obj[1];
				Double  percentage = 0.0;
				if (count != null && count.intValue() != 0) {
					percentage = new Double(groupCount)/count;
				}
				map.put("percentage", percentage*100);
				lt.add(map);
			}
		}
		hc.setData(lt);
		list.add(hc);
		return list;
	}
	
	/**
	 * 报表打印
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(params = "export")
	public void export(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String svg = request.getParameter("svg");
		String filename = request.getParameter("filename");

		filename = filename == null ? "chart" : filename;
		ServletOutputStream out = response.getOutputStream();
		try {
			if (null != type && null != svg) {
				svg = svg.replaceAll(":rect", "rect");
				String ext = "";
				Transcoder t = null;
				if (type.equals("image/png")) {
					ext = "png";
					t = new PNGTranscoder();
				} else if (type.equals("image/jpeg")) {
					ext = "jpg";
					t = new JPEGTranscoder();
				} else if (type.equals("application/pdf")) {
					ext = "pdf";
					t = (Transcoder) new PDFTranscoder();
				} else if (type.equals("image/svg+xml"))
					ext = "svg";
				response.addHeader("Content-Disposition",
						"attachment; filename=" + new String(filename.getBytes("GBK"),"ISO-8859-1") + "." + ext);
				response.addHeader("Content-Type", type);

				if (null != t) {
					TranscoderInput input = new TranscoderInput(
							new StringReader(svg));
					TranscoderOutput output = new TranscoderOutput(out);

					try {
						t.transcode(input, output);
					} catch (TranscoderException e) {
						out
								.print("Problem transcoding stream. See the web logs for more details.");
						e.printStackTrace();
					}
				} else if (ext.equals("svg")) {
					// out.print(svg);
					OutputStreamWriter writer = new OutputStreamWriter(out,
							"UTF-8");
					writer.append(svg);
					writer.close();
				} else
					out.print("Invalid type: " + type);
			} else {
				response.addHeader("Content-Type", "text/html");
				out
						.println("Usage:\n\tParameter [svg]: The DOM Element to be converted."
								+ "\n\tParameter [type]: The destination MIME type for the elment to be transcoded.");
			}
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}
	
	/**
	 * 图书导入
	 * 
	 * @return
	 */
	@RequestMapping(params = "upload")
	public ModelAndView upload(HttpServletRequest req) {
		return new ModelAndView("buss/book/bookUpload");
	}
	
	/**
	 * 图书导入
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "importExcel", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			ImportParams params = new ImportParams();
			try {
				List<TBBookEntity> listBooks = 
					(List<TBBookEntity>)ExcelImportUtil.importExcelByIs(file.getInputStream(),TBBookEntity.class,params);
				for (TBBookEntity book : listBooks) {
					if(book != null && book.getBookname() != null){
						book.setStatus(Globals.BOOK_RETURN);
						tBBookService.save(book);
					}
				}
				j.setMsg("文件导入成功！");
			} catch (Exception e) {
				j.setMsg("文件导入失败！");
				logger.error(ExceptionUtil.getExceptionMessage(e));
			}finally{
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return j;
	}
}
