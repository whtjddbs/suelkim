<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/itemList.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<title>Insert title here</title>


<style type="text/css">

#pdtForm {
	width: 600px;
	height: 500px;
	margin-right: 20px;
	object-fit: cover;
}

#pdtForm div {
	color : black;
}

#pdtView {
	position: relative;
	display: flex;
	padding: 0 50px;
	overflow: hidden;
}

#center {
	margin-left: 300px;
	width: 80%;
}

#one_pdtForm {
	height: 55%;
	width: 100%;
	object-fit: cover;
}

#leftScroll {
	position: absolute;
	width: 200px;
	height: auto;
	left: 50px;
	top: 250px;
	object-fit: cover;
	margin-right: 200px;
}

#see_more {
	margin-left: 90%;	
}

#category_name{
	font-weight: 700;
	font-size: 50px;
	border-bottom: 5px solid #000000; 
}

.leftCategory_name{
	font: italic bold 1.5em/1em Georgia, serif;
	font-size: 50px;
	border-bottom: 5px solid #000000; 
	margin-bottom: 20%;
}

.selected{
	color:blue;
}

#category_view img {height: 100%; width: 100%; object-fit: one_pdtForm;}
#category_view  {text-decoration: none;}	
.itemAll{margin-left: 2%; width: 15%;}

</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//왼쪽 디스플레이		
	$.ajax({
		type:'POST',
		url:'/finalProject/new/getCategory.do',
		dataType : 'json',
		async: false,
		success: function(data){
			/* alert(JSON.stringify(data)); */
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>', {
					
					}).append($('<a/>', {
						style : 'text-decoration:none; color:black ',
						href : 'newDisplay.do?main_codename='+item.main_codename,
						text : item.main_codename
				}))).appendTo($('#codename'));
			});
		}	 
	});
	
	//왼쪽 디스플레이 클릭 이벤트
	$('#codename').on('click','a',function(){
		var url = '/finalProject/new/newDisplay.do?main_codename='+$(this).text()+'&pg=1';
		location.href=url;
	});
	
	//중앙 디스플레이	
	$('#codename a').each(function(index){			 
		var main_codename = $(this).text();
		
		$.ajax({
			type: 'POST',
			url: '/finalProject/new/getImageList.do',
			data : {'main_codename' : main_codename},
			dataType : 'json',
			async: false,
			success: function(data){
				// alert(JSON.stringify(data)); 
				$('#category_view').append($('<div/>',{
					id: 'category_name',
					text: main_codename
				})).append($('<div/>',{
					id: 'see_more',				
				}).append($('<a/>',{
					href:"newDisplay.do?main_codename="+main_codename,
					text:'see more>>>'							
				}))).append($('<ul/>',{							
					id:'pdtView'
				}));				
						
					
				$.each(data.list, function(index1, item){
					
					$('#category_view ul:eq('+index+')').append($('<li/>',{
						id : 'pdtForm'													
					}).append($('<a/>',{
						href : "/finalProject/itemView/itemViewTop.do?seq="+item.seq
					}).append($('<div/>',{
						id : 'one_pdtForm'
					}).append($('<img/>',{
						src : '../image/'+main_codename+'/'+item.img,
						height: '100%',
						width: '100%',
						'object-fit': 'one_pdtForm'
					}))).append($('<div/>',{
						class : 'itemText1',
						text : item.sub_codename
					})).append($('<div/>',{
						class : 'itemText2',
						text:item.name						
					})).append($('<div/>',{
						class : 'itemText3',
						text:item.price
					}))).append($('<a/>',{
						id : 'wish'+item.seq
					}).append($('<input/>',{
						type : 'hidden',
						id : 'wish'+item.seq,
						value : item.seq
					})).append($('<i/>',{
						class : 'far fa-heart',
						style : 'color : red; margin-right : 5px;'
					}))).append($('<span/>',{
						style : 'margin-right : 40px;',
						text : '0'
					})).append($('<a/>').append($('<i/>',{
						class : 'far fa-comment-alt',
						style : 'margin-right : 5px;'
					}))).append($('<span/>',{
						text : '0'
					})));
				});
			}
		});
	});
	
	//스크롤 이동
	var floatPosition = parseInt($("#floatMenu").css('top'));

	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
	//옵션에서 선택된 것 활성화, 안된것 비활성화
	$('#leftScroll li').click(function(){
		$('#leftScroll li').removeClass('selected');
		$(this).addClass('selected');
	});
	
	$('#empty Heart').click(function(){
		alert('asdf');
		$(this).toggleClass('.fas fa-heart');
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

</head>
<body class="whole_banner">
	<div>
		<!-- 왼쪽 ------------------------------------------------------->
		<div id="floatMenu" style=" width: 10%; float: left; margin-left: 1%; margin-right: 3%;">
			<div>
				<span onclick="location.href='newIndex.do'" style="cursor: pointer;"><h3>New</h3></span>
					<div style="width:99%; border:2px solid black;"></div>
				<table class="codename" id="codename">
				</table>
			</div>
		</div>

		<!--가운데 ------------------------------------------------------- -->
		<div id="center">	
			<!-- 첫번째 줄---------------------- -->
			<div id="category_view">
				
				
				
				
			</div>		
		</div>
	</div>
</body>
</html>




