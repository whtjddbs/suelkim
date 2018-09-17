<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/itemList.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//왼쪽영역
	var floatPosition = parseInt($("#floatMenu").css('top'));
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	//왼쪽영역 태그
	$.ajax({
		type : 'POST',
		url : '/finalProject/new/getItemList.do',
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>', {
					
					}).append($('<a/>', {
						style : 'text-decoration:none; color:black ',
						href : 'javascript:void(0)',
						text : item.main_codename
				}))).appendTo($('#codename'));
			});
		}
	});
	
	$('#codename').on('click','a',function(){
		var url = '/finalProject/new/newDisplay.do?main_codename='+$(this).text()+'&pg=1';
		location.href=url;
	});
	
	//위시 리스트 로딩
	if('${memberDTO}'!='') {
		$.ajax({
			type : 'POST',
			url : '/finalProject/member/getWishList.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.wishList, function(index, seq){
					$('#wish'+seq+' > i').prop('class','fas fa-heart');
				});
			}
		});
	}
	
	//위시 리스트 추가
	$(document).on('click','.far.fa-heart',function(){
		if('${memberDTO}'=='') alert('로그인 하세요');
		else {
			$(this).prop('class','fas fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/addWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					
				}
			});
		}
	});
	//위시 리스트 제거
	$(document).on('click','.fas.fa-heart',function(){
		if('${memberDTO}'=='') alert('로그인 하세요');
		else {
			$(this).prop('class','far fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/deleteWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					
				}
			});
		}
	});
	
});
</script>

<div id="floatMenu" style=" width: 10%; float: left; margin-left: 1%; margin-right: 3%;">
	<div>
		<span onclick="location.href='newIndex.do'" style="cursor: pointer;"><h3>New</h3></span>
			<div style="width:99%; border:2px solid black;"></div>
		<table class="codename" id="codename">
		</table>
	</div>
</div>

<div style="margin-left: 300px; width: 80%; float: left;">
	
	<c:if test="${not empty list }">
		<c:forEach var="data" items="${list }">
			<div class="itemAll">
				<a class="itemA" href="/finalProject/itemView/itemViewTop.do?seq=${data.seq }">
					<div class="itemInfo">
						<!-- img -->
						<div class="itemImg">
							<img src="../image/${data.main_codename }/${data.img }"/>
						</div>	
						<div class="itemText1">${data.sub_codename }</div>
						<div class="itemText2">${data.name }</div>
						<div class="itemText3">${data.price }원</div>
					</div>
				</a>
				<!-- 하트 -->
				<a id="wish${data.seq }">
					<input type="hidden" id="wish${data.seq }" value="${data.seq }">
					<i class="far fa-heart" style="color: red;"></i>
				</a>
					<span>0</span>&emsp;&emsp;
				<!-- 리뷰 -->
				<a>
					<i class="far fa-comment-alt"></i>
				</a>
					<span>0</span>
			</div>
		</c:forEach>
		<div class="paging" id="paging">${itemPaging.pagingHTML }</div>
	</c:if>
</div>