<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>出版社集合</title>
<t:base type="jquery,easyui,tools"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid name="pressList" title="按出版社选择" actionUrl="tBBookController.do?datagridPress" idField="id" queryMode="single" checkbox="false" showRefresh="true">
	<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	<t:dgCol title="出版社名称" hidden="true" field="pressname" query="true" queryMode="single" width="50"></t:dgCol>
</t:datagrid>
</body>
</html>
