<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<div id="formCategory" class="ceil">
	<table class="tabStyle1">
		<tr>
			<td><a href="/mongo/admin/products/addProduct">ADD NEW PRODUCT</a></td>
		</tr>
		<tr>
			<th>NAME</th><th>COUNT</th><th></th><th></th><th></th>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.name}</td>
				<td>${product.count}</td>
				<td><a href="/mongo/admin/products/showProduct/${ product.name }">SHOW DETAILS</a></td>
				<td><a href="/mongo/admin/products/deleteProduct/${ product.name }">DELETE</a></td>
				<td><a href="/mongo/admin/products/editProduct/${ product.name }">EDIT</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div id="formMenuLinks" class="ceil">
	<table class="tabStyle1">
		<c:forEach items="${menuLinks}" var="menuLink">
			<tr>
				<td>${menuLink.category}</td>
				<td><a href="/mongo/admin/products/deleteMenuLinks/${ menuLink.category }">DELETE</a></td>
				<td><a href="/mongo/admin/products/editMenuLinks/${ menuLink.category }">EDIT</a></td>
				<c:forEach items="${menuLink.links}" var="links" varStatus="vs">
					<td>${links}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</div>