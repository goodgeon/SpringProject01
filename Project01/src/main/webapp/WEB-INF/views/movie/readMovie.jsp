<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Project01</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../resources/img/favicon.png" rel="icon">
  <link href="../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="../resources/lib/animate/animate.min.css" rel="stylesheet">
  <link href="../resources/lib/venobox/venobox.css" rel="stylesheet">
  <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="../resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: TheEvent
    Theme URL: https://bootstrapmade.com/theevent-conference-event-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
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
          <li class="menu-active"><a href="/myapp">Home</a></li>
          <li><a href="/myapp/review/allreview">전체 리뷰 목록</a></li>
          <li><a href="/myapp/review/myreview?username=${sessionScope.loginUser.username}">내 리뷰 목록</a></li>
          <li><a href="/myapp/user/updateInfo">개인정보수정</a></li>
          <li><a href="/myapp/user/logout">로그아웃</a></li>
          <!-- <li class="buy-tickets"><a href="#buy-tickets">Buy Tickets</a></li> -->
        </ul>
      </nav><!-- #nav-menu-container -->
      
      
    </div>
  </header>

  <section id="movieList">
    <div class="movieList-container wow fadeInUp">
   		<div id= "readmovie-row" class = "row">
 			<table id = "movieInfo" class = "col-lg-7">
 				<tr>
 					<td rowspan="5">
	 					<c:choose>
	 					<c:when test="${movie.image == '' }"><img src = "../resources/img/noImage.png"></c:when>
	 					<c:otherwise><img src = "${movie.image}"></c:otherwise>
	 					</c:choose>
 					</td>
 					<th>제목</th>
 					<td>${movie.title}(${movie.subtitle})</td>
 				</tr>
 				<tr>
 					<th>감독</th>
 					<td>${movie.director}</td>
 				</tr>
 				<tr>
 					<th>출연</th>
 					<td id = "actorTd">${movie.actor }</td>
 				</tr>
 				<tr>
 					<th>링크</th>
 					<td><a href = "${movie.link }">${movie.link }</a></td>
 				</tr>
 				<tr>
 					<th>평점</th>
 					<td>${movie.userRating}</td>
 				</tr>
 			</table>
 			<table id = "repForm" class = "col-lg-7" style = "margin-top : 30px; height : 100px;">
 				<tr id  ="inputTr">
 						<td id = "usernameTd">${sessionScope.loginUser.username}</td>
 						<td id = "inputReplyTd"><textarea id = "inputReply"></textarea></td>
 						<td id = "submitTd"><button id="submitReplyBt" type = "button" class = "btn">Submit</button></td>
 				</tr>
 			</table>
 			<table id = "repList" class = "col-lg-7">
 				<tr><td>댓글이 없습니다.</td></tr>
 			</table>
    	</div>
    </div>
    
  </section>
  <input id="moviename" type = "hidden" value = "${movie.title }">
  <input id = "movielink" type = "hidden" value ="${movie.image}">
  
  <!-- JavaScript Libraries -->
  <script src="../resources/lib/jquery/jquery.min.js"></script>
  <script src="../resources/lib/jquery/jquery-migrate.min.js"></script>
  <script src="../resources/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/lib/easing/easing.min.js"></script>
  <script src="../resources/lib/superfish/hoverIntent.js"></script>
  <script src="../resources/lib/superfish/superfish.min.js"></script>
  <script src="../resources/lib/wow/wow.min.js"></script>
  <script src="../resources/lib/venobox/venobox.min.js"></script>
  <script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="../resources/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../resources/js/main.js"></script>
  <script src="../resources/js/readMovie.js"></script>

</body>
</html>