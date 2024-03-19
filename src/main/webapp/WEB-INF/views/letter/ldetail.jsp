<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/8d3fc93edf.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board-detail.css">
<script src="${pageContext.request.contextPath}/resources/css/main.js"
	defer></script>

<title>letter Detail</title>
</head>
<body>

<!-- header 영역 -->
	<header>

		<nav class="navbar">
			<div class="navbar_logo">
				<a href="index"><img src="./resources/image/iulogo.jpg"
					class="logo">UAENA</a>
			</div>

			<ul class="navbar_menu">
				<li><a href="aboutiu">About IU</a></li>
				<li><a href="ntpage">공지사항</a></li>
				<li><a href="melon">앨범소개</a></li>
				<li><a href="bopage">자유게시판</a></li>
				<li><a href="ptpage">포토게시판</a></li>
				<li><a href="lpage">편지</a></li>
			</ul>

			<ul class="navbar_icons">
				<li><a href="https://www.instagram.com/dlwlrma/"><i
						class="fa-brands fa-instagram"></i></a></li>
				<li><a href="https://www.youtube.com/c/dlwlrma"><i
						class="fa-brands fa-youtube"></i></a></li>
				<li><a href="https://twitter.com/_IUofficial"><i
						class="fa-brands fa-twitter"></i></a></li>
				<li></li>
				<c:choose>
					<c:when test="${loginOn == true && member != null }">
						<li>${member.MEM_NICKNAME }님</li>
						<li><a href="logout">LOGOUT</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="login">LOGIN</a></li>
					</c:otherwise>
				</c:choose>

			</ul>

			<a href="#" class="navbar_toogleBtn"> <i class="fa-solid fa-bars"></i>
			</a>
		</nav>
	</header>
	<!-- header 영역 끝 -->
	
	<!-- detail 영역 시작 -->		
	<input type="hidden" name="LT_NO" id="LT_NO" value="${list.LT_NO}">		
		
		<div class="container">

		<div class="cover">

			<div class="contents">
				<div class="line">
					<span>Dear,IU</span>
				</div>
			</div>
			
			<div class="board_wrap">
				<div class="board-title">
					<p>${list.LT_TITLE}</p>
				</div>
				<div class="board-info">
					<span>${list.LT_WRITER}</span> 
					<span class="date">${list.LT_WRITEDAY}</span>
				</div>
			</div>
			
			<div class="board-content">
				<p>${list.LT_CONTENT}</p>
			</div>
			
			<div class="gotoboard">
				<input type="button" value="목록" onclick="location.href='lpage'"
					class="list-btn">
					
				<c:choose>
					<c:when test="${loginOn == true &&  MEM_NICKNAME == list.LT_WRITER}">
						<input type="button" value="삭제"
							onclick="location.href='ldelete?LT_NO=${list.LT_NO}'"
							class="list-btn">
					</c:when>
				</c:choose>	
			</div>
			
			<!-- detail 영역 끝 -->
		</div>
	</div>
	
<footer>
	<p>IU Fanpage</p>
</footer>			
		
</body>
</html>