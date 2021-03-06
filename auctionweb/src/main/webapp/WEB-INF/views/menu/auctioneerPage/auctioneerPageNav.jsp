<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:if test="${mem.auth == 1}">
	<div>판매자 등록하고 집문서 까지 팔아보자~!</div>
</c:if>
<c:if test="${mem.auth != 1}">
	<ul class="list-group">
	  <li class="list-group-item">
	  	<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자정보</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/auctioneerPage/itemInsert.do">판매등록</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/auctioneerPage/saleInfo.do">경매정보</a>
	  </li>
	  <li class="list-group-item">
	  	<a href="${path }/auctioneerPage/delivery.do">상품배송(공사중)</a>
	  </li>
	</ul>
</c:if>
