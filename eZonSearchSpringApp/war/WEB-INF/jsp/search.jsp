<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<html>
<head>
<title>eZon Search Utility</title>
 <style>
    .error { color: red; font-family:Arial,Helvetica,sans-serif;}
    .header{color:orange; font-family: Arial, Helvetica, sans-serif;font-weight: bold;}
    .resultheader{color:green;font-size: 1.2em;font-family: Arial, Helvetica, sans-serif;font-weight: bold;}
    .blinkytext {
     font-family: Arial, Helvetica, sans-serif;
     font-size: 1.2em;
     text-decoration: blink;
     font-style: normal;
     color: blue;     
 }
  </style>  
</head>
<body>
<h2 class="header">eZon Search Utility</h2>
<h3 class="blinkytext">Powered By Spring Web MVC Framework</h3>
	<form method="GET" action="search" name="searchform">

		<table width="50%" cellspacing="1" cellpadding="0" id="table1">
			<tr>
			<td class="error">
				<c:if test="${model.error != null}">
					<img height="15px" src="error.png"/> <c:out value="${model.error}"/>
				</c:if>
				<br><br>
				</td>
			</tr>
			<tr>
				<td>&nbsp;Enter Search Text:</td>
				<td><input type="text"
					value='<c:out value="${model.keyword}"/>' id="kw" name="kw">
				</td>
			</tr>

			<tr height="30Px">
				<td>&nbsp;Select an Option:</td>
				<td>
				<c:choose>
				<c:when test="${model.option=='eBay'}">
				<input type="radio" name="option" value="eBay" checked>eBay
				</c:when>
				<c:otherwise>
				<input type="radio" name="option" value="eBay">eBay
				</c:otherwise>
				</c:choose>				
				&nbsp;&nbsp;
				<c:choose>
				<c:when test="${model.option=='amazon'}">
				<input type="radio" name="option" value="amazon" checked>amazon</td>
				</c:when>
				<c:otherwise>
				<input type="radio" name="option" value="amazon">amazon</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>

		<p>
			<input type="Submit" value="Submit" name="Submit"> <input
				type="reset" value="Reset" name="B2">
		</p>

	</form>

	<c:if test="${!empty model.itemList}">
	<font class="resultheader">Search Results for "<c:out value="${model.keyword}"/>" in <c:out value="${model.option}"/></font>
	<br/><br/>
		<table BORDERCOLOR=orange border=1 width="100%">
			<tr>
				<td ALIGN="center">Item ID</td>
				<td ALIGN="center">Item Image</td>
				<td ALIGN="center">Item Title</td>
			</tr>
			<c:forEach items="${model.itemList}" var="item">

				<tr>
					<td><a target="_blank" href='<c:out value="${item.viewItemUrl}" />'><c:out value="${item.itemID}" /></a>
					</td>
					<td align="center" height="90px" width="90px"><img align="middle" height="80px" width="80px" src='<c:out value="${item.itemImage}"/>'>
					</td>
					<td><a target="_blank" href='<c:out value="${item.viewItemUrl}" />'><c:out value="${item.itemTitle}" /></a>
					</td>

				</tr>
				


			</c:forEach>

</table>
			</c:if>
</body>
</html>