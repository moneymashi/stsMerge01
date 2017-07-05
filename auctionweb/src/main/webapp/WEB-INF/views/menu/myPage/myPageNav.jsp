<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPageNav</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<ul class="list-group">
	  <li class="list-group-item">
	  	<a href="${path }/myPage/auctionInfo.do">입찰정보</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/myPage/message.do">쪽지함</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/myPage/delivery.do">배송확인</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/myPage/locationInfo.do">주소지등록</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/myPage/userPayment.do">신용카드</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/myPage/userInfo.do">회원개인정보</a>
	  </li>
	</ul>
	<%-- <div>
		<a href="${path }/myPage/auctionInfo.do">입찰정보</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
	<div>
		<a href="${path }/myPage/message.do">쪽지함</a>
	</div>
	<div>
		<a href="${path }/myPage/delivery.do">배송확인</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
	<div>
		<a href="${path }/myPage/locationInfo.do">주소지등록</a>
	</div>
	<div>
		<a href="${path }/myPage/userPayment.do">신용카드</a>
	</div>
	<div>
		<a href="${path }/myPage/userInfo.do">회원개인정보</a>
	</div> --%>
</body>
</html>