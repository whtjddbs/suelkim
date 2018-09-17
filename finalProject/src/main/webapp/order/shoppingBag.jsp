<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.shoppingBag_table{width: 70%;border-collapse: collapse;}
.shoppingBag_table thead td{text-align: center;padding: 10px 0px; border-bottom: 1px solid #d4d4d4;}
.shoppingBag_table tbody td{text-align: center;padding: 10px 0px; border-top: 1px solid #d4d4d4;}
.shoppingBag_table tbody td:nth-child(2) {text-align: left; padding: 10px 0px;}
.shoppingBag_table tbody td img {float: left; width: 90px; vertical-align: middle; padding-right: 30px; }
.shoppingBag_table tbody span.item_name{font-size: 16px; font-weight:900;}
.shoppingBag_table tbody span.originalprice{font-size: 16px; font-weight:900;}

.shoppingBag_Billing {width: 70%;border-collapse: collapse;}
.shoppingBag_Billing thead td{text-align: center;padding: 10px 0px; border-bottom: 1px solid #d4d4d4;}
.shoppingBag_Billing tbody td:nth-child(1) {font-size: 24px; font-weight: 700;}
.shoppingBag_Billing tbody td:nth-child(2) {font-size: 24px; font-weight: 700;}
.shoppingBag_Billing tbody td:nth-child(3) {font-size: 24px; font-weight: 700;}

.shoppingBag_Billing tbody td:nth-child(2):before {float: left;font-size: 24px;font-weight: 900;content: "+";vertical-align: middle;display: block;height: 17px;}
.shoppingBag_Billing tbody td:nth-child(3):before {float: left;font-size: 24px;font-weight: 900;content: "=";vertical-align: middle;display: block;height: 17px;}

.stepbox {border-bottom: 1px solid black; margin: 20px 0px;}
.BuyBtn{background-color:black; border: none; color: white; padding:10px 25px; text-align: center; text-decoration: none; display: inline-block; font-size: 12px; margin: 4px 2px; cursor: pointer;}
.countBtn{background-color: white; border: 1px solid #d4d4d4; color: #d4d4d4; padding: 5px 10px; text-align: center; text-decoration: none; display: inline-block; font-size: 9px; margin: 4px 2px; cursor: pointer; }
.payBtn{background-color: white; border: 1px solid #d4d4d4; color: black; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 10px; margin: 4px 2px; cursor: pointer;}
.continueBtn{background-color: white; border: 1px solid #d4d4dr; color: black; padding: 30px 45px; text-align: center; text-decoration: none; display: inline-block; font-size: 15px; margin: 4px 2px; cursor: pointer;}
.checkoutBtn{background-color: black; border: none; color: white; padding: 28px 65px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 4px 2px; cursor: pointer;}

.items{display: block;}
.items .item{border-bottom: 1px solid #d4d4d4; width: 100%; display: inline-block; *display: inline; padding: 10px 0px; }

</style>
    
<section class="shoppingBag">
	<div align="center">
		<h3>
			<span>01 shoppingBag</span> >
			<span>02 order</span> >
			<span>03 order confirmed</span>
		</h3>
		<div style="border-top: 4px solid black; width:70%;"></div>
		<table class="shoppingBag_table">
			<thead>
				<tr>
					<td width="5%"><input type="checkbox"></td>
					<td width="60%">상품정보</td>
					<td width="10%">수량</td>
					<td width="13%">주문금액</td>
					<td width="12%">배송비</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="5%"><input type="checkbox"></td>
					<td width="60%" float="left">
						<img src="../image/shoes.png">
							<span class="item_name">[코리안핏]바스 여성 페니로퍼-블랙(BA41720K-000)</span><br>
							<span class="item_originalprice">1113,000</span><br>
							<span>[20%]90,400원</span><br><br>
							<span>옵션:[사이즈]BA41710-000_240</span>
					</td>
					<td width="10%">
						<button class="countBtn">-</button>
						<input type="text" style="width:22px; height:22px;">
						<button class="countBtn">+</button>
					</td>
					<td width="13%">
						<span>90,400원</span><br><br>
						<button class="BuyBtn">Buy Now</button>
					</td>
					<td>
						<span>무료 업체배송</span>
					</td>
				</tr>
				<tr>
					<td width="5%"><input type="checkbox"></td>
					<td width="60%" float="left">
						<img src="../image/pink.png">
							<span class="item_name">CORAL FRONT-TIE TOP</span><br>
							<span class="item_originalprice">79,000</span><br>
							
							<span>옵션:[사이즈]BA41710-000_240</span>
					</td>
					<td width="10%">
						<button class="countBtn">-</button>
						<input type="text" style="width:22px; height:22px;">
						<button class="countBtn">+</button>
					</td>
					<td width="13%">
						<span>79,000원</span><br><br>
						<button class="BuyBtn">Buy Now</button>
					</td>
					<td>
						<span>무료 업체배송</span>
					</td>
				</tr>
			</tbody>
		</table>
	<div align="center" style="border-top:2px solid black; margin-top: 10px; width:70%;"></div>
	<table style="width: 70%; margin-top: 20px;">
		<tbody>
			<tr>
				<td align="left">
					<button class="payBtn">선택상품삭제</button>
					<button class="payBtn">품절상품 삭제</button>
				</td>
				<td align="right">
					<span>장바구니는 접속 종료 후 60일 동안 보관됩니다</span>
				</td>
			</tr>
		</tbody>
	</table>
		
		<div align="center" style="border-top: 4px solid black; margin-top: 20px; width:70%;"></div>
	
	<table class="shoppingBag_Billing">
		<thead>
			<tr>
				<td width="30%">총 주문금액</td>
				<td width="31%">총 배송비</td>
				<td width="39%">총 결제금액</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center" style="margin-top: 20px;">203,990원</td>
				<td align="center" style="margin-top: 20px;">6,000원</td>
				<td align="center" style="margin-top: 20px;">209,900원</td>
			</tr>
			<tr>
				<td align="center" style="font-size: 9pt;">총 3개</td>
			</tr>
			
			<tr style="border-top: 2px solid black;">
				<td align="center" colspan="3">
					<button class="continueBtn">CONTINUE SHOPPING</button>				
					<button class="checkoutBtn">CHECK OUT</button>
				</td>
			</tr>			
		</tbody>
	</table>
</div>
</section>