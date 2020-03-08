<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Login V16</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/img/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<!--===============================================================================================-->
</head>
<body>
	<header id="header">
	    <div class="container-fluid" style = "text-align : center;">
	
	      <div id="logo" class="pull-left">
	        <!-- Uncomment below if you prefer to use a text logo -->
	        <!-- <h1><a href="#main">C<span>o</span>nf</a></h1>-->
	        <a href="#intro" class="scrollto"><img src="../resources/img/logo.png" alt="" title=""></a>
	      </div>
	      
	      <div class = "pull-right loginUserInfo">
	      	<c:if test="${sessionScope.loginUser != null }">
	      		${sessionScope.loginUser.username}님 환영합니다
	      	</c:if>
	      </div>
	
	      <nav id="nav-menu-container" style = "display : inline-block;">
	        <ul class="nav-menu">
	          <li><a href="/myapp">Home</a></li>
	          <li><a href="/myapp/review/allreview">전체 리뷰 목록</a></li>
	          <li><a href="/myapp/review/myreview?username=${sessionScope.loginUser.username}">내 리뷰 목록</a></li>
	          <li class="menu-active"><a href="/myapp/user/updateInfo">개인정보수정</a></li>
	          <li><a href="/myapp/user/logout">로그아웃</a></li>
	          <!-- <li class="buy-tickets"><a href="#buy-tickets">Buy Tickets</a></li> -->
	        </ul>
	      </nav><!-- #nav-menu-container -->
	      
	      
	    </div>
	  </header>
	<div class="limiter" id="intro-login">
		<div class="container-login100">
			<div id = "joinForm" class="wrap-join100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41 userFormHeader">
					Update Info
				</span>
				<form action = "updateInfo" method = "POST" class="login100-form p-b-33 p-t-5">

					<div class="wrap-input100 validate-input">
						<input id = "inputUserName" class="input100" type="text" name="username" value="${sessionScope.loginUser.username }" readonly>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input id = "inputPw" class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input id = "confirmPw" class="input100" type="password" placeholder="Confirm Password" data-toggle="popover-focus" title="password confirm" data-content = "비밀번호가 일치하지 않습니다">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					
					<div class="wrap-input100 validate-input" style = "text-align : center; padding : 10px; height : 59px;" >
						<span id = "checkPw"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button type = "button" id = "backBt" class="btn ml-4">
							Back
						</button>
						<button id = "submitUpdateBt" class="btn ml-4" disabled>
							Update
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../resources/js/updateInfo.js"></script>

</body>
</html>