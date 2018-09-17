<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/itemView.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.option_lstbx {
	width: 100%;
	height: auto;
	overflow: hidden;
	margin-bottom: 30px;
	margin-top: 20px;
	
}
.option_color {
	float: left;
	width: 20%;
}

.option_size1 {
	float: left;
	width: 20%;
}

.option_size2 {
	float: left;
	width: 20%;
}

.option_num{
	float: left;
	width: 30%;
}

.option_price{
	float: right;
	width: 25%;
}
.numcountbx button{
	float: left;
	position: relative;
    width: 28px;
    height: 28px;
    border: 1px solid #cdcdcd;
    border-radius: 0;
    background: #fff;
    font-size: 15px;
    color: #5d5d5d;
    cursor: pointer;
    text-decoration: none;
    margin: 0px;

}


.numcountbx input{
	float: left;
	width: 35px;
    height: 28px;
    border: 1px solid #cbcbcb;
    border-width: 1px 0;
    margin: 0px;
    font-size: 13px;
    color: #666;
    text-align: center;
    box-sizing: border-box;
}


#deleteBtn{
	overflow: visible;
    width: 16px;
    height: 16px;
    margin: -2px 0 2px 7px;
    padding: 1px;
    box-sizing: border-box;
    background: transparent;
    position: fixed;
}

.result_total{
	border-top: 2px solid #000;
	text-align: right;
    line-height: 32px;
}

.num{
	font-size: 22px;
    color: #ff4800;
}
a#MOVE_ON_BTN{
   position: fixed; /* 화면에 고정 */
   right: 3%; /* 버튼 위치 설정 */
   bottom : 50px; /* 버튼 위치 설정 */
   display: none; /*화면에서 숨김  */
   z-index: 999;/* 다른 태그들 보다 위에 오도록 */   
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/itemView.js">
</script>

</head>
<body>
<div style="width: 80%; max-width: 2100px; padding: 0px 10%;">
	<div class="detail_category">
		<ul >
		    <li class="category1" >
	            <select id="stat1">
	            	<option>MAIN</option>
	            </select>
		    </li>
		    <li class="category2" >
	              <select id="stat2">
	           		<option>SUBMAIN</option>
	              </select>
		    </li>
		</ul>
	</div>
	
	 <!---->
		 <div  class="image" id="ProductDetail">
		       <img  class="imagebox"  id="ProductImage">
			   <div  class="item_detail_view">
					            <h3  class="name" id = "ProductName">
					                
					            </h3>
	   		      
	
		 				
					            <div  class="sale">
					                <div  class="o" id="ProductPrice">
					                    
					                </div>
					                
					                <div  class="s" id="ProductDiscount">
					                    
					                </div>
					            </div>
					    <div class="policy" id="savePoint">
					    </div>
	
	
	
	
	
						<div>
							<div id="allSelect">
						            <div id="select1" class="selbx">
									    <select id="colorSlt">
									        <option value="">COLOR를 선택해주세요</option>
									    </select>
								    </div>
								
					
				                
								         <div id="select2" class="selbx">
										    <select  id="sizeSlt">
										        <option  value="">SIZE를 선택해주세요</option>
										    </select>
										</div>
				                  
				                  
				                 
								         <div id="select3" class="selbx" style="display:none;">
										    <select  id="cupSlt">
										        <option  value="">SIZE를 선택해주세요</option>
	
										    </select>
										</div>
										
										<div id=totalPrice style="float: left; width: 100%;" align="center"></div>				
				             </div>
						
	
						<div  class="chooseBox">  
				          <div >
				                    	
				 				<a  class="shopbag" id="checkLogin1">SHOPPING BAG</a>
				  				<a  class="buyNow" id="checkLogin2">BUY NOW</a>
		
						  </div>
				        </div>
					</div>
					
				</div>
			</div>
	<!---->
	<!---->
	
	
	
				<div  class="topend">
				    	<div  ><!---->
				    		<a  href="#top" class="btnTop"><span class="top">TOP</span></a>
						</div>
				</div>         
	
	
	
	      
	   	<a id="MOVE_ON_BTN" href="#"><img src="../image/move_on_top.png" width="65px" height="65px"></a>
	<div>
	  <jsp:include page="../itemView/itemViewMid1.jsp"/>
	</div> 
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

   /* top버튼 */
  $("body").scrollTop(0);
  $(function(){
		$(window).scroll(function(){
		   if($(this).scrollTop() > 400){
		      $('#MOVE_ON_BTN').fadeIn();
		   }else{
		      $('#MOVE_ON_BTN').fadeOut();
		   }/*스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고 사라지도록 설정   */
		});
		
		$('#MOVE_ON_BTN').click(function(){//버튼 클릭 이벤트 
		   $('html, body').animate({scrollTop: 0}, 400);//animation을 걸어서 화면 맨위로 이동하도록 설정 
		   return false;
		}); 
		
		
		//맨 위에 셀렉 박스
		$.ajax({
			type : 'GET',
			url : '/finalProject/itemView/checkMain_codename.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.list, function(index, item){				
					$('.category1 > select').append($('<option/>',{
						value : item,
						text : item
					}))
				});
			}
		});
		$('.category1 select').change(function(){
			$.ajax({
				type : 'GET',
				url : '/finalProject/itemView/checkSub_codename.do',
				data : {'main_codename' : $(this).val() }, 
				dataType : 'json',
				success : function(data){
					//alert(JSON.stringify(data));
					$('#stat2 > option:gt(0)').remove();
					
					$.each(data.list, function(index, item){
						$('#stat2').append($('<option/>', {
							value : item,
							text : item
						}))
					});
				}
			});
		});
   
	//로그인이 안되어 있고 장바구니 담기 및 구매하기 눌렀을 시 로그인창으로	
		$('#checkLogin1').click(function(){
			if('${memberDTO}'=='') {
				location.href='/finalProject/member/loginForm.do';
			}else {
				location.href='/finalProject/itemView/itemView.do';
				//구매하려고 한 상품 저장되게 하기
				//장바구니 다이얼로그 띄우기 (장바구니에 저장되었습니다.)
				//다이얼로그 내에 장바구니 버튼 만들기
				
			}
		});
		
		$('#checkLogin2').click(function(){
			if('${memberDTO}' == '') {
				location.href='/finalProject/member/loginForm.do';
			}else {
				location.href='/finalProject/or/itemView.do';
				//구매하려고 한 상품 저장되고 오더페이지 연결 및 바로 띄우기
			}
			
		});

		//color 상품 DB가져와야됨
		$.ajax({
			type : 'POST',
			url : '/finalProject/itemView/getColor.do',
			data : 'seq=${param.seq}',
			dataType : 'json',
			success : function(data) {
				//alert('color:'+JSON.stringify(data));
				$.each(data.list, function(index, item){
					$('#colorSlt').append($('<option/>',{
						value : item,
						text : item.toUpperCase()
					}));
				});
			}
		});	
		
		//size1
		$('#colorSlt').change(function(){
			var count=$('#colorSlt option:selected').val();
			$('#sizeSlt').children('option:gt(0)').remove();
			
			if(count == ""){
				
			} else {
				$.ajax({
					type : 'POST',
					url : '/finalProject/itemView/getSize1.do',
					data : 'seq=${param.seq}&color='+$('#colorSlt').val(),
					dataType : 'json',
					success : function(data) {
						//alert(JSON.stringify(data));
						$.each(data.list, function(index, item){
							$('#sizeSlt').append($('<option/>',{
								value : item,
								text : item.toUpperCase()
							}));					
						});
					}
				});	
			 }
		});
		
		//size2
		
		$('#sizeSlt').change(function(){
			var count=$('#sizeSlt option:selected').val();
			$('#cupSlt').children('option:gt(0)').remove();
			
			if(count == ""){
				
			} else {
				$.ajax({
					type : 'POST',
					url : '/finalProject/itemView/getSize2.do',
					data : 'seq=${param.seq}&color='+$('#colorSlt').val()+'&size1='+$('#sizeSlt').val(),
					dataType : 'json',
					success : function(data) {
						//alert(JSON.stringify(data));
						$.each(data.list, function(index, item){
							$('#cupSlt').append($('<option/>',{
								value : item,
								text : item.toUpperCase()
							}));					
						});
					}
				});	
			 }
		});
		// 
		
		//상품 이미지, 상품명, 가격, 디스카운트 가져와야됨
		$.ajax({
			type : 'POST',
			url : '/finalProject/itemView/getProductDetail.do',
			data : 'seq=${param.seq}',
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				
				$('img#ProductImage').prop('src', '../image/'+data.itemDTO.main_codename+'/'+data.itemDTO.img);
				$('#ProductName').text(data.itemDTO.name);
				$('#ProductPrice').text(data.itemDTO.price);
				if(data.itemDTO.discount == '0'){
					$('#ProductPrice').text(data.itemDTO.price).css('color','red').css('font-size','20pt').css('text-decoration','none');
					$('#ProductDiscount').hide();
				} else {
					$('#ProductDiscount').text(data.itemDTO.price*(1-data.itemDTO.discount));
				}
				$('#savePoint').text('적립금 : '+ data.itemDTO.price*(1-data.itemDTO.discount)*0.01).css('font-size','11pt');
				
				if(data.itemDTO.main_codename=='bras') $('#select3').show(); //사이즈2를 미리 숨겨놓고 브라스 일 때 생성
			}
		});
		//상품 2 눌렀을때, 아래 창 뜨게 하기 

	// 아래 지정된 가격 창 뜨게 하기		
		$('#cupSlt').change(function(){
			var count=$('#cupSlt option:selected').val();
			alert($('#cupSlt option:selected').val());
			if(count == ""){
				$('#totalPrice').hide();
			}else{
					$('<div/>',{ 
						class : 'option_resultbx'
					}).append($('<div/>',{
						class : 'option_lstbx'
					}).append($('<div/>',{
						class : 'option_color'
					}).append($('<span/>',{
						text: 'color'
					}))).append($('<div/>',{
						class : 'option_size1'
					}).append($('<span/>',{
						text: 'size1'
					}))).append($('<div/>',{
						class : 'option_size2'
					}).append($('<span/>',{
						text: 'size2'
					}))).append($('<div/>',{
						class : 'option_num'
					}).append($('<span/>',{
						class : 'numcountbx'
					}).append($('<button/>',{
						text: '-'					
					})).append($('<input/>',{
						type: 'text',
						value: '1'
					})).append($('<button/>',{
						text:'+'
					})).append($('<div/>',{
						class :'option_price'
					}).append($('<span/>',{
						class : 'price'
					}).append($('<i/>',{
						class : 'material-icons',
						id : 'deleteBtn',
						text: 'highlight_off'
					}))))))).append($('<div/>',{
						class : 'result_total'						
					}).append($('<span/>',{
						class : 'total_price',
						text : '총 상품 금액'
					})).append($('<span/>',{
						class : 'num',
						text : '원'
					}).append($('<span/>',{	
					})))).appendTo($('#totalPrice'));
				$('#totalPrice').show();		
			}		
		});
		
	
 });
   	
</script>
</body>
</html>