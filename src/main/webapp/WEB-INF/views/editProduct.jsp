<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<div id="formProduct" class="ceil">
	<f:form modelAttribute="product" action="saveProduct" method="post">
		<table>
			<f:hidden path="id" />
			<tr>
				<td>Name</td>
				<td><f:input path="name" /></td>
				<td><f:errors path="name" cssClass="errors"></f:errors></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><f:input path="price" /></td>
				<td><f:errors path="price" cssClass="errors"></f:errors></td>
			</tr>
			<tr>
				<td>Count</td>
				<td><f:input path="count" /></td>
				<td><f:errors path="count" cssClass="errors"></f:errors></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><f:textarea path="description" /></td>
				<td><f:errors path="description" cssClass="errors"></f:errors></td>
			</tr>
			<c:forEach items="${product.details}" var="details" varStatus="vs" begin="0">
				<tr class="count">
					<td><input name="${vs.index}" value="${details.key}">
					<td><f:input class="value" path="details[${details.key}]"/></td>
					<td><input type="button" class="del" onclick="del(this)" value="Delete attribute"></td>
				</tr>
			</c:forEach>
			<tr id="controls">
				<td><input type="button" id="add"  value="Add attribute"></td>
			</tr>
			<tr>
				<td><input type="submit" value="ADD / SAVE PRODUCT" /></td>
			</tr>
		</table>
	</f:form>
</div>