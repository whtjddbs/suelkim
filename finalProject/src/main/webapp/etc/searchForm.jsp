<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<div class="searchForm_shop_wrap">
	<div class="searchForm_searchfield">
		<div class="searchForm_search_wrap" style="max-width:700px; margin: 0 auto; padding: 80px;">
			<form action="#">
				<div class="searchForm_searchinput" style="position:relative; padding-right: 60px; border-bottom: 6px solid #000;">
					
					<div class="searchForm_suggestbx">
						<input class="searchForm_search-input" placeholder="Search" type="search" style="display: block; width: 100%; height: 100%; font-size: 30px;border: 0; background: #fff; color: 333; outline: none;">
					
					<button class="searhForm_btn_search"></button>
					<button class="searchForm_btn_clear"></button>
					</div><!--searchForm_suggestbx  -->
					
					<div class="searchForm_suggestbx" style="/* position:absolute; */ top:800px; width: 100%; height: 500px; background:red;">
							<ul class="keywordList">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div><!-- searchForm_suggest_layer -->
				</div><!--searchForm_searchinput  -->
			</form>
			
		</div><!-- searchForm_search_wrap -->
	</div><!-- searchForm_Searchfield -->
	<div class="searchForm_category">
	
	</div>
</div><!-- searchForm_shop_wrap -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	$('.searchForm_suggestbx:eq(0)').click(function(){
	$('.searchForm_suggestbx:eq(1)').toggle();		
	});
}); */
</script>
</html>