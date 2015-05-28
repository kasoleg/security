<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/common/css/site.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/common/css/slick.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-2.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/slick.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/site.js" ></script>
</head>
<body>
	<div id="checkout" class="ng-scope">
		<div id="checkoutHeader">
			<div class="container">
				<div class="row">
					<div>
						<div>
							<div>
								<div class="row">
									<div class="mainHead">
										<img src="<%=request.getContextPath()%>/resources/common/img/header/logo.png" alt="Shop.com - Online Shopping Russia" />
									</div>
									<div class="mainhead title text-right">
										Checkout
									</div>
								</div>
							</div>
						</div>
						<div class="pull-right text-right needHelp mainHead">
							Need Help ?
							Call
							<span class="needHelpNumber">+91 79 40260260, +91 79 67778777</span>
						</div>
					</div>
				</div>
			</div>
			<div class="container" id="checkoutBody">
				<div class="row">
					<div>
						<accordion>
							<div class="panel-group">
								<div class="panel panel-default" id="shippingContainer">
									<div class="panel-heading">
										<h4 class="panel-title">
											<div class="customPanelTitle row panelHeadingOpen" id="divAddressPanelTitle">
												<div>
													1. Shipping and Billing
												</div>
											</div>
										</h4>
									</div>
									<div class="panel-collapse collapse in">
										<div class="panel-body">
											<div>
												<div class="row" id="shippingBody">
													<div class="paddingZero">
														<div class="row">
															<div class="alignCenter">
																<button class="btn btnAddNewAddress">Add New Shipping Address</button>
															</div>
															<div class="alignCenter ng-hide">
																<button class="btn btnAddNewAddress">Add New Billing Address</button>
															</div>
															<div class="alignCenter divSameAddress">
																<span>
																	<input type="checkbox" class="ng-valid ng-dirty">
																	Billing Address same as Shipping Address
																</span>
															</div>
														</div>
														<div class="row divCustDetails">
															<div>
																<div class="row">
																	<div>
																		Please Share your contact details
																		<br>
																		<span class="subIns">Required for communication</span>
																	</div>
																	<div>
																		<div class="input-group">
																			<span class="input-group-addon" style="border-radius: 0px;">+91</span>
																			<input type="text" class="form-control" placeholder="Enter Your Phone Number">
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row" style="margin-top: 15px;">
														 	<div class="text-center">
														 		<button class="btn btnProceedCofirmation">Confirm Shipping &amp; Billing Address</button>
														 	</div>
														 	<div class="text-center">
														 		<img class="img antiBounce" src="<%=request.getContextPath()%>/resources/common/img/checkout/down-step-arrow.png">
														 	</div>
														 </div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default" id="confirmationContainer">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle">
												<div class="customPanelTitle row" id="divConfirmationPanelTitle">
													
												</div>
											</a>
										</h4>
									</div>
								</div>
							</div>
						</accordion>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>