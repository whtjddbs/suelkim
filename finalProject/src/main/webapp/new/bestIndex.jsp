<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<title>Insert title here</title>


<style type="text/css">
#floatMenu{
	position: absolute;
	width: 250px;
	height: auto;
	left: 2%;
	top: 300px;
	background-color: white;
	color: black;
}

.codename{
	width:99%; 
	text-align: left; 
	color: black;
}
.codename td{
	text-align: left; 
	padding: 5px 0px; 
	font-weight: bold; 
	font-size: 10pt; 
	text-decoration: none; 
	color: black;
}

#pdtForm {
	width: 600px;
	height: 500px;
	margin-right: 20px;
	object-fit: cover;
}

#pdtView {
	position: relative;
	display: flex;
	padding: 0 50px;
	/* padding-right:50px; */
	overflow: hidden;
}

#center {
	margin-left: 280px;
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

body div a {
	text-decoration: none;
}

#see_more {
	margin-left: 90%;
}

#category_name {
	font: italic bold 1.5em/1em Georgia, serif;
	font-size: 50px;
	border-bottom: 5px solid #000000;
}

.leftCategory_name {
	font: italic bold 1.5em/1em Georgia, serif;
	font-size: 50px;
	border-bottom: 5px solid #000000;
	margin-bottom: 20%;
}

.selected {
	color: blue;
}

#category_view img {
	height: 100%;
	width: 100%;
	object-fit: one_pdtForm;
}

.itemText1{font-weight: 700; color: black; margin-top: 4%; text-decoration: underline;}
.itemText2{color: #5d5d5d; font-size: 9pt; margin-top: 3%; text-decoration: none;}
.itemText3{font-weight: 900; font-size: 10pt; color: black; text-decoration: none; margin-top: 2%;}
.itemText4{color: black; font-size: 8pt; margin-top: 3%;}
.itemA{color: black; text-decoration: none; font-size: 12pt; font-weight: 800;}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
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
		
	//중앙 디스플레이	
	$('#floatMenu a').each(function(index){			
		var main_codename = $(this).text();
		
		$.ajax({
			type: 'POST',
			url: '/finalProject/new/getBestImageList.do',
			data : {'main_codename' : main_codename},
			dataType : 'json',
			async: false,
			success: function(data){
				$('#category_view').append($('<div/>',{
					id: 'category_name',
					text: main_codename
				})).append($('<div/>',{
					id: 'see_more',							
				}).append($('<a/>',{
					href:"/finalProject/new/bestDisplay.do?main_codename="+main_codename,
					text:'see more>>>'							
				}))).append($('<ul/>',{							
					id:'pdtView'
				}));				
						
					
				$.each(data.list, function(index1, item){
					$('#category_view ul:eq('+index+')').append($('<li/>',{
						id : 'pdtForm'																
						}).append($('<a/>',{
							href : "#"
						}).append($('<div/>',{
							id : 'one_pdtForm'
						}).append($('<img/>',{
							src : '../image/'+main_codename+'/'+item.IMG,
							height: '100%', 
							width: '100%', 
							'object-fit': 'one_pdtForm'
						}))).append($('<div/>',{
							class : 'itemText1',
							text:item.SUB_CODENAME								
						})).append($('<div/>',{
							class : 'itemText2',
							text:item.NAME
						})).append($('<div/>',{
							class : 'itemText3',
							text:item.PRICE+'원'								
						}))).append($('<a/>',{
							href:'#'
						}).append($('<i/>',{
							style: 'margin-right:5px;',
							class : 'far fa-heart',
						}))).append($('<span/>',{
							style : 'margin-right:40px;',
							text : '0'
						})).append($('<a/>',{
							href:'#'
						}).append($('<i/>',{
							style: 'margin-right:5px;',
							class: 'far fa-comment-alt',
						}))).append($('<span/>',{
							style : 'margin-right:40px;',
							text : '0'
						})))
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
		$('#floatMenu a').click(function(){
			$('#floatMenu a').removeClass('selected');
			$(this).addClass('selected');
		});
		
		$('#empty Heart').click(function(){
			alert('asdf');
			$(this).toggleClass('.fas fa-heart');
		});	
});
</script>
</head>
<body>
	<div>
		<!-- 왼쪽 ------------------------------------------------------->
		<div id="floatMenu"
			style="width: 10%; float: left; margin-left: 1%; margin-right: 3%;">
			<div>
				<span><h3>BEST</h3></span>
				<div style="width: 99%; border: 2px solid black;"></div>
				<table class="codename" id="codename">
				</table>
			</div>
		</div>

		<!--가운데 ------------------------------------------------------- -->
		<div id="center">
			<div id="category_view"></div>
		</div>
	</div>
</body>
</html>