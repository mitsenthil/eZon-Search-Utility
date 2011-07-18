<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html>
<head>
 <style>
    .error { color: red; font-family:Arial,Helvetica,sans-serif; }
    .header{color:orange; font-family: Verdana,sans-serif;font-weight: bold;}
    .blinkytext {
     font-family: Arial, Helvetica, sans-serif;
     font-size: 1.2em;
     text-decoration: blink;
     font-style: normal;
     color: blue;
 }
  </style>
</head>
<%-- <c:redirect url="/search.html"/> --%>
<body>
<h2 class="header">eZon Search Utility</h2>
<h3 class="blinkytext">Powered By Spring Web MVC Framework</h3>
<form method="GET" action="search" name="searchform">

		<table width="50%" cellspacing="1" cellpadding="0" id="table1">
		
			<tr>
				<td>&nbsp;Enter Search Text:</td>
				<td><input type="text" value ='<c:out value="${model.keyword}"></c:out>' id="kw" name="kw">
				</td>
			</tr>

			<tr height="30Px">
				<td>&nbsp;Select an Option:</td>
				<td><input type="radio" name="option" value="eBay">eBay&nbsp;&nbsp;
				<input type="radio" name="option" value="amazon">amazon</td>
			</tr>
		</table>

		<p>
			<input type="Submit" value="Submit" name="Submit">
			 <input type="reset" value="Reset" name="B2">
		</p>

	</form>
	</body>
	</html>