<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Web Speech Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="/Speech_Project/bootstrap/css/bootstrap.min.css" />

<link href="/Speech_Project/css/login.css" rel="stylesheet">

<script type="text/javascript" src="/Speech_Project/js/jquery.js"></script>
<script type="text/javascript"
	src="/Speech_Project/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 30px;
}

pbfooter {
	position: relative;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">

<!-- Jquery Validate Script -->
<script type="text/javascript"
	src="/Speech_Project/js/jquery.validate.js"></script>

<!-- Jquery Validate Script - Validation Fields -->


<script type="text/javascript">
	$(function(){
		var responseMessage = "<c:out value="${Message}" />";
		 if(responseMessage != ""){
	            alert(responseMessage)
	        }
	})
</script>
</head>

<style>
.pbfooter {
	position: relative;
}
</style>

<body
	style="background: url('/Speech_Project/images/bg.JPG') no-repeat center center; height: 700px;">

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-lg-offset-4 col-lg-4" style="margin-top: 100px">
				<div class="block-unit"
					style="text-align: center; padding: 8px 8px 8px 8px;">
					<img src="/Speech_Project/images/face80x80.jpg" alt=""
						class="img-circle"> <br> <br>
					<form class="cmxform" id="signupForm" method="post"
						action="login.do">
						<fieldset>
							<p>
								<input id="email" name="email" type="text" placeholder="e-mail">
								<input id="password" name="pw" type="password"
									placeholder="Password">
							</p>
							<input class="submit btn-success btn btn-large" type="submit"
								value="Login">
						</fieldset>
					</form>
				</div>

			</div>


		</div>
	</div>


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="/Speech_Project/js/bootstrap.js"></script>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>