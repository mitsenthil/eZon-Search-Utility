<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title></title>
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.jcarousel.css" />
	<link rel="stylesheet" type="text/css" href="css/skin.css" />
	<script type="text/javascript">
	$(document).ready(function () {
		
		//jCarousel Plugin
	    $('#carousel').jcarousel({
			vertical: true,
			scroll: 1,
			auto: 2,
			wrap: 'last',
			initCallback: mycarousel_initCallback
	   	});

	//Front page Carousel - Initial Setup
   	$('div#slideshow-carousel a img').css({'opacity': '0.5'});
   	$('div#slideshow-carousel a img:first').css({'opacity': '1.0'});
   	$('div#slideshow-carousel li a:first').append('<span class="arrow"></span>')

  
  	//Combine jCarousel with Image Display
    $('div#slideshow-carousel li a').hover(
       	function () {
        		
       		if (!$(this).has('span').length) {
        		$('div#slideshow-carousel li a img').stop(true, true).css({'opacity': '0.5'});
   	    		$(this).stop(true, true).children('img').css({'opacity': '1.0'});
       		}		
       	},
       	function () {
        		
       		$('div#slideshow-carousel li a img').stop(true, true).css({'opacity': '0.5'});
       		$('div#slideshow-carousel li a').each(function () {

       			if ($(this).has('span').length) $(this).children('img').css({'opacity': '1.0'});

       		});
        		
       	}
	).click(function () {

	      	$('span.arrow').remove();        
		$(this).append('<span class="arrow"></span>');
       	$('div#slideshow-main li').removeClass('active');        
       	$('div#slideshow-main li.' + $(this).attr('rel')).addClass('active');	
        	
       	return false;
	});


});


//Carousel Tweaking

function mycarousel_initCallback(carousel) {
	
	// Pause autoscrolling if the user moves with the cursor over the clip.
	carousel.clip.hover(function() {
		carousel.stopAuto();
	}, function() {
		carousel.startAuto();
	});
}
	
	</script>
	<style>
/* Slide Show */
body {
	font-family:arial;	
}

img {
	border:0;
}

#slideshow-main {
	width:300px; 
	float:left; 
	margin-right:3px;
}

#slideshow-main ul {
	margin:0; 
	padding:0; 
	width:300px;
}

#slideshow-main li {
	width:300px; 
	height:300px; 
	display:none;
	position:relative;
}

#slideshow-main li.active {
	display:block !important;
}

#slideshow-main li span.opacity {
	position:absolute;
	bottom:0; left:0;
	display:block; 
	width:100%;
	height:60px;
	background:#000;
	filter:alpha(opacity=50); 
	-moz-opacity:0.5; 
	-khtml-opacity: 0.5; 
	opacity: 0.5;
	z-index:500;
}

#slideshow-main li span.content {
	position:absolute;
	bottom:0; left:0;
	display:block; 
	width:100%;
	height:60px;
	z-index:1000;
}

#slideshow-main li span.content h1 {
	font-size:14px;
	margin:5px 0;
	padding:0 10px;;
	color:#42e2e8;
}

#slideshow-main li span.content p {
	font-size:11px;
	margin:5px 0;
	padding:0 10px;;
	color:#42e2e8;
}

#slideshow-carousel {
	float:left; 
	width:100px;
	position:relative
}

#slideshow-carousel ul {
	margin:0; 
	padding:0;
	list-style:none;
}

#slideshow-carousel li {
	background:#fff; 
	height:100px; 
	position:relative
}

#slideshow-carousel li .arrow {
	left:3px; 
	top:28px; 
	position:absolute; 
	width:20px; 
	height:40px; 
	background:url(images/arrow_white.png) no-repeat 0 0; 
	display:block;
}

#slideshow-carousel li a {
	background:#000; 
	display:block; 
	width:100px; 
	height:100px;
}


#slideshow-carousel .active {
	filter:alpha(opacity=100); 
	-moz-opacity:1.0; 
	-khtml-opacity: 1.0; 
	opacity: 1.0;
}

#slideshow-carousel .faded {
	filter:alpha(opacity=50); 
	-moz-opacity:0.5; 
	-khtml-opacity: 0.5; 
	opacity: 0.5;
}

.whiteText{
	color:white;
	font-weight: bold;
}

.whiteLineThru{
	text-decoration: line-through;
	color:white;
	font-weight: bold;
}


	</style>
	
</head>


<body>


	<div id="welcomeHero">			
		<div id="slideshow-main">
			<ul>
			<%
				int i = 1;
			%>
				<c:forEach items="${dealsList}" var="deals">
					<%
						if (i == 1) {
					%>
					<li class="p1 active"><a target="_blank"
						href='<c:out value="${deals.dealURL}"/>'> <img
							style="border: 1px solid grey;"
							src='<c:out value="${deals.imgURL}"/>' width="300" height="300"
							alt='<c:out value="${deals.title}" />'/> <span class="opacity"></span> <span class="content"><h1>
									<c:out value="${deals.title}" />
								</h1>
								<p>
									Original Price:<span class="whiteLineThru">$<c:out
											value="${deals.originalPrice}" />
									</span> Current Price:<span class="whiteText">$<c:out
											value="${deals.currentPrice}" />
									</span><span class="whiteText""> Savings:<c:out
											value="${deals.savings}" />
									</span>
								</p>
						</span> </a></li>
					<%
						} else {
					%>
					<li class='<c:out value="${deals.cssClassName}"/>'><a
						target="_blank" href='<c:out value="${deals.dealURL}"/>'> <img
							style="border: 1px solid grey;"
							src='<c:out value="${deals.imgURL}"/>' width="300" height="300"
							alt='<c:out value="${deals.title}" />' /> <span class="opacity"></span> <span class="content"><h1>
									<c:out value="${deals.title}" />
								</h1>
								<p>
									Original Price:<span class="whiteLineThru">$<c:out
											value="${deals.originalPrice}" />
									</span> Current Price:<span class="whiteText">$<c:out
											value="${deals.currentPrice}" />
									</span><span class="whiteText""> Savings:<c:out
											value="${deals.savings}" />
									</span>
								</p>
						</span> </a></li>
					<%
						}
					%>
					<%
						i++;
					%>
				</c:forEach>
			</ul>										
		</div>
				
		<div id="slideshow-carousel">				
			  <ul id="carousel" class="jcarousel jcarousel-skin-tango">
			  <c:forEach items="${dealsList}" var="deal">
				<li>
					<a href="#" rel='<c:out value="${deal.cssClassName}"/>'>
					<img style="border:1px solid grey;" alt='<c:out value="${deals.title}" />' src='<c:out value="${deal.imgURL}"/>' width="98" height="100" alt="#"/>
					</a>
					
				</li>
				</c:forEach>
			  </ul>
		</div>
		
		<div class="clear"></div>
		
	</div>


</body>
</html>