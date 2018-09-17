<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<style type="text/css">
#floatMenu{
	position: absolute;
	width: 250px;
	height: 300px;
	left: 2%;
	top: 45%;
	background-color: white;
	color: black;
}

#currentPaging{
	color : red;
	text-decoration: underline;
	cursor: pointer;
}
#paging{
	color : black;
	text-decoration: none;
	cursor: pointer;
}

.codename{width:99%; text-align: left; color: black;}
.codename td{text-align: left; padding: 5px 0px; font-weight: bold; font-size: 10pt; text-decoration: none; color: black;}
.itemAll{ margin-top:2%; margin-left:4%; width:20%; height: 50%; float: left;}
.itemInfo{width: 100%; height: 90%;}
.itemImg{width:100%; height: 75%;}
.itemText1{font-weight: 700; color: black; margin-top: 4%; text-decoration: underline;}
.itemText2{color: #5d5d5d; font-size: 9pt; margin-top: 3%; text-decoration: none;}
.itemText3{font-weight: 900; font-size: 10pt; color: black; text-decoration: none; margin-top: 2%;}
.itemText4{color: black; font-size: 8pt; margin-top: 3%;}
.itemA{color: black; text-decoration: none; font-size: 12pt; font-weight: 800;}
.selected{
	color:blue;
}
.bestPaging{float: left; width: 80%; text-align: center;"
	
}

.itemAll img {height: 100%; width: 100%; object-fit: one_pdtForm;}

</style>

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
	
	//왼쪽 디스플레이		
	$.ajax({
		type:'POST',
		url:'/finalProject/new/getCategory.do',
		dataType : 'json',
		async: false,
		success: function(data){	
			 $.each(data.list, function(index, item){
				  $('<tr/>').append($('<td/>').append($('<a/>',{
					 style : 'color:black;',
					 href : '/finalProject/new/bestDisplay.do?main_codename='+item.main_codename,							 
					 text: item.main_codename						 
				 }))).appendTo($('#codename')); 
			});
		}		 
	});

	
	$('#codename').on('click','a',function(){
		var url = '/finalProject/new/bestDisplay.do?main_codename='+$(this).text()+'&pg=1';
		location.href=url;
	});
	
	//codename 안에 a 태그에 대한 click 이벤트를 발생해라
});

</script>

<div id="floatMenu" style=" width: 10%; float: left; margin-left: 1%; margin-right: 3%;">
	<div>
		<span><h3>Best</h3></span>
			<div style="width:99%; border:2px solid black;"></div>
		<table class="codename" id="codename">	
		</table>	
	</div>
</div>

<div style="margin-left: 15%; margin-top: 2%; width: 80%; float: left;">
	
	<c:if test="${not empty list }">
		<c:forEach var="data" items="${list }">
			<div class="itemAll">
				<a class="itemA" href="#">
					<div class="itemInfo">
						<!-- img -->
						<div class="itemImg">
							<img src="../image/${data.MAIN_CODENAME }/${data.IMG }"/>
						</div>	
						<div class="itemText1">${data.SUB_CODENAME }</div>
						<div class="itemText2">${data.NAME }</div>
						<div class="itemText3">${data.PRICE }원</div>
						</div>
				</a>
				<!-- 하트 -->
				<a>
					<i class="far fa-heart"></i>
				</a>
					<span>0</span>&emsp;&emsp;
				<!-- 리뷰 -->
				<a>
					<i class="far fa-comment-alt"></i>
				</a>
					<span>0</span>
			</div>
		</c:forEach>
		<div class="bestPaging" id="bestPaging">${bestPaging.pagingHTML}</div>
	</c:if>
</div>