<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="submenu">
		<span class="active">
			<a href="<%=request.getContextPath()%>/${category}">${category}</a>
		</span>
		<span class=fishbone-arrow></span>
		<span class="active-options">		
			&nbsp;
			<c:forEach items="${series}" var="serie">
				<a href="<%=request.getContextPath()%>/${category}?Series=${serie}">${serie}</a>
				&nbsp;
				&nbsp;
				&nbsp;
			</c:forEach>
			&nbsp;
		</span>
	</div>
	<div id="detail_page">
		<div class="container">
			<div id="product-overview" class="row">
				<div class="breadcrumb-sdp">
					<a href="<%=request.getContextPath()%>/${category}">
						<span>${category}</span>
					</a>
					>
					<span class="active">${product.name}</span>
				</div>
				<div id="container_sdp" class="row">
					<div id="prod_img" class="top-margin">
						<div id="ib_img_viewer">
							<div class="slick-slider animated fadeIn">
								<c:forEach items="${product.images}" var="image">
									<div>
										<img class="img-responsive" src="${image}">
									</div>
								</c:forEach>
							</div>
							<div id="ib_img_thumb">
								<c:forEach items="${product.thumbnails}" var="thumbnail" varStatus="i">
									<div>
										<c:if test="${i.index == 0}">
											<img class="thumbs selectedThumb" src="${thumbnail}">
										</c:if>
										<c:if test="${i.index != 0}">
											<img class="thumbs" src="${thumbnail}">
										</c:if>
									</div>
								</c:forEach>
							</div>
							
						</div>
					</div>
					<div class="padding-left">
						<div id="title">
							<h1 class="product-title-big">${product.name}</h1>
						</div>
						<div id="rwc-wrapper">
							<div id="product-reviews-summary">
								<div id="review_and_rating_summary">
									<span class="rating-star">
										<img src="#" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="#" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="#" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="#" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="#" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
									</span>
									<span>
										(1)
										<span class="rating-gap right-margin"></span>
									</span>
									<a class="review-count right-margin" href="#">${product.comment_count}<span class="review-gap"> Reviews</span></a>
									<span id="write-review" class="right-margin">
										<img src="<%=request.getContextPath()%>/resources/common/img/product/write.png">
										<a class="write-reviews">Write-Review</a>
									</span>
								</div>
							</div>
							<div id="wish_list">
								<div id="wlist">
									<img id="wimage1" src="<%=request.getContextPath()%>/resources/common/img/product/wishlist1.png">
									<img id="wimage2" src="<%=request.getContextPath()%>/resources/common/img/product/wishlist2.png" style="display:none">
									<a id="add-to-wishlist" href="#">Add to WishList</a>
								</div>
							</div>
						</div>
						<div class="sdp-left-right-wrapper row">
							<div class="sdp-left">
								<div id="product-summary">
									<div id="pricing_summary" class="clearfix">
										<div id="sdp-price-details">
											<div class="pricing">
												<div class="row">
													<div id="base-price" class="linethrough">
														<span>R</span>
														<span class="price">${product.price}</span>
													</div>
												</div>
												<div class="row">
													<div id="price-after-discount">
														<span>R</span>
														<span class="price">${product.final_price}</span>
													</div>
													<div id="discounted-price">
														[
														<span>R</span>
														<span class="price">${product.price - product.final_price}</span>
														Off
														]
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="overview-gola-wrapper clearfix">
										<div id="product_overview">
											<c:if test="${product.count > 0}">
												<div class="status">In Stock</div>
											</c:if>
											<c:if test="${product.count == 0}">
												<div class="status  soldout">Out of Stock.</div>
											</c:if>
										</div>
									</div>
								</div>
								<div id="options-key-features-wrapper" class="clearfix">
									<div class="options-badgets-wrapper">
										<div id="catalog-options" class="clearfix">
											
										</div>
									</div>
								</div>
								<div class="key-features-div">
									<div class="key-features">
										<div class="key-features-ul clearfix" id="double">
											<span>
												Android 5.0 (Lollipop) 
												<img src="<%=request.getContextPath()%>/resources/common/img/product/double_slash.png">
											</span>
											<span>
												64-bit Octacore Processor 
												<img src="<%=request.getContextPath()%>/resources/common/img/product/double_slash.png">
											</span>
											<span>
												5MP Rear Camera 
												<img src="<%=request.getContextPath()%>/resources/common/img/product/double_slash.png">
											</span>
											<span>
												12.95 cm (5.1)Display Size 
												<img src="<%=request.getContextPath()%>/resources/common/img/product/double_slash.png">
											</span>
											<span>32GB/64GB Iternal Memmory</span>
										</div>
									</div>
								</div>
							</div>
							<div class="center_sdp_right">
								<div class="buy-now-wrapper">
									<div id="price-table">
										<div class="buy-box clearfix">
											<div id="ib_actions">
												<form name="AddItemToCart" action="<%=request.getContextPath()%>/addToCart" method="POST">
													<input type="hidden" name="id" value="${product.id}" id="id">
													<input type="hidden" name="name" value="${product.name}" id="name">
													<input type="hidden" name="price" value="${product.price}" id="price">
													<input type="hidden" name="finalPrice" value="${product.final_price}" id="finalPrice">
													<input type="hidden" name="discount" value="${product.discount}" id="discount">
													<input type="hidden" name="totalCount" value="${product.count}" id="totalCount">
													<input class="buyimg buy-image" type="submit" name="submit" value="Buy Now">
												</form>
											</div>
										</div>
									</div>
								</div>
								<div id="call-to-order">
									<div class="call-to-order vcard">
										<span class="call-head">Call to Order</span>
										<br>
										<span class="call-number tel">079 40 260 260</span>
									</div>
								</div>
								<div id="Delivery">
									<div class="delivery">
										<span class="shipping_duration">
											Ships in
											<b>1 - 2 Days</b>.
										</span>
										<br>
										<span class="delivery-content">
											<b>FREE</b>
											Shipping in Russia
											<br>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="left">
						<div id="ib_products">
							<ul id="ib_products_menu" class="nav nav-tabs">
								<li class="tab_title active" onclick="activeMenuItem(this, 1)">
									<a>Description</a>
								</li>
								<li class="tab_title" onclick="activeMenuItem(this, 2)">
									<a>Specifications</a>
								</li>
							</ul>
							<div class="tab-content">
								<div id="productDetails" class="tab-pane active see-less">
									<div class="description">
										<div class="catalog-desc">
											 ${product.description}   
											 <p>
											 <c:forEach items="${product.features}" var="feature">
											 	<br/>
											 	<br/>
											 	<strong>${feature.key}</strong>
											 	<br/>
											 	<br/>
											 	${feature.value}
											 </c:forEach>
											 </p> 
										</div>
									</div>
									<div class="overlay"></div>
									<div class="show-button">
										show
										<span class="more">more</span>
										<span class="less">less</span>
									</div>
								</div>
								<div id="productFeatures" class="tab-pane">
									<div id="specs">
										<div class="features-list">
											<table width="100%" cellspacing="1" cellpadding="4" border="0">
												<tbody>
												<c:forEach items="${product.details}" var="detail">
													<tr class="row">
														<td valign="top" class="tdcolor1">${detail.key}</td>
														<td class="tdcolor1" style="padding-left:15px;">${detail.value}</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div>
									<div class="sales-package">
										<h3>Sales Package</h3>
										<div class="features-list">
											<table border="0" cellspacing="1" cellpadding="4" width="100%">
												<tbody>
													<tr>
														<td>
															<ul>
																<c:forEach items="${product.sales_package}" var="item">
																	<li>${item}</li>
																</c:forEach>
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<c:if test="${not empty cookie.cust_name}">
									<div id="review-page-container">
										<div id="middle_writereview" class="write-review">
											<span class="mainTitle">Write a Review for
												<span>${product.name}</span>
											</span>
										<div style="height:10px;"></div>
											<f:form modelAttribute="comment" name="postReview" id="postReview" method="POST" action="">
												<f:hidden path="author" value="${cookie.cust_name.value}"/>
												<table width="100%" id="standardad">
													<tbody>
													<tr>
														<td valign="top">
															<div id="review-rating">
																<span class="form-rating-title">Rating : </span>
																	<img id="star1" class="star1" src="/images/stargray.gif" alt="" width="13" height="12" border="0" align="absmiddle" onmouseover="changeRateImage(1,1);" onmouseout="changeRateImage(0,1);setoldrating();" onclick="showSDPRatingReview_setRating(1);">
																	<img id="star2" class="star2" src="/images/stargray.gif" alt="" width="13" height="12" border="0" align="absmiddle" onmouseover="changeRateImage(1,2);" onmouseout="changeRateImage(0,2);setoldrating();" onclick="showSDPRatingReview_setRating(2);">
																	<img id="star3" class="star3" src="/images/stargray.gif" alt="" width="13" height="12" border="0" align="absmiddle" onmouseover="changeRateImage(1,3);" onmouseout="changeRateImage(0,3);setoldrating();" onclick="showSDPRatingReview_setRating(3);">
																	<img id="star4" class="star4" src="/images/stargray.gif" alt="" width="13" height="12" border="0" align="absmiddle" onmouseover="changeRateImage(1,4);" onmouseout="changeRateImage(0,4);setoldrating();" onclick="showSDPRatingReview_setRating(4);">
																	<img id="star5" class="star5" src="/images/stargray.gif" alt="" width="13" height="12" border="0" align="absmiddle" onmouseover="changeRateImage(1,5);" onmouseout="changeRateImage(0,5);setoldrating();" onclick="showSDPRatingReview_setRating(5);">
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="review-title-and-text">Review Title <span class="review-restrictions">(Limit 50 Characters)</span> </div><br>
															<f:input path="title" id="message_title" name="messageTitle" maxlength="50" value=""/>
														</td>
													</tr>
													<tr>
														<td>
															<div class="review-title-and-text">Review Text <span class="review-restrictions"> (Limit 50 to 2000 Characters)</span>
																<f:textarea path="text" cols="30" rows="3" id="message" name="message" maxlength="2000"></f:textarea>
																<span style="float:right;height:20px;">
																	<span class="remaining-characters-info" style="color: rgb(187, 187, 187);">Remaining characters: <span class="remaining-characters">2000</span></span><br>
																</span>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<input id="submit" type="submit" name="Submit" value="">
														</td>
													</tr>
												</tbody>
											</table>
										</f:form>
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div id="reviews-detail">
							<div class="row">
								<h2 class="tab_title col-md-6 col-sm-6 col-xs-12">
									<b>Samsung Galaxy S6 Review</b>
								</h2>
								<div id="avg-rating" class="col-md-6 col-md-6 col-sm-6 col-xs-12">
									<span><b> Average Rating : </b></span>
									<span class="rating-star">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										(4 Ratings)
									</span>
								</div>
							</div>
							<c:forEach items="${product.comments}" var="comment">
								<div class="review">
									<span class="reviewtitle">${comment.title}</span>
									<span class="rating-star">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
										<img src="/images/starred.gif" alt="Rating of 5 out of 5" width="13" height="12" border="0" align="absmiddle">
									</span>
									<br>By <b>${comment.author}</b>,
									<span class="easy-date">${comment.date}</span>
									<br>
									<p class="review-text">${comment.text}</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div id="side-outer-warp" class="right">
						<div id="similar_items_cont">
							<div class="similar_items_side animated fadeIn">
								<div class="similar-items">
									<h2>Products You May be Interested In</h2>
									<div id="similar-items-carousel">
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Samsung Galaxy Note 2 N7100 (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/fd/28/sizecomparisonrightlarge.png.8dfd28132c.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3c/fc/nokialumia925black.jpg.6c7f7f3cfc.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/ab/ae/gsmarena001.jpg.95abaeb79b.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
										<div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
											<div>
												<a href="#">
													<div class="align-center">
														<img src="http://catman-a2.infibeam.com/img/mobi/8841726/3e/10/q600clubscreen.png.933e10047a.999x140x120.jpg" border="0" alt="Xolo Q600 Club (White)" title="Xolo Q600 Club (White)">
													</div>
													<div class="align-center title">Xolo Q600 Club (White)</div>
													<div class="align-center price">
														<span>
															<span>R</span>
															<span>5,620</span>
														</span>
														<span class="scratch">
															<span>R</span>
															<span class="price">6,499</span>
														</span>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>