<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>마일리지</title>
    
<style>
    ul{
    	list-style:none;
    	padding-left:0px; 
    	text-decoration:none;
    }
    body, input, select, textarea, button, a {
    	text-decoration:none;
        -webkit-text-size-adjust:none;
        font-family: "campton", "Apple SD Gothic Neo", NanumBarunGothic, "나눔바른고딕", Malgun Gothic, "맑은 고딕", dotum, sans-serif;
    }
</style>
    
<style> 
	a,   button{outline:none}

	/* 상단 여백 */
	.article_right[_ngcontent-c0]{overflow:hidden;}
	.article_right[_ngcontent-c0]   .article_right[_ngcontent-c0], .cs_wrap[_ngcontent-c0]   .article_left[_ngcontent-c0], .cs_wrap[_ngcontent-c0]   .article_right[_ngcontent-c0]{padding-top:0}
	
	@media screen and (max-width:540px){
		.article_right[_ngcontent-c0]{padding-top:0}
	}
	
 	/* 마일리지현황 관련 style */>
 	.mytit_area{padding-bottom:10px;border-bottom:4px solid #000}
	.mytit_area .tit{font-size:22px;line-height:30px}
	.mytit_area .txt{margin-top:4px;font-size:14px;line-height:26px}
	.my_tit{position:relative;padding-bottom:10px;border-bottom:4px solid #000;font-size:22px;color:#000;line-height:30px;font-weight:500}
	.my_tit{margin: 0px;}
	.my_tit span{font-size:13px;line-height:30px}
	.my_tit.nobor{padding:0;border:0}
	
	/* 적립마일리지 표 관련 style */
	.my_tbl_tit{border-bottom:1px solid #000;font-weight:700}
	.my_tbl_lst .my_tbl_tit .tit,   .my_tbl_lst .my_tbl_tit .type{text-align:center}
	.my_tbl_lst .my_tbl,   .my_tbl_lst>li{border-bottom:1px solid #d4d4d4}
	.my_tbl_lst .btn_bor{position:absolute;top:50%;right:20px;width:43px;height:34px;margin-top:-17px;border-radius:2px;line-height:34px}
	.my_tbl_info{table-layout:fixed;position:relative;box-sizing:border-box;color:#303033}
	.my_tbl_info,   .my_tbl_info .infoinner{display:table;width:100%}
	.my_tbl_info p{display:table-cell;min-height:50px;text-align:center;vertical-align:middle;font-size:14px;box-sizing:border-box}

</style>
	

<style>	
	/* 마일리지 포인트 부분 */	
	.my_tbl_mymileage[_ngcontent-c10]{border-top:0}
	.my_tbl_mymileage[_ngcontent-c10] ul {margin: 0px;}
	.my_tbl_mymileage[_ngcontent-c10]   p[_ngcontent-c10]{padding:15px 1%;font-size:14px}
	.my_tbl_mymileage[_ngcontent-c10]   .tit[_ngcontent-c10]{display:none}
	
	/* 적립 마일리지 탭 */
	.tab2[_ngcontent-c10]{overflow:hidden;margin-top:30px;border-bottom:4px solid #000;font-size:0}
	.tab2[_ngcontent-c10]   li[_ngcontent-c10]{margin:0 -1px -1px 0}
	.tab2[_ngcontent-c10]   li[_ngcontent-c10], .tab2[_ngcontent-c10]   li[_ngcontent-c10]   a[_ngcontent-c10]{display:inline-block}
	.tab2[_ngcontent-c10]   li[_ngcontent-c10]   a[_ngcontent-c10]{padding:0 30px;border:1px solid #d4d4d4;font-size:14px;color:#a0a0a0;line-height:48px}
	.tab2[_ngcontent-c10]   .selected[_ngcontent-c10]   a[_ngcontent-c10]{border-color:#000;background:#000;color:#fff}
	
</style>




</head>
	
<body>   
	<div _ngcontent-c0="" class="article_right">	<!-- 오른쪽 화면(메인) -->
		<router-outlet _ngcontent-c0=""></router-outlet>
			<ui-mileage _nghost-c10="" ng-version="4.0.3">
                
				<!-- 마일리지 부분 -->
				<div _ngcontent-c10="" class="my_notice">
					<h3 _ngcontent-c10="" class="my_tit">마일리지 현황</h3>
		    					
					<!-- 마일리지 표 -->
					<ul _ngcontent-c10="" class="my_tbl_lst my_tbl_mymileage">
						<li _ngcontent-c10="" class="my_tbl_tit">
							<div _ngcontent-c10="" class="my_tbl_info">
								<p _ngcontent-c10="" class="mileage">현재 마일리지</p>
								<p _ngcontent-c10="" class="mileage2">적립 마일리지</p>
								<p _ngcontent-c10="" class="mileage3">사용한 마일리지</p>
								<p _ngcontent-c10="" class="mileage4">소멸된 마일리지</p>
							</div>
						</li>
						<li _ngcontent-c10="">
							<div _ngcontent-c10="" class="my_tbl_info">
								<!-- 포인트 정보 가져오기 -->
								<p _ngcontent-c10="" class="mileage"><span _ngcontent-c10="" class="tit">현재 마일리지</span>0 point</p>
								<p _ngcontent-c10="" class="mileage2"><span _ngcontent-c10="" class="tit">적립 마일리지</span>0 point</p>
								<p _ngcontent-c10="" class="mileage3"><span _ngcontent-c10="" class="tit">사용한 마일리지</span>0 point</p>
								<p _ngcontent-c10="" class="mileage4"><span _ngcontent-c10="" class="tit">소멸된 마일리지</span>0 point</p>
							</div>
						</li>
					</ul>	<!-- class="my_tbl_lst my_tbl_mymileage" -->
					    
					<!-- 마일리지 안내 -->
					<ul _ngcontent-c10="" class="my_guide_info">
						<li _ngcontent-c10="">201X년 XX월 XX일 소멸 대상 마일리지 : 0 포인트</li>	<!-- 적용날짜 / 포인트 가져와야 함 -->
					    <li _ngcontent-c10="">마일리지는 부여된 해로부터 5년 이내에 사용하셔야 합니다.</li>
					    <li _ngcontent-c10="">특정 이벤트 당첨 마일리지는 이벤트 기한내에서만 사용이 가능하고 미사용 적립금은 소멸됩니다.</li>
					</ul>
					   
				</div>	<!-- class="my_notice" 마일리지 부분-->
				<br><br><br>


				<section _ngcontent-c10="" class="my_mileage2">
					<div _ngcontent-c10="">
						<h3 _ngcontent-c10="" class="my_tit nobor">마일리지 적립 및 사용</h3>
						<p _ngcontent-c10="" class="my_tit_dsc">마일리지는 적립 및 사용하신 내역입니다. (주문 마일리지는 주문 내역 조회에서 확인 가능합니다.)</p>
						<div _ngcontent-c10="" class="tab2">
							<ul _ngcontent-c10="" id="tabMileage">
								<li _ngcontent-c10="" class="selected">
									<a _ngcontent-c10="">적립 마일리지</a>	<!-- 적립마일리지 뜨게 href 적용 -->
								</li>
							</ul>
						</div>
					
						<div _ngcontent-c10="">
							<ui-mileage-lists _ngcontent-c10="" _nghost-c11="">
								<ul _ngcontent-c11="" class="my_tbl_lst my_tbl_mileage">
									<li _ngcontent-c11="" class="my_tbl_tit">
										<div _ngcontent-c11="" class="my_tbl_info">
											<p _ngcontent-c11="" class="mileage">적용일자</p>
											<p _ngcontent-c11="" class="mileage2">적용내용</p>
											<p _ngcontent-c11="" class="mileage3">마일리지</p>
											<p _ngcontent-c11="" class="mileage4">관련주문번호</p>
										</div>
									</li>
									    
									<li _ngcontent-c11="">
										<div _ngcontent-c11="" class="my_tbl_info">
											<p _ngcontent-c11="">해당 마일리지 내역이 없습니다.</p>
									    </div>
									</li> 
								</ul>	<!-- class="my_tbl_lst my_tbl_mileage" -->
								<ruler-basic-pagination _ngcontent-c11="" _nghost-c12="">
								</ruler-basic-pagination>
							</ui-mileage-lists>
					    </div>
					</div>
					  
					<br><br> 
					 
					<!-- 마일리지 사용기준(수정 필요 시 수정) -->
					<div _ngcontent-c10="">
					    <h3 _ngcontent-c10="" class="my_guide_tit">마일리지 사용기준 및 사용기한</h3>
					    <ul _ngcontent-c10="" class="my_guide_info">
					        <li _ngcontent-c10="">마일리지는 구매금액 제한 없이 현금처럼 사용하실 수 있습니다.</li>
					        <li _ngcontent-c10="">마일리지는 부여된 해로부터 5년 이내에 사용하셔야 합니다.</li>
					        <li _ngcontent-c10="">특정 이벤트 당첨 마일리지는 이벤트 기한내에서만 사용이 가능하고 미사용 적립금은 소멸됩니다.</li>
					        <li _ngcontent-c10="">마일리지는 부여 된 순서로 사용 되며 해당 기간 내에 사용하지 않으실 경우, 잔여 마일리지는 1년 단위로 매해 12월 31일 자동 소멸 됩니다.</li>
					        <li _ngcontent-c10="">주문적립 마일리지는 배송완료일 기준 7일 시점으로 적립 됩니다.</li>
					    </ul>
					</div>
				</section>	<!-- class="my_mileage2" -->
					
				</ui-mileage>
            </div>	<!-- class="article_right" 오른쪽 화면(메인) -->

</body>
</html>

