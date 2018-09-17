<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="tracking">
	<h3>주문배송조회</h3>
	<div>
		<table class="tracking_table">
			<thead>
				<tr>
					<td width="70%">상품정보</td>
					<td width="10%">배송비</td>
					<td width="20%">진행상태</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<div class="stepbox">
							주문일자 <span>2018.08.30</span> 주문번호 <span>2018082900001</span>
						</div>
						<div class="items">
							<div class="item">
								<div class="item_1">
									<div class="item_image">
										<img src="../image/bra01.jpg">
									</div>
									<div class="item_info">
										<div class="item_name">NEW! Lightly Lined Wireless Bra</div>
										<div class="item_size">[Size] 34B</div>
										<div class="item_count">32000원 / 수량 1개</div>
									</div>
								</div>
								<div class="item_2">
									무료배송
								</div>
								<div class="item_3">
									<strong>배송 완료</strong><br>
									<span>로젠택배</span> <a href="#">96764160415</a>
								</div>
							</div>
							<div class="item">
								<div class="item_1">
									<div class="item_image">
										<img src="../image/bra02.jpg">
									</div>
									<div class="item_info">
										<div class="item_name">SEXY ILLUSIONS BY VICTORIA'S SECRET Strapless Bra</div>
										<div class="item_size">[Size] 34B</div>
										<div class="item_count">32000원 / 수량 1개</div>
									</div>
								</div>
								<div class="item_2">
									무료배송
								</div>
								<div class="item_3">
									<strong>배송 완료</strong><br>
									<span>로젠택배</span> <a href="#">96764160415</a>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="stepbox">
							주문일자 <span>2018.08.30</span> 주문번호 <span>2018082900001</span>
						</div>
						<div class="items">
							<div class="item">
								<div class="item_1">
									<div class="item_image">
										<img src="../image/bra01.jpg">
									</div>
									<div class="item_info">
										<div class="item_name">NEW! Lightly Lined Wireless Bra</div>
										<div class="item_size">[Size] 34B</div>
										<div class="item_count">32000원 / 수량 1개</div>
									</div>
								</div>
								<div class="item_2">
									무료배송
								</div>
								<div class="item_3">
									<strong>배송 완료</strong><br>
									<span>로젠택배</span> <a href="#">96764160415</a>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>

<script type="text/javascript">
$(document).ready(function(){
	$('.tracking_table').on('click','.item_1',function(){
		var serial = $(this).parent().parent().prev().children().last().text();
		location.href = '/finalProject/myPage/trackingDetail.do?serial='+serial;
	});
});
</script>