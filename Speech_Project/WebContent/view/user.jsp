<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Web Speech Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="/Speech_Project/bootstrap/css/bootstrap.min.css" />

<link href="/Speech_Project/css/main.css" rel="stylesheet">
<link href="/Speech_Project/css/font-style.css" rel="stylesheet">
<link href="/Speech_Project/css/register.css" rel="stylesheet">


<script type="text/javascript" src="/Speech_Project/js/jquery.js"></script>
<script type="text/javascript"
	src="/Speech_Project/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 60px;
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
<script type="text/javascript">
	function btn() {

		window.open('check.jsp?id=' + document.form.id.value + '', '',
				'width=400,height=300');

	}
	function joinchk() {
		var regx = /^[a-zA-Z0-9]*$/;
		var id = document.form.id.value;
		var pw = document.form.pw.value;
		if (id.length == 0 || id == null) {
			alert("아이디를 입력하시오");
			document.form.id.focus();
			return;
		}
		if (!regx.test(id)) {
			alert("아이디는 영어, 숫자만 입력가능합니다.");
			document.form.id.focus();
			return false;
		}
		if (pw.length < 6 || pw == null) {
			alert("비밀번호는 6글자이상입니다^^");
			document.form.pass.focus();
			return;
		}
		if (!regx.test(pass)) {
			alert("비밀번호는 영어, 숫자만 입력가능합니다.");
			document.form.pass.focus();
			return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="row">

			<div class="col-lg-6">

				<div class="register-info-wraper">
					<div id="register-info">
						<div class="cont2">
							<div class="thumbnail">
								<img src="/Speech_Project/images/face.jpg" alt="Marcel Newman"
									class="img-circle">
							</div>
							<!-- /thumbnail -->
							<h2>개발자 : 김진영</h2>
						</div>
						<div class="row">
							<div class="col-lg-3">
								<div class="cont3">

									<p>
										<ok>Mail:</ok>
										wjdtla94@naver.com
									</p>
									<p>
										<ok>Address:</ok>
										서울
									</p>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="cont3">
									<p>
										<ok>Development:</ok>
										2020-12-04
									</p>
								</div>
							</div>
						</div>
						<!-- /inner row -->
						<hr>
						<div class="cont2">
							<h2>Choose Your Option</h2>
						</div>
						<br>
						<div class="info-user2">
							<span aria-hidden="true" class="li_user fs1"></span> <span
								aria-hidden="true" class="li_settings fs1"></span> <span
								aria-hidden="true" class="li_mail fs1"></span> <span
								aria-hidden="true" class="li_key fs1"></span> <span
								aria-hidden="true" class="li_lock fs1"></span> <span
								aria-hidden="true" class="li_pen fs1"></span>
						</div>


					</div>
				</div>

			</div>

			<div class="col-sm-6 col-lg-6">
				<div id="register-wraper">
					<form id="register-form" name="form" class="form" action="user.do"
						method="post">
						<legend>회원가입</legend>

						<div class="body">
							<!-- first name -->
							<label for="id">ID</label> <input name="id" id="id"
								class="input-huge" type="text">
							<div class="check_font" id="idcheck" style="color: blue;"></div>
							<input class="btn btn-success" type="button" onclick="btn()"
								value="중복체크"><br />
							<!-- last name -->
							<br> <label for="pw">PW</label> <input name="pw"
								class="input-huge" type="text">
							<!-- username -->
							<br> <label>이름</label> <input class="input-huge" type="text"
								name="username">
							<!-- email -->
							<br> <label>E-mail</label> <input class="input-huge"
								type="text" name="email"> <br>
						</div>

						<div class="footer">
							<!--         		            <label class="checkbox inline"> -->
							<!--         		                <input type="checkbox" id="inlineCheckbox1" value="option1"> 동의 -->
							<!--         		            </label> -->
							<button type="submit" class="btn btn-success" onclick="joinchk">가입</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>