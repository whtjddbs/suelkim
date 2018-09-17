<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">
<!-- bootstrap icon사용  -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--font-awesome사용  -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>
</head>
<link rel="stylesheet" href="../css/template.css">
<style>
@media only screen and (max-width: 1350px) {
.header_search:eq(1) {background-color:red; top:224px;}
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.btn-example').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup($href);
	});
	$('.header_search:eq(0)').click(function(){
		$('.header_search:eq(1)').toggle();
	});	
	
	//로그아웃
	$('.fa.fa-sign-out').click(function(){
		
	});
});

function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
}
</script>



<body>

<div class="header_container">
	<div  class="header_layout">
		<div class="header_banner_pc_view">
			<div class="header_banner_text">Bbanb 첫구매시 무료 배송</div>
			<div class="header_banner_text2">
				<i class="fa fa-truck">Free Shipping for the First Order</i></div>
			
		</div>
		<div  class="header_wrap">
			<c:if test="${memberDTO.code == 9 }">
				<a href="/finalProject/admin/deliveryControll.do"><i class="fa fa-user">ADMIN</i></a>
			</c:if>
			<c:if test="${memberDTO.code != 9 }">
				<a href="/finalProject/myPage/myPageIndex.do"><i class="fa fa-user">MYPAGE</i></a>
			</c:if>	
			<a href="/finalProject/myPage/mainPage_wishList.do"><i class="fa fa-heart">MYHEART</i></a>
			<a href="/finalProject/order/shoppingBag.do"><i class="fa fa-shopping-basket">SHOPPINGBAG</i></a>
			<c:if test="${memberDTO == null }">
				<a href="/finalProject/member/loginForm.do"><i class="fa fa-sign-in">LOGIN</i></a>
			</c:if>
			<c:if test="${sessionScope.memberDTO != null}">
				<a href="/finalProject/member/logout.do"><i class="fa fa-sign-out">LOGOUT</i></a>
			</c:if>
		</div>
	</div>	
			
	<!-- 		<div class="header_dim-layer">
				<div class="header_dimBg"></div>
				<div id="header_layer2" class="header_pop-layer">
					<div class="header_pop-container">
						<div class="header_pop-conts">
							<strong>인기검색어</strong>
							<ol>
								<li>Push-up Bras</li>
								<li>Demi Bras</li>
								<li>G String</li>
								<li>교환/배송 문의</li>
								<li>서비스 센터</li>
							</ol>
						<div class="header_btn-r"><a href="#" class="btn-layerColse">CLOSE</a></div>
						</div>
					</div>
				</div>
			</div> -->
		
	<div class="header_clearfix" style="margin-top:30px">
		<a href="#" onclick="location.href='/finalProject/main/index.do'"><img src="../image/logoName.jpg"></a> 
		<div class="header_global-nav">
			<ul class="header_nav">
				<li>
					<a href="/finalProject/new/newIndex.do">NEW</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=bras">BRAS</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=panties">PANTIES</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=mens">MEN'S</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=sport">SPORT</a>
				</li>
			</ul>
			<ul class="header_nav">
				<li>
					<a href="/finalProject/new/bestIndex.do" class="subMenu2">BEST</a>
					<a href="" class="subMenu2">EVENT</a>
				</li>
			</ul>
			<div  class="header_search">
				<input type="text" name="header_search_text" id="header_search_text" placeholder="18FW NEW ITEM"/>
				<a href="/finalProject/etc/searchForm.do"><button type="submit" name="button" class="glyphicon glyphicon-search" aria-hidden="true"></button></a>
			</div>
			<div class="header_search" style="height: 500px; position: absolute; top:197px; right: 0px; background-color: white; border-bottom: 0px; display:none; opacity:0.8; border: 1px solid lightgray;">
				<div style="font-size: 20px; font-weight: 900; margin: 5px;">파란팬티</div>
			</div>
		</div>
		 
	</div>	
<!-- 	<div class="header_menu">
		<div class="header_menu_in" style="margin:50px 0 0 300px;" align="left">
			<ul class="header_nav">
				
				</ul>
				
			<ul class="header_nav">
				<li>
					
				</li>
			</ul>	
		</div>	 	
    </div>-->
</div>
</body>