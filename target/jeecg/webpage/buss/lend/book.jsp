<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>图书集合</title>
<t:base type="jquery,easyui,tools"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid name="bookList" title="按isbn选择" actionUrl="tBLendController.do?datagridBook" idField="id" queryMode="single" checkbox="false" showRefresh="true">
	<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	<t:dgCol title="图书名称" hidden="true" field="bookname" query="true" queryMode="single" width="50"></t:dgCol>
	<t:dgCol title="图书作者" hidden="true" field="author" query="true" queryMode="single" width="50"></t:dgCol>
	<t:dgCol title="isbn" hidden="true" field="isbn" query="true" queryMode="single" width="50"></t:dgCol>
</t:datagrid>
</body>
</html>
