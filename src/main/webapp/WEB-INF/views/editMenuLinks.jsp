<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<div id="menuLinks" class="ceil">
	<f:form modelAttribute="menuLinks" action="saveMenuLinks" method="post">
		<f:hidden path="id"/>
		<f:hidden path="category"/>
		<table>
			<tr>
				<td>${menuLinks.category}</td>
			</tr>
			<c:forEach items="${menuLinks.links}" var="links" varStatus="vs">
				<tr class="count">
					<td><f:input class="menu" path="links[${vs.index}]" /></td>
					<td><input type="button" class="delMenuLink" onclick="delMenuLink(this)" value="Delete attribute"></td>
				</tr>
			</c:forEach>
			<tr id="controls">
				<td><input type="button" id="addMenuLink"  value="Add attribute"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Save links for ${menuLinks.category}" /></td>
			</tr>
		</table>
	</f:form>	
</div>