<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.deliveryControll {overflow: hidden; width: 100%; height: auto;}
.deliveryControll ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%;}
.deliveryControll ul li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.deliveryControll ul li:first-child {border-bottom: 2px solid black;}
.deliveryControll ul li > div {width: 100%; overflow: visible; height: auto; text-align: center;}
.deliveryControll ul li > div > div {float: left; text-align: center;}
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(1) {width: 5%;} /* 체크박스 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(2) {width: 15%;} /* 주문번호 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(3) {width: 25%;} /* 접수제목 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(4) {width: 10%;} /* 접수일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(5) {width: 10%;} /* 진행상태 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(6) {width: 10%;} /* 완료일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(7) {width: 10%;} /* 구분 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(8) {width: 10%; text-align: center;} /* 완료버튼 */
.deliveryControll ul li:nth-child(2) {border-bottom: 1px solid black;}
.deliveryControll ul li:nth-child(2)~li {border-bottom: 1px solid #d4d4d4;}

.delivery_step {width: 100%; overflow: hidden; height: auto;}
.delivery_step > * {float: left; margin-right: 20px;}
.delivery_step select {
	width: 150px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
.delivery_step select::-ms-expand {display:none}

.delivery_step div:last-child {float: right; padding-right: 2%;}
.delivery_step div input {
	width: 150px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit;
	border: 1px solid #999; 
}

.btn_white {width: 70px; padding: 3px 0px; border: 1px solid black; background: white; font-size: 13px; line-height: 20px; border-radius: 10px; margin-top: -5px; outline: none; cursor: pointer;}
.btn_black {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}

.delivery_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.delivery_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.delivery_item {cursor: pointer;}
.delivery_item > div:first-child {cursor: default;}
.delivery_item > div:last-child {cursor: default;}

#delivery_item_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#delivery_item_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
#delivery_item_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;}

.items {width: 37%; float: left;}
.items .item {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.items .item .item_info {display: block;float: left; vertical-align: middle;}
.items .item .item_info .item_name {font-family: "Do Hyeon"; font-size: 24px; font-weight: 900; padding: 10px 0px; word-wrap: break-word;font-size: 18px;line-height: 24px;font-weight:500; word-wrap: break-word;}
.items .item .item_info .item_size {font-size: 12px; padding-bottom: 10px;}
.itmes .item .item_info .item_count {padding: 10px 0px;}
.items .item .item_image {height: auto; width: 140px;}
.items .item img { float: left; width: 80px; vertical-align: middle; padding: 0px 30px; }

.refund_reason {width: 57%; float: right; border-left: 1px solid #d4d4d4; padding: 0px 2%; overflow: visible; height: auto;}
.refund_reason > div:first-child {float: left; width: 100%; height: 40px; padding-top:10px; border-bottom: 2px solid black;}
.refund_reason > div:nth-child(2) {float: left; width: 30%; height: 45px; text-align: right; padding-top:5px; overflow: visible; height: auto;}
.refund_reason > div:nth-child(2) > img {width: 100%;}
.refund_reason > div:nth-child(3) {float: right; width: 68%; height: 45px; text-align: left; padding-top:5px; overflow: visible; height: auto;}
.refund_reason > div > span {font-family: "Do Hyeon"; font-size: 22pt; font-weight: 700;}

.my_btnbox {margin-top: 20px; text-align: right; padding-right: 1%;}
</style>

</head>
<body>
<section class="deliveryControll">
	<h3 class="title">취소/반품/교환 관리</h3>
	<ul>
		<li>
			<div class="delivery_step">
				<select>
					<option value="all">전체</option>
					<option value="prep">준비중</option>
					<option value="delivery">배송중</option>
					<option value="complete">배송완료</option>
				</select>
				<div><i class="material-icons">date_range</i>&emsp;<input type="date" class="datePicker"> ~ <input type="date" class="datePicker"></div>
				<div><input type="button" class="btn_black" value="검색"></div>
			</div>
		</li>
		<li>
			<div class="delivery_title">
				<div><input type="checkbox" name="checkAll" id="checkAll"></div>
				<div>주문번호</div>
				<div>접수제목</div>
				<div>접수일자</div>
				<div>진행상태</div>
				<div>완료일자</div>
				<div>구  분</div>
				<div></div>
			</div>
		</li>
		<li>
			<div class="delivery_item">
				<div><input type="checkbox" name="check" class="check"></div>
				<div>2017081994420</div>
				<div>사이즈가 안맞아요 ㅠㅠ</div>
				<div>2018.09.05</div>
				<div>처리중</div>
				<div>-</div>
				<div>상품교환</div>
				<div><input type="button" class="btn_white" value="완료"></div>
			</div>
		</li>
	</ul>
	<div class="my_btnbox">
		<button class="btn_black">완료</button>
	</div>
</section>
<section id="delivery_item_detail">
	<div class="stepbox">
		주문일자 <span>2018.08.30</span> 주문번호 <span>2018082900001</span>
	</div>
	<div class="items">
		<div class="item">
			<div class="item_image">
				<img src="../image/bra01.jpg">
			</div>
			<div class="item_info">
				<div class="item_name">NEW! Lightly Lined Wireless Bra</div>
				<div class="item_size">[Size] 34B</div>
				<div class="item_count">32000원 / 수량 1개</div>
			</div>
		</div>
	</div>
	<div class="refund_reason">
		<div><span>사 유 :</span> 사이즈가 안맞아요 ㅠㅠ</div>
		<div><img src="../image/panty01.jpg"></div>
		<div><pre>저 살쪘나봐요... 바꿔죠오오오!!</pre></div>
	</div>
</section>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#checkAll').click(function(){
		if($('#checkAll').prop('checked')) {
			$('.check').prop('checked', true);
		}else {
			$('.check').prop('checked', false);
		}
	});
	
	//주문 리스트 클릭시
	$('.deliveryControll').on('click','.delivery_item > *:not(:has(input))',function(){
		if($(this).parent().next().prop('tagName')=='SECTION') {
			$('#delivery_item_detail').hide();
			$('.deliveryControll').append($('#delivery_item_detail'));
			
			return false;
		}
		
		$('#delivery_item_detail').hide();
		
		//ajax로 데이터 불러올 부분
		$('#delivery_item_detail > .stepbox span:eq(0)').text('2018.09.05');
		$('#delivery_item_detail > .stepbox span:eq(1)').text('2018090552312');
		$('#delivery_item_detail img:eq(0)').prop('src','../image/bra02.jpg');
		$('#delivery_item_detail .item_name').text('NEW! Lightly Lined Wireless Bra');
		$('#delivery_item_detail .item_size').text('[Size] 32B');
		$('#delivery_item_detail .item_count').text('32000원 / 수량 1개');
		
		$(this).parent().parent().append($('#delivery_item_detail'));
		$('#delivery_item_detail').slideToggle();
	});
	
});
</script>
</html>