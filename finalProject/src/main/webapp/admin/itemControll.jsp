<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/myDialog.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.itemControll {overflow: visible; width: 100%; min-width:800px; height: auto;}
.itemControll > ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.itemControll > ul > li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.itemControll > ul > li:first-child {border-bottom: 2px solid black;}
.itemControll > ul > li > div {width: 100%; overflow: visible; height: auto;}
.itemControll > ul > li > div > div {float: left; text-align: center;}
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(1) {width: 3%;} /* 체크박스 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(2) {width: 8%;} /* 주문번호 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(3) {width: 23%;} /* 상품명 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(4) {width: 10%;} /* 상위카테고리 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(5) {width: 10%;} /* 하위카테고리 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(6) {width: 8%;} /* 가격 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(7) {width: 5%;} /* 할인율 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(8) {width: 8%;} /* 할인된가격 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(9) {width: 17%;} /* 이미지 */
.itemControll > ul > li:nth-child(1)~li > div > div:nth-child(10) {width: 7%;} /* 조회 버튼 */
.itemControll > ul > li:nth-child(2) {border-bottom: 1px solid black;}
.itemControll > ul > li:nth-child(2)~li {border-bottom: 1px solid #d4d4d4;}

#item_detail ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
#item_detail ul li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 0px;}
#item_detail ul li:first-child {border-bottom: 2px solid black;}
#item_detail ul li {width: 100%; overflow: visible; height: auto;border-bottom: 1px solid #d4d4d4;}
#item_detail ul li > div {float: left; text-align: center; width: 16%;border-right:1px solid #d4d4d4;}
#item_detail ul li > div:last-child {border-right: 0px;}
#item_detail input {float: left; text-align: center; width: 50%;padding:.6em .5em; margin: 0px 25%;}

.item_step {width: 100%; overflow: hidden; height: auto;}
.item_step > * {float: left; margin-right: 20px;}
.item_step select {
	width: 150px; /* 원하는 너비설정 */ 
	height: 45px;
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
.item_step select::-ms-expand {display:none}

.item_step div:last-child {float: right; padding-right: 2%;}
.item_step div input {
	width: 150px; /* 원하는 너비설정 */
	height: 45px; 
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit;
	border: 1px solid #999;
}

.btn_black {width: 150px;padding: .6em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.btn_black[disabled] {background: lightgray; border: 1px solid lightgray;}

.item_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.item_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

#item_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#item_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
#item_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;}

.items {width: 100%; float: left;}
.items .item {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.items .item .item_image {width: 200px;}
.items .item img { float: left; vertical-align: middle; padding: 0px 30px; }

#item_detail .pay_info {width: 36%; float: right; border-left: 1px solid #d4d4d4; padding: 0px 2%;}
#item_detail .pay_info > div:nth-child(odd) {float: left; width: 45%; height: 40px; padding-top:10px;}
#item_detail .pay_info > div:nth-child(even) {float: right; width: 45%; height: 45px; text-align: right; padding-top:5px;}
#item_detail .pay_info > div > span {font-family: "Do Hyeon"; font-size: 22pt; font-weight: 700;}

.my_btnbox {margin-top: 10px; text-align: right;}

#myConfirmDialog_frame {
	background-color: rgba(255,255,255,0.8);
    z-index: 1000;
    opacity: 1;
	display: none;
    position: fixed;
    overflow: hidden;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
}
#myConfirmDialog {
	width: inherit;
    height: inherit;
    padding: 30px 40px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    width: 350px;
    height: 150px;
}
#myConfirmDialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
#myConfirmDialog_okBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	left: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
#myConfirmDialog_cancelBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	right: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}

.input_modify {
	outline: none; 
	border: 0px; 
}

#currentPaging{
	border-bottom: 1.5px solid #000;
	cursor: pointer;
	font-weight: 700;
    color: #000;
    text-decoration:none;
	padding: 1px;
	margin: 10px;
}

#paging{
	text-decoration: none;
	cursor: pointer;
	color: #bcafaf;
	text-decoration:none;
	padding: 1px;
	margin: 10px;
}

.modifying{
	outline : none;
	border : 0px;
	border-bottom:2px solid lightgray;
}

</style>
</head>
<body>
<form id="itemList" method="post">
	<section class="itemControll">
		<h3 class="title">재고관리</h3>
		<ul>
			<li>
				<div class="item_step">
					<select id="mainItem" name="main_codename">
						<option value="">전체</option>
						<option value="bras">bras</option>
						<option value="panties">panties</option>
						<option value="mens">mens</option>
						<option value="sport">sport</option>
					</select>
					<div>
						<select id="subItem" name="sub_codename">
							<option value="">전체</option>
						</select>
					</div>
					<div>
						가격(원) : 
						<input type="text" id="price1" class="price" name="price"  placeholder="0" /> ~ 
						<input type="text" id="price2" class="price" name="price"  placeholder="0" />
					</div>
					<div>
						상품명 : 
						<input type="text" id="name" name="name"/>
					</div>
					<div><input type="button" id="itemSearchBtn" class="btn_black" value="검색"></div>
				</div>
			</li>
			<li>
				<div class="item_title">
					<div><input type="checkbox" name="checkAll" id="checkAll"></div>
					<div>상품번호</div>
					<div>상품명</div>
					<div>상위카테고리</div>
					<div>하위카테고리</div>
					<div>가격(원)</div>
					<div>할인율</div>
					<div>할인된 가격</div>
					<div>이미지</div>
					<div></div>
				</div>
			</li>
		</ul>
		<div class="my_btnbox">
			<button type="button" class="btn_black" id="itemAddBtn">상품등록</button>
			<button type="button" class="btn_black" id="checkDelete">선택삭제</button>
		</div>
		<div id="itemControllPaging" align="center" style="padding: 5px 30%;"></div>
	</section>


<section id="item_detail">
	<div class="stepbox">
		상품번호 <span></span>
	</div>
	<div class="items">
		<div class="item">
			<ul>
				<li>
					<div><input type="checkbox" name="checkAll" id="sub_checkAll"></div>
					<div>색깔</div>
					<div>사이즈</div>
					<div>사이즈(브라)</div>
					<div>수량</div>
				</li>
			</ul>
			<div class="my_btnbox">
				<button type="button" class="btn_black" id="sub_checkDelete" style="margin-right:50px;">선택삭제</button>
			</div>
		</div>
	</div>
</section>
</form>

<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div></div>
	</div>
</div>

<!-- confirm 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
			선택한 아이템을 정말 삭제하시겠습니까?
		<button id="myConfirmDialog_okBtn">확인</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>

<input type="hidden" id="checkStatus" value="">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//최초 주문 리스트 불러오기
	conditionalSearch('${param.pg}');
	
 	//조회버튼 클릭 시
	$('body').on('click','#lookUpBtn',function(){
		if($(this).parent().next().prop('tagName')=='SECTION') {
			$('#item_detail').hide();
			$('.itemControll').append($('#item_detail'));
			return true;
		}  
		
		$('#item_detail').hide();
		$(this).parent().parent().append($('#item_detail'));
		$('#item_detail').slideToggle();
		
		var serial = $(this).parent().prev().children().eq(1).text();
		
		$('.stepbox span').text(serial);
		
		 $.ajax({
			type : "POST",
			url : "/finalProject/admin/itemDetailList.do",
			data : {'seq':serial},
			dataType : "json",
			success : function(data){
				$('.item > ul > li:gt(0)').remove();
				$.each(data.list,function(index,items){
					$('<li/>').append($('<div/>').append($('<input/>',{
						type : 'checkbox',
						name : 'sub_seq',
						class : 'check',
						id : 'modSub_seq',
						value : items.sub_seq
					}))).append($('<div/>').append($('<input/>',{
						class : 'input_modify',
						readonly : 'readonly',
						id : 'modColor',
						value : items.color
					}))).append($('<div/>').append($('<input/>',{
						class : 'input_modify',
						readonly : 'readonly',
						id : 'modSize1',
						value : items.size1
					}))).append($('<div/>').append($('<input/>',{
						class : 'input_modify',
						readonly : 'readonly',
						id : 'modSize2',
						value : items.size2==null ? '-':items.size2
					}))).append($('<div/>').append($('<input/>',{
						class : 'input_modify',
						readonly : 'readonly',
						id : 'modQty',
						value : items.qty
					}))).append($('<div/>').append($('<input/>',{
						type : 'hidden',
						id : 'modSeq',
						value : serial
					}))).append($('<div/>').append($('<input/>',{
						type : 'button',
						class : 'btn_black',
						id : 'itemModifyBtn',
						style : 'margin-left : 70px; width : 80px;',
						value : '수정'
					}))).appendTo($('#item_detail ul'));
				});
			}
		});
		
		
	});

	// 수정 버튼 클릭 시
 	$('body').on('click','#itemModifyBtn',function(){
 		if($(this).parent().parent().children().children().eq(1).prop('class') == 'input_modify'){ // 수정 전
 			if($(this).parent().parent().children().find('input.input_modify').eq(3).val() == '-'){
 				$(this).parent().parent().children().find('input.input_modify').not(':eq(3)').prop('class','modifying').prop('readonly',false);
 			}else {
 				$(this).parent().parent().children().find('input.input_modify').prop('class','modifying').prop('readonly',false);
 			}
 			$(this).val('수정완료');
 		}else{ //수정 후
 			if($('#modColor').val() =='' || $('#modSize1').val() =='' || $('#modSize2').val() =='' || $('#modQty').val() ==''){
 				$('#dialog > div').text('값을 입력하세요.');
 				$('#dialog_frame').show();
 			}else{
				$(this).parent().parent().children().find('input.modifying').prop('class','input_modify').prop('readonly',true);
				$(this).val('수정'); 
				
	 			  $.ajax({
					type : "POST",
					url : "/finalProject/admin/itemModify.do",
					data : {'seq' : $('#modSeq').val()
						   ,'sub_seq':$('#modSub_seq').val()
						   ,'color':$('#modColor').val()
						   ,'size1':$('#modSize1').val()
						   ,'size2':$('#modSize2').val()
						   ,'qty':$('#modQty').val()},
					dataType : "text",
					success : function(data){
						if(data == 'modifyOk'){
							$('#dialog > div').text('수정되었습니다.');
							$('#dialog_frame').show();
						}
					}
				});   
 			}
 		}
			
	}); 
	
	 //체크 박스 
	$('#checkAll').click(function(){
		var chk = document.getElementsByName("seq"); 
		if(document.getElementById("checkAll").checked){
			for(var i=0; i<chk.length;i++) 
				chk[i].checked = true; //모두체크
		}else{
			for(var i=0; i<chk.length;i++)
				chk[i].checked = false; //모두 해제
		}
	});
	 
	 //선택삭제
	 $("#checkDelete").click(function(){
		 var isChk = false;
		 var arr = document.getElementsByName("seq");
		 for(var i=0; i<arr.length;i++){
			 if(arr[i].checked){
				 isChk = true;
				 break;
			 }
		 }
		 
		 if(!isChk) {
			 $('#dialog > div').text('한 개 이상 선택해주세요.');
			 $('#dialog_frame').show();
			 return false;
		 }else{
			 $('#myConfirmDialog_frame').show();
		 }
	 });
	 
	 
	 // 조회 시 체크박스
	 //체크 박스 
	$('#sub_checkAll').click(function(){
		var chk = document.getElementsByName("sub_seq"); 
		if(document.getElementById("sub_checkAll").checked){
			for(var i=0; i<chk.length;i++) 
				chk[i].checked = true; //모두체크
		}else{
			for(var i=0; i<chk.length;i++)
				chk[i].checked = false; //모두 해제
		}
	});
	 
	//선택삭제
	 $("#sub_checkDelete").click(function(){
		 var isChk = false;
		 var arr = document.getElementsByName("sub_seq");
		 for(var i=0; i<arr.length;i++){
			 if(arr[i].checked){
				 isChk = true;
				 break;
			 }
		 }
		 
		 if(!isChk) {
			 $('#dialog > div').text('한 개 이상 선택해주세요.');
			 $('#dialog_frame').show();
			 return false;
		 }else{
			 $('#myConfirmDialog_frame').show();
		 }
	 });
	
	
	 $('#dialog_closeBtn').click(function(){
			$('#dialog_frame').hide();
		});
	
	//다이얼로그 이벤트
		$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
			$('#myConfirmDialog_frame').hide();
		});
		$('#myConfirmDialog_okBtn').click(function() {
			$('#myConfirmDialog_frame').hide();
			$('#itemDelete').submit();
		});
		
	//상위 카테고리 변경 시 디비 갔다오기
	$("#mainItem").change(function(){
		$('#subItem').empty();
		$('#subItem').append("<option value=''>전체</option>");
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/getSubList.do",
			dataType : "json",
			data : {'main_codename' : $("#mainItem").val()},
			success : function(data){
				$.each(data.list,function(index,items){
					$('#subItem').append("<option value='"+items+"'>"+items+"</option>")
				});
			}
		});
	});
	
	//가격 입력
 	function number_format(data){
	    var tmp = '';
	    var number = '';
	    var cutlen = 3;
	    var comma = ',';
	    var i;
	    var sign = data.match(/^[\+\-]/);
	    if(sign) {
	        data = data.replace(/^[\+\-]/, "");
	    }
	    len = data.length;
	    mod = (len % cutlen);
	    k = cutlen - mod;
	    for (i=0; i<data.length; i++)
	    {
	        number = number + data.charAt(i);
	        if (i < data.length - 1)
	        {
	            k++;
	            if ((k % cutlen) == 0)
	            {
	                number = number + comma;
	                k = 0;
	            }
	        }
	    }
	    if(sign != null)
	        number = sign+number;
	    return number;
	} 
	
    $("input.price").keyup(function() {
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
        var val = String(this.value);
        if(val.length < 1)
            return true;
        this.value = number_format(val);
    }); 
    
   
  //검색 버튼 클릭시
	$('#itemSearchBtn').click(function(){
		if($('#price1').val() > $('#price2').val()) {
			$('#price1').val("");
			return true;
		}else if($('#price1').val()=='' && $('#price2').val()!='')
			$('#price1').val($('#price2').val());
		else if($('#price1').val()!='' && $('#price2').val()=='')
			$('#price2').val($('#price1').val());
		
		conditionalSearch();
	});
  
  
	// 검색 버튼 클릭 후 리스트 불러오기
	function conditionalSearch(pg) {
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/itemSearchList.do",
			data : {'main_codename':$('#mainItem').val()
				   ,'sub_codename':$('#subItem').val()
				   ,'startPrice':$('#price1').val()
				   ,'endPrice':$('#price2').val()
				   ,'name':$('#name').val()
				   ,'pg' : pg},
			dataType : "json",
			success : function(data){
				$('li:has(.item_item)').remove();
				
				$.each(data.list,function(index,items){
					$('<li/>').append($('<div/>',{
						class : 'item_item'
					}).append($('<div/>').append($('<input/>',{
						type : 'checkbox',
						name : 'seq',
						class : 'check',
						id : 'seq',
						value : items.seq
					}))).append($('<div/>',{
						text : items.seq
					})).append($('<div/>',{
						text : items.name
					})).append($('<div/>',{
						text : items.main_codename
					})).append($('<div/>',{
						text : items.sub_codename
					})).append($('<div/>',{
						text : items.price
					})).append($('<div/>',{
						text : items.discount
					})).append($('<div/>',{
						text : items.price*(1-items.discount)
					})).append($('<div/>',{
						text : items.img
					}))).append($('<div/>').append($('<input/>',{
						type : 'button',
						class : 'btn_black',
						id : 'lookUpBtn',
						style : 'margin-right : 10px; width : 80px;',
						value : '조회'
					}))).appendTo($('.itemControll ul'));
				});
				
				$('#itemControllPaging').html(data.paging.pagingHTML);
			}
		});
	}
	
	//페이지 클릭
	$('#itemControllPaging').on('click','span',function(){
		location.href="#"; //
		$('#item_detail').hide();
		$('.itemControll').append($('#item_detail'));
		var pg = $(this).prop('class');
		conditionalSearch(pg);
	});
	
	//아이템 등록 이동
	$('#itemAddBtn').click(function(){
		location.href='/finalProject/admin/itemAddForm.do';
	});

});
</script>
</body>
</html>