<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section _myPage class="my_order">
	<span style="display: inline; float:right; right: 100%;">더보기 ></span>
	<h3 style="display: inline; float:left; margin: 0px; padding-bottom: 10px;">최근 주문</h3>
	<div style="margin-top: 30px;">
	<table class="my_order_table" style="width: 100%;">
		<thead>
			<tr>
				<td width="15%">주문일</td>
				<td width="50%">주문내역</td>
				<td width="20%">주문번호</td>
				<td width="15%">결제금액</td>
			</tr>
		</thead>
		<tbody>
			<!-- <tr style="border-top: 1px solid black;">
				<td colspan="4" align="center">최근 주문내역이 없습니다</td>
			</tr> -->
			<tr class="order_list">
				<td>2018.08.30</td>
				<td><img src="../image/bra01.jpg" width="50px" height="70px"> YMCL Bra</td>
				<td>2018012301200</td>
				<td>30,000원</td>
			</tr>
		</tbody>
	</table>
	</div>
</section>
<section _myPage class="my_heart">
	<span style="display: inline; float:right; right: 100%;">더보기 ></span>
	<h3 style="display: inline; float:left; margin: 0px;">MY HEART</h3>
	<div style="border-top: 4px solid black; margin-top: 30px;">
	<h4 style="padding-bottom: 5px;">products</h4>
		<ul class="heart_list">
			<li>
				<img src="../image/lingerie01.jpg">
				<p>Sexy Lingerie</p>
			</li>
			<li>
				<img src="../image/lingerie02.jpg">
				<p>Sexy Lingerie</p>
			</li>
			<li>
				<img src="../image/panty01.jpg">
				<p>Sexy Panty</p>
			</li>
			<li>
				<img src="../image/panty02.jpg">
				<p>Sexy Panty</p>
			</li>
			<li>
				<img src="../image/panty03.jpg">
				<p>Sexy Panty</p>
			</li>
			<li>
				<img src="../image/bra02.jpg">
				<p>Sexy Bra</p>
			</li>
		</ul>
	</div>
</section>

<script>
$(document).ready(function(){
	$('.my_order_table').on('click','.order_list',function(){
		var serial = $(this).children().eq(2).text();
		location.href='trackingDetail.do?serial='+serial;
	});
	
	$('section:eq(0)').css('height',$('.mypage_right').css('height'));
});
</script>