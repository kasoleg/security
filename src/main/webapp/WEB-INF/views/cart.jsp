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
	<div id="main-cart-page">
		<div class="container">
			<div class="row">
				<div id="shopping-cart-tab">
					<h2 id="shopping-cart-title" class="shoppingcart-tabs selected">
						<a href="#">
							<c:if test="${count != 0 && not empty count}">
								SHOPPING CART(${count})
							</c:if>
							<c:if test="${count == 0 || empty count}">
								SHOPPING CART
							</c:if>
							<img src="<%=request.getContextPath()%>/resources/common/img/cart/tab-pointer.png" class="arrow_head1">
						</a>
					</h2>
				</div>
			</div>
			<div id="shopping-cart-section" class="cart-page-section selected">
				<c:if test="${not empty products}">
					<form name="UpdateCart" id="updateCart" action="#" method="POST">
						<div class="row">
							<div id="product-list">
								<c:forEach items="${products}" var="product">
									<div class="product-item row">
										<div class="image-area img-responsive">
											<a href="#">
												<img src="http://catman-a2.infibeam.com/img/mobi/8841726/77/12/commonsmg920f001frontwhite.jpeg.057712a60b.999x120x120.jpg" border="0" alt="Samsung Galaxy S6 (White) (32GB)" class="img-responsive">
											</a>
										</div> 
										<div class="cart-text">
											<div class="row">
												<div class="title-area">
													<div>
														<a class="is-link" href="#">${product.name}</a>
													</div>
												</div>
												<div class="qty-amount">
													<div class="qty-area">
														<div class="quantity" id="0">
															<select class="select" onchange="with (this) document.location.href=options [selectedIndex].value" id="itemQty0" name="shoppingCartItems[0].quantity">
																<c:forEach var="i" begin="1" end="${product.totalQuontity}">
																	<c:if test="${i == product.quontity}">
																		<option value="${i}" selected="selected">${i}</option>
																	</c:if>
																	<c:if test="${i != product.quontity}">
																		<option value="<%=request.getContextPath()%>/reCountPrice?product=${product.name}&quontity=${i}">${i}</option><
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="cost-area">
														<div>
															<div class="price">
																<span>R</span>
																${product.finalPrice}
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="shipping-coupon-detail">
														<div class="shipping-info">
															Ships in 1 - 2 Days.
														</div>
													</div>
												</div>
												<div class="saved-money-area col-md-6">
													<div class="you-save textlight">
														YOU SAVE
														<br>
														<span>R</span>
														${product.price - product.finalPrice}
														(${product.discount}%)
													</div>
												</div>
											</div>
											<div class="row">
												<div class="remove-SaveForLater-links">
													<a class="button is-link" href="<%=request.getContextPath()%>/removeFromCart?product=${product.name}" title="Delete From Shopping List">Remove</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<div id="back-to-shopping">
									<a class="is-link" href="<%=request.getContextPath()%>"> &lt; CONTINUE SHOPPING </a>
								</div>
							</div>
							<div id="side-bar">
								<div class="row side-bar-item">
									<img style="float: left; padding-right: 20px;" src="<%=request.getContextPath()%>/resources/common/img/cart/shopping-cart.png" alt="cart_icon">
									<span> ${count} items</span>
									<h2 class="total-cost">
										<span>R</span> 
										${totalPrice}
									</h2>
									<button class="checkout-button bottom-co-button" name="submit-checkout" value="Update">PROCEED TO CHECKOUT</button>
								</div>
							</div>
						</div>
					</form>
				</c:if>
				<c:if test="${empty products}">
					<div id="empty-cart">
						<div class="jumbotron">
							<div class="container">
								<h1>Your shopping cart is empty.</h1>
								<p>
									To put something in your Shopping Cart, start by searching or browsing through any of our stores. When an item interests you, click the Add to Cart button. Items in your Shopping Cart always reflect the most recent price displayed on their product pages.
								</p>
								<p id="back-to-shopping">
									<a id="cont-shopping" href="<%=request.getContextPath()%>">CONTINUE SHOPPING</a>
								</p>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>