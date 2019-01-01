<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>图书表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript" src="plug-in/ckeditor_new/ckeditor.js"></script>
  <script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tBBookController.do?doUpdate" tiptype="4">
					<input id="id" name="id" type="hidden" value="${tBBookPage.id }">
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								书名:
							</label>
						</td>
						<td class="value">
						     	 <input id="bookname"  datatype="s1-30" name="bookname" type="text" style="width: 150px" class="inputxt"  
									                 value='${tBBookPage.bookname}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">书名</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								作者:
							</label>
						</td>
						<td class="value">
						     	 <input id="author" name="author" type="text" style="width: 150px" class="inputxt"  
									                datatype="s1-20"
									                 value='${tBBookPage.author}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">作者</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								分类:
							</label>
						</td>
						<td class="value">
							<t:dictSelect field="booktype" defaultVal="${tBBookPage.booktype}" typeGroupCode="booktype" hasLabel="false" ></t:dictSelect>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">分类</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								isbn:
							</label>
						</td>
						<td class="value">
						     	 <input id="isbn" name="isbn" type="text" style="width: 150px" class="inputxt"  
									                datatype="s1-30"
									                 value='${tBBookPage.isbn}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">isbn</label>
						</td>
					</tr>
					<tr>
				<td align="right"><label class="Validform_label">
						出版社名称: </label></td>
				<td class="value" nowrap><input name="pressid" type="hidden"
					value="${tBBookPage.id}" id="pressid"> <input name="pressname"
					class="inputxt" value="${tBBookPage.pressname}" id="pressname"
					readonly="readonly" datatype="*" /> <t:choose hiddenName="pressid"
						hiddenid="id" url="tBBookController.do?press" name="pressList"
						icon="icon-search" title="出版社列表" textname="pressname"
						isclear="true"></t:choose> <span class="Validform_checktip"></span></td>
			</tr>
			</table>
		</t:formvalid>
 </body>
  <script src = "webpage/com/buss/book/tBBook.js"></script>		