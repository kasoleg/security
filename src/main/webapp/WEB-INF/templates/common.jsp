<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/common/css/site.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/common/css/slick.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/slick.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/site.js" ></script>
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<nav id="navigation">
		<tiles:insertAttribute name="menu" />
	</nav>
	<div id="body">
		<div id="shop-page">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>