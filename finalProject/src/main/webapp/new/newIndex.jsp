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
}
 #leftScroll ul, #leftScroll li{
	list-style: none;
	padding-left: 0px;
	
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
	overflow: hidden;
}

#center {
	margin-left: 200px;
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

body div a{
	text-decoration:none;
}


#see_more {
	margin-left: 90%;	
}

#category_name{
	font: italic bold 1.5em/1em Georgia, serif;
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
			/* alert(JSON.stringify(data)); */
			 $('#leftScroll').append( $('<span/>',{
				 text: 'New'
				 }));
			
		 	$.each(data.list, function(index,item){
				 
		 		 $('#leftScroll').append($('<a/>',{
					 href : '/finalProject/new/newDisplay.do?main_codename='+item.main_codename							 
				 }).append($('<li/>',{
					 text: item.main_codename						 
				 })));
		 	});
		}		 
	});
		
	//중앙 디스플레이	
	$('#leftScroll li').each(function(index){			 
		var main_codename = $(this).text();
		
		$.ajax({
			type: 'POST',
			url: '/finalProject/new/getImageList.do',
			data : {'main_codename' : main_codename},
			dataType : 'json',
			async: false,
			success: function(data){
					/* alert(data.list.img); */
				/* alert(JSON.stringify(data)); */ 
				$('#category_view').append($('<div/>',{
					id: 'category_name',
					text: main_codename
				})).append($('<div/>',{
					id: 'see_more',							
				}).append($('<a/>',{
					href:"#",
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
							src : '../image/'+main_codename+'/'+item.img,
							height: '100%', 
							width: '100%', 
							'object-fit': 'one_pdtForm'
						}))).append($('<div/>',{
							text:item.name								
						})).append($('<div/>',{
							text:item.price
							
						}))).append($('<a/>',{
							class: 'empty+Heart',
							href:'#'
							
						}).append($('<i/>',{
							class : 'far fa-heart',
						}))).append($('<a/>',{
							href:'#'
						}).append($('<i/>',{
							class: 'far fa-comment-alt',
						}))))
				 	});		
				}
	 		});
		});
	
		//스크롤 이동
		var leftPosition = parseInt($('#leftScroll').css('top'));

		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + leftPosition + "px";

			$("#leftScroll").stop().animate({
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
});
</script>

</head>
<body class="whole_banner">
	<div>
		<!-- 왼쪽 ------------------------------------------------------->
	 	<nav id="leftScroll">
			<!-- <span id="category_name">NEW</span> -->
			<!-- <h2>NEW Arrivals</h2>
			
			<a href="#"><li>Bras</li></a> 
			<a href="#"><li>Panties</li></a> 
			<a href="#"><li>Men`s</li></a> 
			<a href="#"><li>Sport</li></a>  -->
		</nav> 

		<!--가운데 ------------------------------------------------------- -->
		<!----------------------------------------------------------- -->

		<div id="center">
			
			
			<!-- <div id="center"> -->	
				<!-- 첫번째 줄---------------------- -->
				<div id="category_view">
					
					
					
					
				</div>		
			</div> 
		</div>
</body>
</html>




