<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="UTF-8"/> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%request.setCharacterEncoding("UTF-8"); 
  String path=request.getContextPath();	
%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insBtn").click(function(){
			var name = $("#item_name").val();
			var paCate = $("#parent_category_id").val();
			var subCate = $("#category_id").val();
			var amount = $("#current_bid_amount").val();
			var pic = $("#picture_location").val();
			var content = $("#item_content").val();

			if(name == ""){
				alert("제목을 입력하세요");
				$(this).focus();
				return;
			}
			if(paCate == ""){
				alert("상위 카테고리를 입력하세요.");
				$(this).focus();
				return;
			}
			if(subCate == ""){
				alert("하위 카테고리를 입력하세요.");
				$(this).focus();
				return;
			}
			if(amount == ""){
				alert("시작금액을 입력하세요.");
				$(this).focus();
				return;
			}
			if(pic == ""){
				alert("사진파일을 입력하세요.");
				$(this).focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요.");
				$(this).focus();
				return;
			}
			
			$("form").attr("action", "${path}/item/insertProc.do");
			$("form").submit();
		});
	});
/* 	function categoryShow(cVal){
		
		var f=document.forms.form01;
		var leng = $("#category_id").length;
		
		if(cVal == ""){
			num = new Array("선택하세요");
			vnum = new Array("");
		} else if (cVal == "1") {
			num = new Array("카테고리1-1","카테고리1-2","카테고리1-3","카테고리1-4","카테고리1-5","카테고리1-6","카테고리1-7");
			vnum = new Array("101","102","103","104","105","106","107");
		} else if (cVal == "2") {
			num = new Array("카테고리2-1","카테고리2-2","카테고리2-3","카테고리2-4","카테고리2-5","카테고리2-6","카테고리2-7");
			vnum = new Array("201","202","203","204","205","206","207");
		} else if (cVal == "3") {
			num = new Array("카테고리3-1","카테고리3-2","카테고리3-3","카테고리3-4","카테고리3-5","카테고리3-6","카테고리3-7");
			vnum = new Array("301","302","303","304","305","306","307");
		} else if (cVal == "4") {
			num = new Array("카테고리4-1","카테고리4-2","카테고리4-3","카테고리4-4","카테고리4-5","카테고리4-6","카테고리4-7");
			vnum = new Array("401","402","403","404","405","406","407");
		} else if (cVal == "5") {
			num = new Array("카테고리5-1","카테고리5-2","카테고리5-3","카테고리5-4","카테고리5-5","카테고리5-6","카테고리5-7");
			vnum = new Array("501","502","503","504","505","506","507");
		} else if (cVal == "6") {
			num = new Array("카테고리6-1","카테고리6-2","카테고리6-3","카테고리6-4","카테고리6-5","카테고리6-6","카테고리6-7");
			vnum = new Array("601","602","603","604","605","606","607");
		}
		
		for( var i=0; i<leng; i++ ){
			f.category_id.options[0] = null;
		}
		
		for( j=0; j<num.length; j++ ){
			f.category_id.options[j] = new Option( num[j], vnum[j] );
		}
		
	} */
</script>
<style type="text/css">

</style>
</head>
<body>

<div class="container">
<br><br><br><br>
	<div class="panel panel-primary">
		<div class="panel-heading" style="text-align:center;"><h2>물품등록</h2></div>
		<div class="panel-body">
			<form class="form-horizontal" id="form01" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<%-- 세션 id값으로 자동설정 --%>
					<label class="col-sm-2 control-label">판매자id:</label>
					<div class="col-sm-10"><input class="form-control" type="text" id="auctioneer_id" name="auctioneer_id" value="${sessionScope.id }"/></div>
				</div>	
				<div class="form-group">
					<label class="col-sm-2 control-label">품목명:</label>
					<div class="col-sm-10"><input class="form-control" type="text" id="item_name" name="item_name" /></div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">상위카테고리:</label>
					<div class="col-sm-10"><input class="form-control" name="parent_category_id" value="2"/></div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">하위카테고리:</label>
					<div  class="col-sm-10"><input class="form-control" name="category_id" value="4"></div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">경매시작가:</label>
					<div class="col-sm-10"><input class="form-control" type="text" id="current_bid_amount" name="current_bid_amount" /></div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사진:</label>
					<div class="col-sm-10"><input class="form-control" type="file" id="picture_location" name="file" /></div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">물품상세정보:</label>
					<div class="col-sm-10"><textarea class="form-control" id="item_content" rows="20" name="item_content"></textarea></div>
				</div>
				<div class="form-group" style="text-align:center;">
					<input class="btn btn-primary" id="insBtn" type="button" value="등록하기" />
					<input class="btn btn-primary" type="reset" value="초기화" />
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>