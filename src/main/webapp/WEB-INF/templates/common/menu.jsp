<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<div id="shop-navigation">
	<div class="mainli non-active">
		<a href="#">ALL STORES</a>
	</div>
	<div class="mainMenu animated slideInLeft" id="menucontents">
		<ul class="menu">
			<c:forEach items="${categories}" var="category" varStatus="vs">
			<li class="menuLink">
					<div class="store">
						<span>${category}</span>
						<div class="subMenu">
							<div class="fly-out-board">
								<div class="fly-out">
									<div class="fly-out-div">
										<div class="nav-unit">
											<div class="title">
												<span class="mtitle">
													<a class="trackMenu" href="<%=request.getContextPath()%>/${category}">${category}</a>
												</span>
											</div>
											<c:forEach items="${menuLinks[vs.index]}" var="menuLink" varStatus="vs2">
												<div class="sub-unit">
													<div class="sub-item">
														<h5>
															<a href="<%=request.getContextPath()%>/${category}" class="trackMenu">${links[vs.index].links[vs2.index]}</a>
														</h5>
														<ul>
															<c:forEach items="${menuLink}" var="link">
																<li>
																	<a class="trackMenu" href="<%=request.getContextPath()%>/${category}/?${links[vs.index].links[vs2.index]}=${link}">${link}</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="nav-unit">
											<div class="title">
												<span class="mtitle">
													<a class="trackMenu" href="<%=request.getContextPath()%>/accessories/${category}">${category} Accessories</a>
												</span>
											</div>
											<c:forEach items="${accessories[vs.index]}" var="menuLinkAccessories">
												<div class="sub-unit">
													<div class="sub-item">
														<ul>
															<c:forEach items="${menuLinkAccessories}" var="linkAccessory">
																<li>
																	<a class="trackMenu" href="<%=request.getContextPath()%>/${category}?accessory=${linkAccessory}">${linkAccessory}</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="menu-links">
	<div class="top-links">
		<ul class="shop-nav">
			<li>
				<a href="#">
					MOBILE
					<br>
					BRANDS
				</a>
			</li>
			<li>
				<a href="#">
					CLEARANCE
					<br>
					SALE
				</a>
			</li>
			<li>
				<a href="#">
					COUPONS &amp;
					<br>
					OFFERS
				</a>
			</li>
			<li>
				<a href="#">
					SAMSUNG
					<br>
					GALAXY S6
				</a>
			</li>
		</ul>
	</div>
</div>