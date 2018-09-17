<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/template.css">
</head>

<body>
<header>
	<jsp:include page="../template/header.jsp"/>
</header>

<section style="overflow:hidden; height:auto; width: 100%; min-width: 1000px;">
		<jsp:include page="${display }"/>
</section>

<footer>
	<jsp:include page="../template/footer.jsp"/>
</footer>
</body>

</html>