package com.bjpowernode.core.constant;

import com.bjpowernode.core.util.ResourceUtil;


/**  
* 项目名称：jeecg
* 类名称：Globals   
* 类描述：  全局变量定义
* 创建人：       
* @version    
*
 */
public final class Globals {
	/**
	 * 保存用户到SESSION
	 */
	public static String USER_SESSION="USER_SESSION";
	/**
	 * 人员类型
	 */
	public static Short User_Normal=1;//正常
	public static Short User_Forbidden=0;//禁用
	public static Short User_ADMIN=-1;//超级管理员
	/**
	 *日志级别定义
	 */
	public static Short Log_Leavel_INFO=1;
	public static Short Log_Leavel_WARRING=2;
	public static Short Log_Leavel_ERROR=3;
	 /**
	  * 日志类型
	  */
	 public static Short Log_Type_LOGIN=1; //登陆
	 public static Short Log_Type_EXIT=2;  //退出
	 public static Short Log_Type_INSERT=3; //插入
	 public static Short Log_Type_DEL=4; //删除
	 public static Short Log_Type_UPDATE=5; //更新
	 public static Short Log_Type_UPLOAD=6; //上传
	 public static Short Log_Type_OTHER=7; //其他
	 
	 
	 /**
	  * 词典分组定义
	  */
	 public static String TypeGroup_Database="database";//数据表分类
	 
	 /**
	  * 权限等级
	  */
	 public static Short Function_Leave_ONE=0;//一级权限
	 public static Short Function_Leave_TWO=1;//二级权限
	 
	 /**
	  * 权限等级前缀
	  */
	 public static String Function_Order_ONE="ofun";//一级权限
	 public static String Function_Order_TWO="tfun";//二级权限

	 /**
	  * 新闻法规
	  */
	 public static Short Document_NEW=0; //新建
	 public static Short Document_PUBLICH=0; //发布

	 /**
	  * 配置系统是否开启按钮权限控制
	  */
	 public static boolean BUTTON_AUTHORITY_CHECK = false;
	 static{
		 String button_authority_jeecg = ResourceUtil.getSessionattachmenttitle("button.authority.jeecg");
		 if("true".equals(button_authority_jeecg)){
			 BUTTON_AUTHORITY_CHECK = true;
		 }
	 }
	 
	 /**
	  * 图书状态
	  */
	 public static String BOOK_LEND = "1";
	 public static String BOOK_RETURN = "2";
	 public static String BOOK_DELAY = "3";
	 
	 public static String ADMIN_ID = "402881e5455f7eca01455f7f46290044";
	 public static String LIBRARYER_ID = "402881e545967ec0014596b086d70002";
	 public static String TYPEGROUP_ID = "402881e6456eb42d01456ecd039f0001";
	 public static String ROLE_ID = "402881e545893b020145893dc9310001";
}
