<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							SHOPPING CART(1)
							<img src="<%=request.getContextPath()%>/resources/common/img/cart/tab-pointer.png" class="arrow_head1">
						</a>
					</h2>
				</div>
			</div>
			<div id="shopping-cart-section" class="cart-page-section selected">
				<form name="UpdateCart" id="updateCart" action="#" method="POST">
					<div class="row">
						<div id="product-list">
							<div class="product-item row">
								<input type="hidden" name="shoppingCartItems[0].value" value="P-mobi-25905366372">
								<input type="hidden" name="shoppingCartItems[0].keyBNId" value="home_elec_mobi_mobi">
								<div class="image-area img-responsive">
									<a href="#">
										<img src="http://catman-a2.infibeam.com/img/mobi/8841726/77/12/commonsmg920f001frontwhite.jpeg.057712a60b.999x120x120.jpg" border="0" alt="Samsung Galaxy S6 (White) (32GB)" class="img-responsive">
									</a>
								</div> 
								<div class="cart-text">
									<div class="row">
										<div class="title-area">
											<div>
												<a class="is-link" href="#">Samsung Galaxy S6 (White) (32GB)</a>
											</div>
										</div>
										<div class="qty-amount">
											<div class="qty-area">
												<div class="quantity" id="0">
													<select class="select" id="itemQty0" name="shoppingCartItems[0].quantity">
														<option value="1" selected="selected">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
													</select>
												</div>
											</div>
											<div class="cost-area">
												<div>
													<div class="price">
														<span>R</span>
														49,900
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
												6,800
												(12%)
											</div>
										</div>
									</div>
									<div class="row">
										<div class="remove-SaveForLater-links">
											<a class="button is-link" href="#" title="Delete From Shopping List">Remove</a>
											<a class="button is-link" href="" title="Save For Later">Save For Later</a>
										</div>
									</div>
								</div>
							</div>
							<div id="back-to-shopping">
								<a class="is-link" href="#"> &lt; CONTINUE SHOPPING </a>
							</div>
						</div>
						<div id="side-bar">
							<div class="row side-bar-item">
								<img style="float: left; padding-right: 20px;" src="<%=request.getContextPath()%>/resources/common/img/cart/shopping-cart.png" alt="cart_icon">
								<span> 1 items</span>
								<h2 class="total-cost">
									<span>R</span> 
									49,900
								</h2>
								<button class="checkout-button bottom-co-button" name="submit-checkout" value="Update">PROCEED TO CHECKOUT</button>
							</div>
						</div>
					</div>
				</form>
				<div id="empty-cart">
					<div class="jumbotron">
						<div class="container">
							<h1>Your shopping cart is empty.</h1>
							<p>
								To put something in your Shopping Cart, start by searching or browsing through any of our stores. When an item interests you, click the Add to Cart button. Items in your Shopping Cart always reflect the most recent price displayed on their product pages.
							</p>
							<p id="back-to-shopping">
								<a id="cont-shopping" href="/">CONTINUE SHOPPING</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>