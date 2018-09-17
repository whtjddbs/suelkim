<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>


</head>
<link rel="stylesheet" href="../css/template.css">
<div class="footer_main">
	<div class="footer_cs_section">
		<h2 class="footer_title">SERVICE CENTER</h2>
		<ul class="footer_cs_section_info">
			<li class="footer_phone">1234-1234</li>
			<li >AM 10:00 ~ PM 05:00</li> 
            <li >Off-time PM 12:00 ~ PM 02:00</li>
            <li >DAY OFF (SATURDAY. SUNDAY, HOLIDAY)</li>
		</ul>
		<a  class="footer_FAQ_Btn" href="">FAQ</a>
		<div class="footer_findStore" style="float:right; margin-right:10px;">
			<img id="footer_findStore_Btn"src="../image/findStore.png" width="50px" height="50px">
		</div>
	
		
	</div>
	<div class="footer_half">
		<div class="footer_menu_section">
			<ul class="footer_menu_section_list">
				<li>
					<h2 class="footer_menu_section_list_title">ABOUT US</h2>
					<a  href="">회사소개</a>
                    <a  href="">상시 할인 혜택</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">MY ORDER</h2>
					<a  href="">주문배송</a>
                    <a  href="">취소/교환/반품 내역</a>
                    <a  href="">상품후기 내역</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">MY ACCOUNT</h2>
					<a  href="">회원정보수정</a>
                    <a  href="">회원등급</a>
                    <a  href="">마일리지현황</a>
				</li>
				<li>
					<h2 class="footer_menu_section_list_title">HELP</h2>
					<a  href="">1:1 상담내역</a>
                    <a  href="">상품 Q&A내역</a>
                    <a  href="">공지사항</a>
                    <a  href="">FAQ</a>
				</li>
			</ul>
		</div>
		<div class="footer_notice_section">
			<h2 class="footer_notice_section_list_title">NOTICE</h2>
			<ul>
				<li>
					<a  href="">[당첨자발표] BbanB 이벤트 당첨자 발표</a>
				</li>
				<li>
					<a  href="">[당첨자 발표] BbanB 상품 후기 이벤트 당첨자 발표</a>
				</li>
				<li>
					<a  href="">[당첨자 발표] BbanB 댓글 이벤트 당첨자 발표</a>
				</li>
				<li>
					<a  href="">[채용] BbanB 비디오그래퍼 및 포토그래퍼 모집 (경력 및 신입)</a>
				</li>
				<li>
					<a  href="">[채용] BbanB 앱개발경력사원 모집 (iOS, Android, 주문)</a>
				</li>
			</ul>
		</div>
	</div>
	<footer class="footer_info">
		<div class="footer_info_documentation">
			<a href="/finalProject/etc/privacyPolicy.do" style="border-right: 1px solid lightgray; padding-right: 10px;height:18px;">개인정보취급방침</a>
			<a href="/finalProject/etc/termsAndConditions.do" style="padding-left:10px;">이용약관</a>
		</div>
		<div class="footer_info_corp">
			<div>
				<dl  class="footer_info_corp_item">
        			<dt >프로젝트명</dt>
        			<dd >BbanB</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >학원</dt>
        			<dd >서울특별시 종로구 돈화문로 26 단성사</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >팩스</dt>
        			<dd >000-0000-0000</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >사업자등록번호</dt>
        			<dd >111-11-1111</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >프로젝트발표</dt>
        			<dd >2018-단성사307-1011 
        				<a  class="footer_info_corp_Btn" target="_blank">사업자정보확인</a>
        			</dd>
        		</dl>
			</div>
			<div>
				<dl  class="footer_info_corp_item">
        			<dt >고객센터</dt>
        			<dd ><a  href="tel:1234-1234">1234-1234</a></dd>
        			<dd >평일 10:00 ~ 17:00 / Off-time 12:00 ~ 14:00 (토/일/공휴일 휴무)</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >이메일</dt>
        			<dd ><a  href="">BbanB@project.com</a></dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >프로젝트그룹</dt>
        			<dd >6남2녀</dd>
        		</dl>
        		<dl  class="footer_info_corp_item">
        			<dt >개인정보책임자</dt>
        			<dd >6남2녀</dd>
        		</dl>
			</div>
		</div>	
	</footer>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$('#footer_findStore_Btn').click(function(){
	//alert("~~");
	window.open('../etc/findStore.jsp','','width=1000 height=700');
});
</script>

</html>