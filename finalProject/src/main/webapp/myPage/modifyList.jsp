<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.modifyList_header {overflow:hidden; height: auto; padding-bottom:10px; border-bottom: 4px solid black;}
.modifyList h3 {float: left; margin: 0px;}
.modifyList_tab {
	float: right;
	overflow: hidden;
	height: auto;
}
.modifyList_tab ul {margin: 0px;}
.modifyList_tab ul li{
	list-style: none;
	display: list-item;
	float: left;
	padding: 2px 20px;
	font-size: 13px;
	vertical-align: bottom;
	color: #5d5d5d;
	cursor: pointer;
}
.modifyList_tab ul li:nth-child(1)~li {border-left: 1px solid #d4d4d4;}
.modifyList_tab ul li.active {
	color: black;
	font-weight: 700;
}
.modifyList_table {width: 100%; border-collapse: collapse;}
.modifyList_table thead td {text-align: center; border-bottom: 1px solid black; padding: 10px 0px;}
.modifyList_table tbody td {padding: 10px 0px; text-align: center; font-weight: 700; border-bottom: 1px solid #d4d4d4;}
.modifyList_table tbody td:nth-child(2) {text-align: left; font-weight: 300;}
.modifyList_table tbody td a {cursor: pointer; text-decoration: none; color: black;}
</style>

<section class="modifyList">
	<div class="modifyList_header">
		<h3>취소/교환/반품 내역</h3>
		<div class="modifyList_tab">
			<ul>
				<li class="active">ALL</li>
				<li>주문취소</li>
				<li>상품교환</li>
				<li>반품접수</li>
			</ul>
		</div>
	</div>
	<table class="modifyList_table">
		<thead>
			<tr>
				<td width="20%">주문번호</td>
				<td width="35%">접수제목</td>
				<td width="15%">접수일자</td>
				<td width="15%">진행상태</td>
				<td width="15%">완료일자</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2018082900001</td>
				<td><a href="#">사이즈가 안맞아요!!</a></td>
				<td>2018.08.31</td>
				<td>반품접수</td>
				<td>2018.08.30</td>
			</tr>
		</tbody>
	</table>
</section>

<script>
$(document).ready(function(){
	$('.modifyList_tab li').click(function(){
		$('.modifyList_tab li').removeClass('active');
		$(this).addClass('active');
	});
});
</script>
