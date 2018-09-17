<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 메인페이지 죄측메뉴바 -->
<nav class="mypage_left">
	<jsp:include page="myPageNav.jsp"/>
</nav>

<!-- 메인페이지 우측바디 -->
<article class="mypage_right">
	<section _myPage class="my_grade">
    <ul _myPage>
        <li _myPage>
            <a _myPage href="#">
                <span _myPage>회원등급</span>
                <!----><em _myPage>GREEN</em>
            </a>
            <a _myPage class="benefit_show" href="#">
              	할인혜택 보기
            </a>
        </li>
        <li _myPage>
            <a _myPage href="#">
                <span _myPage>배송중</span>
                <em _myPage>0</em>
            </a>
        </li>
        <li _myPage>
            <a _myPage href="#">
                <span _myPage>마일리지</span>
                <em _myPage>0</em>
            </a>
        </li>
    </ul>
	</section>
	
	<!-- 메인페이지 바디 -->
	<section>
		<jsp:include page="${myPageBody }"/>
	</section>
</article>