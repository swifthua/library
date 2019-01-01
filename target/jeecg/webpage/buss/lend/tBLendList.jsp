<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tBLendList" checkbox="true" fitColumns="false" title="借阅表" actionUrl="tBLendController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="图书id"  field="bookid"  hidden="false"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="书名"  field="bookname"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="作者"  field="author"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="isbn"  field="isbn"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="读者编号"  field="userName"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="读者id"  field="userid"  hidden="false"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="读者姓名"  field="realname"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="借阅时间"  field="lenddate" formatter="yyyy-MM-dd" hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="归还时间"  field="returndate" formatter="yyyy-MM-dd" hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="扣款"  field="debit"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="续借次数"  field="totalcount"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="状态"  field="status" dictionary="bookstatus" hidden="true" query="true"  queryMode="single"  width="120"></t:dgCol>
   
   <t:dgCol title="操作" field="opt" width="130"></t:dgCol>
   <t:dgDelOpt title="删除" url="tBLendController.do?doDel&id={id}" operationCode="lendDel"/>
   <t:dgConfOpt url="tBLendController.do?doContinue&id={id}" message="确认续借？" title="续借" exp="status#eq#1"/>
   <t:dgConfOpt url="tBLendController.do?doReturn&id={id}" message="确认还书？" title="还书" exp="status#ne#2" operationCode="return"/>
   <t:dgToolBar title="录入" icon="icon-add" url="tBLendController.do?goAdd" funname="add" operationCode="lendAdd"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tBLendController.do?goUpdate" funname="update" operationCode="lendUpdate"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="tBLendController.do?doBatchDel" funname="deleteALLSelect" operationCode="lendAllDel"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tBLendController.do?goUpdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script src = "webpage/com/buss/lend/tBLendList.js"></script>		
 <script type="text/javascript">
 $(document).ready(function(){
 		//给时间控件加上样式
 			$("#tBLendListtb").find("input[name='lenddate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 			$("#tBLendListtb").find("input[name='returndate']").attr("class","Wdate").attr("style","height:20px;width:90px;").click(function(){WdatePicker({dateFmt:'yyyy-MM-dd'});});
 });
 </script>