<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>出版社</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript" src="plug-in/ckeditor_new/ckeditor.js"></script>
  <script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tBPressController.do?doAdd" tiptype="4">
					<input id="id" name="id" type="hidden" value="${tBPressPage.id }">
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							出版社名称:
						</label>
					</td>
					<td class="value">
					     	 <input id="pressname" name="pressname" type="text" style="width: 150px" class="inputxt"  
								               datatype="s2-20"
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">出版社名称</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出版社地址:
						</label>
					</td>
					<td class="value">
					     	 <input id="pressaddr" name="pressaddr" type="text" style="width: 150px" class="inputxt"  
								               datatype="s2-30"
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">出版社地址</label>
						</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出版社电话:
						</label>
					</td>
					<td class="value">
					     	 <input id="presstel" name="presstel" type="text" style="width: 150px" class="inputxt"  
								               datatype="n10-14"
								               >
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">出版社电话</label>
						</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
  <script src = "webpage/com/buss/press/tBPress.js"></script>		