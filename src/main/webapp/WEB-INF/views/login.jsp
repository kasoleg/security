<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="loginPage">
		<div class="container">
			
				<div id="login">
					<div class="main-container">
							<c:url value="/login" var="loginUrl"/>
							<form name="loginForm" id="loginForm" class="navbar-form" action="${loginUrl}" method='POST'>
								<div class="row">
									<div class="column">
										<h2>Login</h2>
									</div>
								</div>
								<div class="row">
									<div class="column loginText">
										Existing Customers: Sign In Below
									</div>
								</div>
								<div class="row control">
									<div class="column">
										<input type="text" id="email" name="email" placeholder="Email" class="form-control"/>
										<small id="errorEmail" class="help-block"></small>
									</div>
								</div>
								<div class="row control">
									<div class="column">
										<input type="password" id="password" name="password" placeholder="Password" class="form-control"/>
										<small id="errorPassword" class="help-block"></small>
									</div>
									<span id="passwordDetails"></span>
								</div>
								<div class="row" id="forgot-password-link">
									<div class="column">
										<a href="#" class="navbar-link">Forgot your password?</a>
									</div>
								</div>
								<c:if test="${not empty error}">
									<div class="row control">
										<div class="column">
											<center 
												class="error-message">${error}
											</center>
										</div>
									</div>
								</c:if>
								<div class="row control">
									<div class="column">
										<input class="btn btn-login" type="submit" name="Login" value="LOGIN">
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
						
					</div>
					<div class="column">
						<div id="socialLogin" class="navbar-form">
							<div class="row">
								<div class="column socialText">
									Or Login with:
								</div>
								<div class="column" id="btn-social-login">
									<ul class="list-inline btn-social-login">
										<li class="btn-social">
											<a href="#" id="facebook">
												<img class="img-responsive fb" src="<%=request.getContextPath()%>/resources/img/login/fb.png" >
											</a>
										</li>
										<li class="btn-social">
											<a href="#" id="google">
												<img class="img-responsive google" src="<%=request.getContextPath()%>/resources/img/login/gplus.png">
											</a>
										</li>
										<li class="btn-social">
											<a href="#" id="yahoo">
												<img class="img-responsive yahoo" src="<%=request.getContextPath()%>/resources/img/login/yahoo.png">
											</a>
										</li>
										<li class="btn-social">
											<a href="#" id="twitter">
												<img class="img-responsive twitter" src="<%=request.getContextPath()%>/resources/img/login/twitter.png">
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="column">
									<p class="note">
										Note: We will never post anything without permission
									</p>
								</div>
							</div>
							<div class="row">
								<div class="column" style="width:100%">
									<p class="note">
										When you log out, please also log out from the corresponding account separately.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="registration">
					<div class="row main-container" id="registration-box">
						<div>
							<div class="navbar-form">
								<div class="row">
									<div class="column" id="header-registration">
										<h2>
											"New to "
											<span>Shop.com</span>
										</h2>
										<div class="registrationText">New Customers: Sign Up Below</div>
										<div>
											<img class="arrow-curved" src="<%=request.getContextPath()%>/resources/img/login/arrow_curved.png">
										</div>
									</div>
									
									
									
								</div>
								<div class="row">
									<div class="column" id="register-button-link">
										<button class="btn btn-register" id="new-account-btn" type="button">CREATE NEW ACCOUNT</button>
									</div>
								</div>
								<form:form name="registration-form" id="registration-form" modelAttribute="user" method="post" action="addUser" class="bv-form">
									<div class="row control">
										<div class="column form-group">
											<form:input id="name" path="name" type="text" class="form-control" name="userName" placeholder="Name" />
											<small id="errorName" class="help-block"></small>
										</div>
									</div>
									<div class="row control">
										<div class="column form-group">
											<form:input id="emailRegistration" path="email" type="text" class="form-control" name="emailRegistration" placeholder="Email" />
											<small id="errorEmailRegistration" class="help-block"></small>
										</div>
									</div>
									<div class="row control">
										<div class="column form-group">
											<form:input id="passwordRegistration" path="password" type="password" class="form-control" name="passwordRegistration" placeholder="Password" />
											<small id="errorPasswordRegistration" class="help-block"></small>
										</div>
									</div>
									<div class="row">
										<div class="column">
											<p class="note">
												
												By signing in, you agree to our 
											<a href="#">Terms &amp; Conditions</a>
											<br>
											and that you have read our 
											<a href="#">Privacy Policy</a>
											</p>
										</div>
									</div>
									<div class="row">
										<div class="column" id="register-button-link">
											<button class="btn btn-register" type="submit">CREATE NEW ACCOUNT</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>