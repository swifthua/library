<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tBBookList" checkbox="true" fitColumns="false" title="图书表" actionUrl="tBBookController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="主键"  field="id"  hidden="false"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="书名"  field="bookname"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="作者"  field="author"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="分类"  field="booktype" dictionary="bookType" hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="isbn"  field="isbn"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="出版社名称"  field="pressname"  hidden="true"  queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="状态"  field="status" dictionary="bookstatus"  hidden="true" query="true" queryMode="single"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tBBookController.do?doDel&id={id}" operationCode="bookDel"/>
   <t:dgToolBar title="录入" icon="icon-add" url="tBBookController.do?goAdd" funname="add" operationCode="bookAdd"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tBBookController.do?goUpdate" funname="update" operationCode="bookUp"></t:dgToolBar>
   <t:dgToolBar title="批量删除"  icon="icon-remove" url="tBBookController.do?doBatchDel" funname="deleteALLSelect" operationCode="bookBatchDel"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tBBookController.do?goUpdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="导入Excel" icon="icon-search" onclick="bookListImportXls()"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 function bookListImportXls() {
		openuploadwin('Excel导入', 'tBBookController.do?upload', "tBBookList");
	}
 </script>