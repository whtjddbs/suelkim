<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
    body, input, select, textarea, button, a {
        -webkit-text-size-adjust:none;
        font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
    }
</style>

<style>
	.article_right[_ngcontent-c0]{overflow:hidden;}
	.article_right[_ngcontent-c0]   .article_right[_ngcontent-c0], .cs_wrap[_ngcontent-c0]   .article_left[_ngcontent-c0], .cs_wrap[_ngcontent-c0]   .article_right[_ngcontent-c0]{padding-top:0}

		
 	.my_tbl_tit{border-bottom:1px solid #000;font-weight:700}  
	.my_tbl_lst .my_tbl_tit .tit,   .my_tbl_lst .my_tbl_tit .type{text-align:center}  
	.my_tbl_lst .my_tbl,   .my_tbl_lst>li{border-bottom:1px solid #d4d4d4}  
	.my_tbl_lst .btn_bor{position:absolute;top:50%;right:20px;width:43px;height:34px;margin-top:-17px;border-radius:2px;line-height:34px}  
	.my_tbl_info{table-layout:fixed;position:relative;box-sizing:border-box;color:#303033}  
	.my_tbl_info,   .my_tbl_info .infoinner{display:table;width:100%} 
	.my_tbl_info p{display:table-cell;min-height:50px;text-align:center;vertical-align:middle;font-size:14px;box-sizing:border-box}

	
	.my_tbl_lst .reply_row{display:none}  
	.my_tbl_lst .reply_row img{max-width:100%}  
	.my_tbl_lst .active .reply_row{display:block}  
	 
	.order_lst .thead{display:table;width:100%;border-bottom:1px solid #303033;font-size:12px;line-height:50px;table-layout:fixed}  
	.order_lst .thead .in_td{display:table-cell;position:relative;height:0;padding:0;border:0;text-align:center;vertical-align:middle}  
	.order_lst .thead .in_td:first-child{overflow:hidden;width:68%}  
	.order_lst .thead .type1{float:left;width:100px}  
	.order_lst .thead .type2{overflow:hidden}  
	.order_lst .goods_tip{margin-top:10px;font-size:12px;line-height:24px;color:#a0a0a0;text-align:right}

</style>

<style>
	.my_review .order_lst{margin-top:40px;border-top:4px solid #000}  
	.my_review .goods .col2,   .my_review .goods .col3{text-align:center}  
	.my_review .goods .col3{width:auto} 
	.my_review .goods .btn_black{min-width:76px}  
	.my_review .goods .btn_black,   .my_review .goods .btn_bor{display:inline-block}
		
	.tab[_ngcontent-c13]{overflow:hidden;margin-top:40px;border-bottom:4px solid #000;font-size:0}
	.tab[_ngcontent-c13]   li[_ngcontent-c13]{margin:0 -1px -1px 0}
	.tab[_ngcontent-c13]   li[_ngcontent-c13], .tab[_ngcontent-c13]   li[_ngcontent-c13]   a[_ngcontent-c13]{display:inline-block}
	.tab[_ngcontent-c13]   li[_ngcontent-c13]   a[_ngcontent-c13]{padding:0 30px;border:1px solid #d4d4d4;font-size:14px;color:#a0a0a0;line-height:48px}
	.tab[_ngcontent-c13]   .selected[_ngcontent-c13]   a[_ngcontent-c13]{border-color:#000;background:#000;color:#fff}
	

	.review_info[_ngcontent-c13]{margin-top:20px;font-size:14px;color:#303033;line-height:24px}
	
</style>
	

</head>
<body>

<div _ngcontent-c0="" class="article_right">
	<router-outlet _ngcontent-c0="">
	</router-outlet>
	<ui-my-order-review _nghost-c13="" ng-version="4.0.3">
	
		<section _ngcontent-c13="" class="my_review">
		<h3 _ngcontent-c13="" class="my_tit nobor">상품후기</h3>
		
		<div _ngcontent-c13="" class="tab">
			<ul _ngcontent-c13="">
				<li _ngcontent-c13="" class="selected">
					<a _ngcontent-c13="">상품후기 쓰기</a>
				</li>
			</ul>
		</div>
			
		<div _ngcontent-c13="" class="review_info">
			<p _ngcontent-c13="" class="pc_view">구매하신 상품에 대한 유용한 정보를 다른 고객과 공유하는 곳으로 솔직담백한 상품후기를 올려주세요.</p>
			<ul _ngcontent-c13="">
				<li _ngcontent-c13="">포토후기 : 사진과 함께 30자 이상의 글을 쓰시면 1,500 point</li>
				<li _ngcontent-c13="">일반후기 : 사진없이 30자 이상의 글을 쓰시면 500 point</li>
				<li _ngcontent-c13="">기타후기 : 1만원 이하의 상품, 사진 유무 상관없이 30자 미만의 글을 쓰신 분께는 기본마일리지 100 point가 적립됩니다.</li>
				<li _ngcontent-c13="">상품후기를 작성은 배송정보상 [출고완료] 이후부터 작성하실 수 있습니다.</li>
				<li _ngcontent-c13="">취소/반품의 경우 해당상품의 후기 및 적립된 마일리지는 자동삭제 됩니다.</li>
				<li _ngcontent-c13="">3개월 이전 구매상품에 대한 후기는 작성하실 수 없습니다.</li>
				<li _ngcontent-c13="">구매 후 3개월이 지난 상품의 후기는 노출되지 않습니다.</li>
				<li _ngcontent-c13="">처음 등록한 후기를 기준으로 마일리지가 지급됩니다.</li>
				<li _ngcontent-c13="">상품후기 수정을 통해서만 내용 변경이 가능하고 상품후기 삭제시 재작성 및 복구 불가합니다.</li>
			</ul>
		        
		</div>
		
		<ui-my-order-review-list _ngcontent-c13="" _nghost-c14="">
			<div _ngcontent-c14="" class="order_wrap">
				<ul _ngcontent-c14="" class="order_lst">
					<li _ngcontent-c14="" class="thead">
						<div _ngcontent-c14="" class="in_td">상품명</div>
						<div _ngcontent-c14="" class="in_td">구매일</div>
						<div _ngcontent-c14="" class="in_td">상품후기쓰기</div>
					</li>
					
					<li _ngcontent-c14="" class="my_tbl_info">
						<p _ngcontent-c14="">작성할 내역이 없습니다.</p>
					</li>
				</ul>
			</div>
			<ruler-basic-pagination _ngcontent-c14="" _nghost-c12="">
			</ruler-basic-pagination>
		</ui-my-order-review-list>
		
		
		</section>	<!-- class="my_review" -->
	</ui-my-order-review>
</div>	<!-- class="article_right" -->

</body>
</html>