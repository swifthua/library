<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>借阅表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript" src="plug-in/ckeditor_new/ckeditor.js"></script>
  <script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
  <script type="text/javascript">
  //编写自定义JS代码
  </script>
 </head>
 <body>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tBLendController.do?doUpdate" tiptype="4">
					<input id="id" name="id" type="hidden" value="${tBLendPage.id }">
		<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="right">
							<label class="Validform_label">
								isbn:
							</label>
						</td>
						<td class="value" nowrap><input name="bookid" type="hidden" value="${id}" id="bookid"> <input name="isbn" class="inputxt" value="${tBLendPage.isbn }" id="isbn"
				readonly="readonly" datatype="*" /> <t:choose hiddenName="bookid" hiddenid="id" url="tBLendController.do?book" name="bookList" icon="icon-search" title="图书列表" textname="isbn,bookname,author" isclear="true"></t:choose>
			<span class="Validform_checktip"></span></td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								书名:
							</label>
						</td>
						<td class="value">
						     	 <input id="bookname" readonly="readonly" name="bookname" type="text" style="width: 150px" class="inputxt"  
									               
									                 value='${tBLendPage.bookname}'>
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
						     	 <input id="author" readonly="readonly" name="author" type="text" style="width: 150px" class="inputxt"  
									               
									                 value='${tBLendPage.author}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">作者</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								读者编号:
							</label>
						</td>
							<td class="value" nowrap> <input name="userName" class="inputxt" value="${tBLendPage.userName }" id="userName"
				readonly="readonly" datatype="*" /> <t:choose hiddenName="userid" hiddenid="id" url="tBLendController.do?user" name="userList" icon="icon-search" title="读者列表" textname="userName,realName" isclear="true"></t:choose>
			<span class="Validform_checktip"></span></td>
					</tr>
					<tr>
						<td align="right">
							<label class="Validform_label">
								读者姓名:
							</label>
						</td>
						<td class="value">
						     	 <input id="realName" readonly="readonly" name="realName" type="text" style="width: 150px" class="inputxt"  
									               
									                 value='${tBLendPage.realName}'>
							<span class="Validform_checktip"></span>
							<label class="Validform_label" style="display: none;">读者姓名</label>
						</td>
					</tr>
					
			</table>
		</t:formvalid>
 </body>
  <script src = "webpage/com/buss/lend/tBLend.js"></script>		