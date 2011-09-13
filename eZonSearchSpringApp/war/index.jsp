<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<html>
<head>
<style>
.error {
	color: red;
	font-family: Arial, Helvetica, sans-serif;
}

.header {
	color: maroon;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}

.blinkytext {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 1.2em;
	text-decoration: blink;
	font-style: normal;
	color: magenta;
}

.goldRate {
	float: left;
	width: 50%;
}

.currency {
	float: right;
	width: 50%; /* Width of the box - may or may not be necessary*/
	margin: 0 0 0 0;
	/* positions the box next to the other. This will have to be adjusted 

depending on the LeftBox.*/
}
</style>

<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> -->
<script type="text/javascript">
	function getXMLObject() //XML OBJECT
	{
		var xmlHttp = false;
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
		} catch (e) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") // For Microsoft IE 6.0+
			} catch (e2) {
				xmlHttp = false // No Browser accepts the XMLHTTP Object then false
			}
		}
		if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
			xmlHttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
		}
		return xmlHttp; // Mandatory Statement returning the ajax object created
	}

	var xmlhttp = new getXMLObject();

	function ajaxFunction() {
		var getdate = new Date();
		if (xmlhttp) {
			xmlhttp.open("GET", "getGoldRates?" + getdate.getTime(), true);
			xmlhttp.onreadystatechange = handleServerResponse;
			xmlhttp.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xmlhttp.send();
		}
	}

	function handleServerResponse() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				var data = xmlhttp.responseText;
				document.getElementById("goldrates").innerHTML = data;
			} else {
				alert("Error during AJAX call. Please try again");
			}
		}
	}
	/* function ajaxFunction() {
		/* var getdate = new Date();
		alert("inside getrate");
		$.get(
				"getGoldRates?"+ getdate.getTime(),
			    function(data) { alert(data);
			    document.getElementById("goldrates").innerHTML=data; 
				}
			);
			alert("inside ajax getrate");
		$.ajax({			
			   type: "GET",
			   url: "getGoldRates",
			    async: false,
		        cache: false,
			   success: function(msg){
			     alert( "Data Saved: " + msg );
			     document.getElementById("goldrates").innerHTML=msg;
			   }
			 });
		
	} */
</script>
<style type="text/css">
/* pushes the page to the full capacity of the viewing area */
html {height:100%;}
body {height:100%; margin:0; padding:0;}
/* prepares the background image to full capacity of the viewing area */
#bg {position:fixed; top:0; left:0; width:100%; height:100%;}
/* places the content ontop of the background image */
#content {position:relative; z-index:1;}
</style>
<!--[if IE 6]>
<style type="text/css">
/* some css fixes for IE browsers */
html {overflow-y:hidden;}
body {overflow-y:auto;}
#bg {position:absolute; z-index:-1;}
#content {position:static;}
</style>
<![endif]-->
</head>
<%-- <c:redirect url="/search.html"/> --%>
<body style="padding-left: 5px">
<div id="bg"><img src="blue.jpg" width="100%" height="100%" alt=""></div>
<div id="content">
	 <p>
		<a href="/index.jsp"><img height="35px" border="0" src="eZon.png"/></a>
		<span class="header">Search Utility</span>
	</p>


	<h3 class="blinkytext">Get Gold Rates and Currency Conversion!!!</h3>
	<form method="GET" action="search" name="searchform">

		<table width="50%" cellspacing="1" cellpadding="0" id="table1">

			<tr>
				<td>&nbsp;Enter Search Text:</td>
				<td><input type="text"
					value='<c:out value="${model.keyword}"></c:out>' id="kw" name="kw">
				</td>
			</tr>

			<tr height="30Px">
				<td>&nbsp;Select an Option:</td>
				<td><input type="radio" checked="checked" name="option" value="eBay">eBay&nbsp;&nbsp;
					<input type="radio" name="option" value="amazon">amazon</td>
			</tr>
		</table>

		<p>
			<input type="Submit" value="Submit" name="Submit"> <input
				type="reset" value="Reset" name="B2">
		</p>

	</form>
	<div>
	<h4 class="header">Ebay Deals Widget (Powered from:http://deals.ebay.com/feeds/xml)</h4>
	<div style="text-align:center;">
	<iframe height="310" width="420" frameborder="0"  scrolling="no" src="/ebayDealsWidget"></iframe>
	</div>
	</div>
	<br />
	<div class="goldRate">
		<h4 class="header">
			Get Gold Rates
			</h4>
			<input type="button" value="Click to get Gold Rates"
				onclick="ajaxFunction()" />
			<div id="goldrates"></div>
	</div>

	<div align="center" class="currency" id="currency">
		<h4 class="header">
			Currency Convertor
			</h4>
			<iframe
				src="http://www.google.com/finance/converter?a=1&from=USD&to=INR"
				width="255" height="150" frameborder="0" scrolling="no"> </iframe>
	</div>
</div>	
</body>
</html>