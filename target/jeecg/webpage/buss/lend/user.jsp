<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>用户集合</title>
<t:base type="jquery,easyui,tools"></t:base>
</head>
<body style="overflow-y: hidden" scroll="no">
<t:datagrid name="userList" title="按读者选择" actionUrl="tBLendController.do?datagridUser" idField="id" queryMode="single" checkbox="false" showRefresh="true">
	<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	<t:dgCol title="用户编号" hidden="true" field="userName" query="true" queryMode="single" width="50"></t:dgCol>
	<t:dgCol title="用户姓名" hidden="true" field="realName" query="true" queryMode="single" width="50"></t:dgCol>
</t:datagrid>
</body>
</html>
