<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<div id="menuLinks" class="ceil">
	<table class="tabStyle1">
			<tr>
				<td>ID</td>
				<td>${product.id}</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>${product.name}</td>
			</tr>
			<tr>
				<td>Price</td>
				<td>${product.price}</td>
			</tr>
			<tr>
				<td>Description</td>
				<td>${product.description}</td>
			</tr>
				<c:forEach items="${product.details}" var="details">
					<tr>
						<td>${details.key}</td>
						<td>${details.value}</td>
					</tr>
				</c:forEach>
	</table>
</div>
<div id="menuLinks" class="ceil">
	<table>
		<c:forEach items="${menuLinks.links}" var="link">
			<tr>
				<td>${link}</td>
			</tr>
		</c:forEach>	
	</table>	
</div>