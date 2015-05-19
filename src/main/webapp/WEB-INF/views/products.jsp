<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
	<div id="search">
		<div id="search-container" class="row">
			<div>
				<div class="facetss">
					<div class="facet-container">
						<form class="filter-sec facets search filters" action="search" method="post">
							<p class="show-all">
								<a href="#">Show All Products</a>
							</p>
							<div class="browsenodefacet">
								<div class="row">
									<h4 class="facet-title" onclick="facetToggle(this, 'bn')">Browse Categories
										<span class="plus"></span>
									</h4>
									<ul class="bn_facet facet_panel" id="bn_facet_panel">
										<c:forEach items="${categories}" var="category" varStatus="vs">
											<c:if test="${currentCategory == category && not empty currentCategory}">
												<li class="level-1 current_node">
													<a href="<%=request.getContextPath()%>/${category}">
														<span class="minus"></span>
														<span class="width1">${category}</span>
														<span class="count">(${countByCategories[vs.index]})</span>
													</a>
												</li>
											</c:if>
											<c:if test="${currentCategory != category}">
												<li class="level-1">
													<a href="<%=request.getContextPath()%>/${category}">
														<span class="plus"></span>
														<span class="width1">${category}</span>
														<span class="count">(${countByCategories[vs.index]})</span>
													</a>
												</li>
											</c:if>
											<c:if test="${currentCategory == category}">
												<c:forEach items="${accessories[vs.index]}" var="accessory" varStatus="vs2">
													<p class="level-2">
														<a href="<%=request.getContextPath()%>/${category}/${accessory}">
															<span class="width2">${accessory}</span>
															<span class="count">(${countAccessoriesByCategories.get(category).get(accessory)})</span>
														</a>
													</p>
												</c:forEach>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
							<c:if test="${not empty brands}">
								<div class="MS-or-facet">
									<h4 class="facet-title" onclick="facetToggle(this, 'make')">
										Brand
										<span class="plus"></span>
									</h4>
									<div id="make_facet_panel" class="facet_panel">
										<div class="facet-input-search">
											<input id="make_serach" type="text" placeholder="Search Brand">
											<span class="facet-search-icon glyphicon glyphicon-search"></span>
										</div>
										<div id="make-input-control" class="input-control contentHolder always-visible ps-container ps-active-y">
											<c:forEach items="${brands}" var="brand">
												<div class="content nav enabled unselected noajax">
													<input class="nav checkbox" type="checkbox">
													<a href="${currentCategory}/${brand}">${brand}</a>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:if>
						</form>
					</div>
				</div>
				<div id="searchCont">
					<form class="summary-facets search-filters">
						<div class="search-summary">
							<h1 id=search-cata-gtm>
								<c:if test="${not empty search_term}">
									<span id="search-term-gtm">"${search_term}"</span>
									in
								</c:if>
								<span class="cat">${currentCategory}</span>
							</h1>
							<p class="summary">Showing ${count} results</p>
							<ul class="selected-facets breadcrumb">
							
							</ul>
							<ul class="nav nav-tabs">
								<span>Sort By</span>
								<li class="active" onclick="activeLi(this)">
									<input name="sort" value="relevance" type="radio" checked="" style="display:none">
									<a href="<%=request.getContextPath()%>/${currentCategory}/search?sort=relevance">Best Match</a>
								</li>
								<li onclick="activeLi(this)">
									<input name="sort" value="asc" type="radio" style="display:none">
									<a href="<%=request.getContextPath()%>/${currentCategory}/search?sort=asc">Low Price</a>
								</li>
								<li onclick="activeLi(this)">
									<input name="sort" value="desc" type="radio" style="display:none">
									<a href="<%=request.getContextPath()%>/${currentCategory}/search?sort=desc">High Price</a>
								</li>
							</ul>
						</div>
					</form>
					<div id="results-wrapper">
						<div id="resultPane">
							<div class="resultsrow row">
								<!-- div class="page_no">Page no: 2</div-->
								<c:forEach items="${products}" var="product">
									<div class="search-icon">
										<div class="thumbnail">
											<div class="product-img">
												<a href="${category}/${product.name}">
													<img src="<%=request.getContextPath()%>${product.product_img}" title="${product.name}" alt="${product.name}" class="img-responsive">
												</a>
											</div>
											<div class="product-content">
												<div class="p-tag">
													
												</div>
												<div class="title">
													<a href="${category}/${product.name}" title="${product.name}">${product.name}</a>
												</div>
												<div class="price">
													<span class="final-price">
														<span class="c-inr">Rs.</span>
														 ${product.final_price}
													</span>
													<span class="scratch">${product.price}</span>
													<span class="discount">${product.discount}% OFF</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="shop-wrapper">
							<a id="load-next-set" class="scroll-load">Load more products</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="" class="scrollup" style="display: block;"></a>
	</div>
<script>	       
$(document).ready(function(){
$('.contentHolder').perfectScrollbar({suppressScrollX: true});
	if ((width <= 480)) {
		$(".facet_panel").hide();
	}		
	if (width <= 480) {
		$(".facets").hide();
	}
	else{
		$('.facetss').stick_in_parent();
	}
});
</script>