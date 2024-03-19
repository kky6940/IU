<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/8d3fc93edf.js" crossorigin="anonymous"></script>
	<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/css/main.js" defer></script>

<title>board out</title>
</head>
<body>

<!-- header 영역 -->
	<header>
		
		<nav class="navbar">
			<div class="navbar_logo">
				<a href="index"><img src="./resources/image/iulogo.jpg" class="logo">UAENA</a>
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
				<li><a href="https://www.instagram.com/dlwlrma/"><i class="fa-brands fa-instagram"></i></a></li>
				<li><a href="https://www.youtube.com/c/dlwlrma"><i class="fa-brands fa-youtube"></i></a></li>
				<li><a href="https://twitter.com/_IUofficial"><i class="fa-brands fa-twitter"></i></a></li>
				<li></li>
				<c:choose>
				<c:when test="${loginOn == true && member != null }">
						<li>${member.MEM_NICKNAME }님</li>
						<li><a href="logout" >LOGOUT</a></li>
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

	<div class="container">
		<div class="cover">
			
			<div class="contents">
				<div class="line">
          			<span> 자유게시판</span>
        		</div>
        		
        		<!--검색바-->
        		<form action="search">
        		<ul class="searchbar">
          			<li>
            			<select name="sname" size="1">
							<option value="BO_TITLE">제목명</option>
							<option value="BO_WRITER">작성자명</option>
        		    	</select>
					</li>          			
          			<li><input class="put" type="text" name="svalue"></li>
          			<li><input type="submit" value="검색" class="search-btn"></li>
          			<li><a href="bopage" style="font-size: 19px;"><i class="fa-solid fa-rotate-right"></i></a></li>
				</ul>
				</form>
        		<!--검색바-->
        		
        		<!-- 게시판 목록 -->
        		<table>
          			<thead>
            		<tr>
              			<th>번호</th>
              			<th>제목</th>
              			<th>글쓴이</th>
              			<th>등록일</th>
              			<th>조회</th>
              			<th>추천</th>
            		</tr>
          			</thead>
          			<tbody>
          			
          			<c:forEach items="${list}" var="list">
            		<tr>
              			<td class="num">${list.BO_NO}</td>
              			<td class="title"><a href="bodetail?BO_NO=${list.BO_NO}">${list.BO_TITLE}<span style="color:#DB7093;">[${list.RECNT}]</span></a></td>
              			<td class="writer">${list.BO_WRITER}</td>
              			<td class="date">
              				<fmt:parseDate var="dateString" value="${list.BO_WRITEDAY}" pattern="yyyy-MM-dd"/>
        					<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/>
              			</td>
              			<td class="view">${list.BO_READCNT}</td>
              			<td class="like">${list.BO_LIKE}</td>
            		</tr>
            		</c:forEach>
            		</tbody>
        		</table>
       		</div>	
        		<!-- 게시판 목록 끝 -->
        		
        	<!--글쓰기버튼-->
      		<div class="gotowrite">
      		<c:choose>
				<c:when test="${loginOn == true && member != null }">
				<input type="button" value="글쓰기" onclick="location.href='boinput'" class="write-btn"><br>
				</c:when>
			</c:choose>
      		</div>
      		<!--글쓰기버튼-->
      		
      		<!-- 페이징 처리 -->
      		
      		<div class="page">
  			 <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
          		<c:choose>
              		<c:when test="${p == 1}">
                   		<a href="bopage?nowPage=${paging.startPage}"><</a>
              		</c:when>
           		</c:choose>
   			</c:forEach>
      		
		
        	<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
            	<c:choose>
            	    <c:when test="${p == paging.nowPage }">
            	        <a href="javascript://" class="item cl">${p}</a>
            	    </c:when>
            	    <c:when test="${p != paging.nowPage }">
            	        <a href="bopage?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            	    </c:when>
            	</c:choose>
        	</c:forEach>
        	
      		<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
          		<c:choose>
              		<c:when test="${p == 1}">
                   		<a href="bopage?nowPage=${paging.endPage}">></a>
              		</c:when>
           		</c:choose>
   			</c:forEach>
      		
      		<!-- 페이징 처리 끝 -->	
      	</div>	
	</div>
	</div>
<footer>
	<p>Iu Fanpage</p>
</footer>
		
</body>
</html>