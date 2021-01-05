<%@page import="dto.Keyword"%>
<%@page import="dto.Weather"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dto.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>음성 웹 서핑 프로그램</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<link rel="stylesheet" type="text/css"
	href="/Speech_Project/bootstrap/css/bootstrap.min.css" />

<link href="/Speech_Project/css/main.css" rel="stylesheet">
<link href="/Speech_Project/css/font-style.css" rel="stylesheet">
<link href="/Speech_Project/css/flexslider.css" rel="stylesheet">

<script type="text/javascript" src="/Speech_Project/js/jquery.js"></script>
<script type="text/javascript"
	src="/Speech_Project/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/Speech_Project/js/lineandbars.js"></script>

<script type="text/javascript" src="/Speech_Project/js/dash-charts.js"></script>
<script type="text/javascript" src="/Speech_Project/js/gauge.js"></script>

<!-- NOTY JAVASCRIPT -->
<script type="text/javascript"
	src="/Speech_Project/js/noty/jquery.noty.js"></script>
<script type="text/javascript"
	src="/Speech_Project/js/noty/layouts/top.js"></script>
<script type="text/javascript"
	src="/Speech_Project/js/noty/layouts/topLeft.js"></script>
<script type="text/javascript"
	src="/Speech_Project/js/noty/layouts/topRight.js"></script>
<script type="text/javascript"
	src="/Speech_Project/js/noty/layouts/topCenter.js"></script>

<!-- You can add more layouts if you want -->
<script type="text/javascript"
	src="/Speech_Project/js/noty/themes/default.js"></script>
<!-- <script type="text/javascript" src="assets/js/dash-noty.js"></script> This is a Noty bubble when you init the theme-->
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<script src="/Speech_Project/js/jquery.flexslider.js"
	type="text/javascript"></script>

<script type="text/javascript" src="/Speech_Project/js/admin.js"></script>

<style type="text/css">
body {
	text-align: center;
	padding-top: 60px;
}

button {
	padding: 8px;
	border: 0;
	outline: 0;
}

.img-circle:active {
	background-color: #FF8C00;
	box-shadow: 0 5px #808080;
	transform: translateY(4px);
}

#message {
	color: #996600;
}

.textWrapper {
	width: 800px;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
}

.textbox {
	height: 100px;
	flex: 1;
	border: 1px solid #d3d3d3;
	margin: 5px 15px;
	border-radius: 6px;
	text-align: center;
	padding: 16px;
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

	function btn(str) {
		if (str == 'search') {
			window.location.href = "search.do";
		}else if(str == 'chart'){
			window.location.href = "chart.do";
		}else if(str == 'weather'){
			window.location.href = "weather.do";
		}
	}
// 	$(function(){
// 		var responseMessage = "<c:out value="${Message}" />";
// 		 if(responseMessage != ""){
// 	            alert(responseMessage)
// 	            		var msg = new SpeechSynthesisUtterance(); //전역 SpeechSynthesis 인스턴스의 큐 끝에 추가
// 		var voices = window.speechSynthesis.getVoices(); // 사용 가능한 음성을 반환
// 		//msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
// 		msg.voiceURI = 'native';
// 		msg.volume = 1; // 0 to 1
// 		msg.rate = 1.3; // 0.1 to 10 //말하기 속도
// 		//msg.pitch = 2; //0 to 2
// 		msg.text = responseMessage;
// 		msg.lang = 'ko-KR';

// 		window.speechSynthesis.speak(msg);
// 	        }
// 	})

	function printClock() {

		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}

		if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}
		clock.innerHTML = currentHours + ":" + currentMinute + ":"
				+ currentSeconds + " <span style='font-size:40px;'>" + amPm
				+ "</span>"; //날짜를 출력해 줌

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>
</head>
<body onload="printClock()">


	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">


		<%
			Weather we = (Weather)request.getAttribute("weather");
			User user = (User) session.getAttribute("loginuser");
			if (user != null) {
		%>
		<c:if test="${element ne null} ">
			<script type="text/javascript">
				explanation_tts("${element}");
			</script>
		</c:if>
		<!-- FIRST ROW OF BLOCKS -->
		<div class="row">

			<!-- USER PROFILE BLOCK -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<p>User Profile</p>
					<hr>
					<div class="thumbnail">
						<img src="/Speech_Project/images/face80x80.jpg"
							alt="Marcel Newman" class="img-circle">
					</div>
					<!-- /thumbnail -->
					<h1><%=user.getEmail()%></h1>
					<br>
					<div class="info-user">
						<span aria-hidden="true" class="li_user fs1"
							onclick="location.href='index.jsp'"></span> <span
							aria-hidden="true" class="li_settings fs1"
							onclick="location.href='setting.jsp'"></span> <span
							aria-hidden="true" class="li_key fs1"
							onclick="location.href='explanation.jsp'"></span>

					</div>
				</div>
			</div>

			<!-- DONUT CHART BLOCK -->
			<div class="col-sm-3 col-lg-6">
				<div class="dash-unit">
					<p>Program Start</p>
					<hr>
					<div class="thumbnail">
					<script type="text/javascript">
					$(document).keydown(function(event) {
						  if (event.keyCode == '38') {
						   	speech_to_text();
						    
						  }
						});
					</script>
						<button id="speech" onclick="speech_to_text()" class="img-circle">
							<img src="/Speech_Project/images/mic2.png" alt=""
								class="img-circle">
						</button>

					</div>
					<div></div>
				</div>
			</div>


			<div class="col-sm-3 col-lg-3">

				<!-- SERVER UPTIME -->
				<div class="half-unit">
					<dtitle>Key Word</dtitle>
					<hr>
					<div class="cont">
						<div id="korea"></div>
						<script type="text/javascript">
							var button = document.querySelector("#speech");
							var korea = document.querySelector("#korea");
							var isRecognizing = false;

							if ('SpeechRecognition' in window) {
								// Speech recognition support. Talk to your apps!
							}

							try {
								var recognition = new (window.SpeechRecognition
										|| window.webkitSpeechRecognition
										|| window.mozSpeechRecognition || window.msSpeechRecognition)();
							} catch (e) {
								console.error(e);
							}

							recognition.lang = 'ko-KR'; //선택하게 해줘야 할듯 .
							recognition.interimResults = false; //true 시 중간 결과도 반환
							recognition.maxAlternatives = 5; //결과 당 제공되는 최대 수를 설정 default=1
							//recognition.continuous = true;   //true시 연속 결과 반환 default=false

							function speech_to_text() {

								recognition.start(); //음성인식 시작
								isRecognizing = true;

								recognition.onstart = function() {
									button.disabled = true;
								}

								recognition.onspeechend = function() { //음성감지 중지시 실행
									button.disabled = false;
								}

								recognition.onresult = function(event) { //이벤트 발생시 음성 인식 서비스가 결과를 반환하면 시작
									// 결과를 출력
									var resText = event.results[0][0].transcript;
									korea.innerHTML = resText;

									//text to sppech
									text_to_speech(resText);

								};

							}

							// Text to speech
							function text_to_speech(txt) {
								// Web Speech API - speech synthesis
								if ('speechSynthesis' in window) {
									// Synthesis support. Make your web apps talk!
								}
								var msg = new SpeechSynthesisUtterance(); //전역 SpeechSynthesis 인스턴스의 큐 끝에 추가
								var voices = window.speechSynthesis.getVoices(); // 사용 가능한 음성을 반환
								//msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
								msg.voiceURI = 'native';
								msg.volume = 1; // 0 to 1
								msg.rate = 1.3; // 0.1 to 10 //말하기 속도
								//msg.pitch = 2; //0 to 2
								msg.text = txt;
								msg.lang = 'ko-KR';

								msg.onend = function(e) {
									if (isRecognizing == false) {
										recognition.start(); //완료시 음성 다시 실행
									}
								};
								window.speechSynthesis.speak(msg);
								setTimeout(function() {

									window.location.href = "speech.do?keyword="
											+ txt + "";
								}, 3000);
							}
						</script>
					</div>
				</div>
				<!-- LOCAL TIME BLOCK -->
				<div class="half-unit">
					<dtitle>Local Time</dtitle>
					<hr>
					<div class="clockcenter">
						<digiclock id="clock" style="font-size:40px";> </digiclock>
					</div>
				</div>


			</div>
			<!-- /row -->


			<!-- /span3 -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>많이 검색한 내용</dtitle>
					<input type="button" onclick="btn('search')" value="보기"
						style="background-color: gray;">
					<hr>
	      		<div class="cont">
	      		<c:forEach var="list" items="${list}">
					<p><bold>${list.no} </bold> | <ok>  <a href='speech.do?keyword=${list.keyword}'>${list.keyword}</a> </ok></p>
					</c:forEach>
				</div>
				</div>
			</div>

			<!-- 30 DAYS STATS - CAROUSEL FLEXSLIDER -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>날씨 보기</dtitle>
					<input type="button" onclick="btn('weather')" value="보기"
						style="background-color: gray;">
					<hr>
					<%
		if(we != null){
			String a;
			String b;
			if(we.getSky() == 1) {
				a = "good.jpg";
				b = "맑음";
			}else if (we.getSky() == 3) {
				a = "bad.jpg";
				b = "흐림";
			}else {
				a = "bad.jpg";
				b = "흐림";
			}
			String str = we.getBaseDate().substring(0, 4) + "-" + we.getBaseDate().substring(4, 6) + "-" + we.getBaseDate().substring(6, 8);
			String str2 = we.getBaseTime().substring(0, 2)+ ":" + we.getBaseTime().substring(2, 4);
	%>
							<h1><%=str%> <%=str2%></h1> <br>
							
							<img src="/Speech_Project/images/<%=a%>" width="250px" height="160px"/></span>
							<h1><%=b%> <%=we.getT3h() %> 'C</h1> <br>

				<%
				
				}%>
						
					</div>
				</div>
			<!-- 30 DAYS STATS - CAROUSEL FLEXSLIDER -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>검색엔진 설정</dtitle>
					<hr>
					<div class="cont">
						<form action="engine.do" method="POST" id="contact">
							<input type="text" id="engine" name="engine" placeholder="ex) 네이버" style="color: black;"> 
							<input type="text" id="url" name="url" placeholder="ex) https://www.naver.com" style="color: black;"> 
							<input type="submit" id="submit" name="submit" value="검색 엔진 추가">
						</form>
					</div>
				</div>
			</div>
			
				<!-- INFORMATION BLOCK -->     
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      		<dtitle>Web Speech Service</dtitle>
	      		<hr>
	      		<div class="info-user">
					<span aria-hidden="true" class="li_display fs2"></span>
				</div>
				<br>
				<div class="text">
				<p>콘텐츠를 실시간으로 또는 저장된 파일에서 텍스트 변환</p>
				<p>음성 명령어를 통해 제품에 더 나은 사용자 환경 제공</p>
				<p>고객 상호작용에서 유용한 정보를 도출하여 서비스 향상</p>
				</div>

				</div>
			</div>
			
			
			<!-- GRAPH CHART - lineandbars.js file -->
			<div class="col-sm-6 col-lg-6">
				<div class="dash-unit">
					<dtitle>검색 이용 그래프</dtitle>
					<input type="button" onclick="btn('chart')" value="보기"
						style="background-color: gray;">
						<script type="text/javascript">
// 						$(function() {
// 							$('#containers').highcharts({
// 							var list = [];
// 							var pricelist = [];

// 							<c:forEach items = "${word_list}" var="item">
// 							console.log(item.sppech_date);
// 							console.log("${item.speech_date}");
// 								list.push("${item.speech_date}");
// 								pricelist.push(Number("${item.no}"));
// 							</c:forEach>

// 						     Highcharts.setOptions({

// 						         chart: {

// 						             type:'line',

// 						             backgroundColor: {

// 						                 linearGradient: [0, 0, 500, 500],

// 						                 stops: [

// 						                     [0, 'rgb(255, 228, 225)'],

// 						                     [1, 'rgb(255, 228, 225)']

// 						                     ]

// 						             },

// 						            // borderWidth: 2,

// 						             plotBackgroundColor: 'rgba(255, 228, 225, .9)',

// 						             plotShadow: true,

// 						            // plotBorderWidth: 1

// 						         }

// 						     });

// 						     var chart1 = new Highcharts.Chart({ //차트 돔 객체 만들기

// 						    	 title: {

// 						    		 text: 'Auction Chart' 

// 						    	 },

// 						         chart: {


// 						             type: 'line'

// 						         },

// 						         xAxis: {

// 						        	 title:{

// 						        		 text: 'time' //X축이름

// 						        	 },

// 						        	 categories: list     //X축에 명목형 변수의 값 넣기 (배열)   

// 						         },

// 						         yAxis: {

// 						        	 title:{ 

// 						        		 text: 'price' //Y축 이름

// 						        	 }

						           

// 						         },

// 						         series: [{ // array를 통해 여러 계열을 만들 수 있다.

// 						             name: 'bid', 

// 						             data: pricelist //bid라는 계열의 값 (연속형변수, 숫자라면 숫자로 형변환 했는지 확인...)

// 						         } ]    

// 						     });  
// 							});
// 						 });
						</script>
					<hr>
<!-- 					<div id="containers"></div> -->
				</div>
</div>
	</div>
	
		
		<%
			} else {
		%>
		<div class="row">
			<!-- /span3 -->
			<h1 style="color: white;">프로그램 소개</h1>
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<h2>음성인식</h2>
					<hr>
					<p>사람이 말하는 음성 언어를 컴퓨터가 해석해 그 내용을 문자 데이터로 변환하는 음성-문자 변환 시스템입니다.</p>
					<hr>
					<p>-실시간 음성을 텍스트로 변환</p>
					<p>-음성 명령어를 통해 제품에 더 나은 사용자 환경 제공</p>
					<p>-서비스 향상을 위해 고객 상호작용에 대한 유용한 정보 도출</p>

				</div>
			</div>

			<!-- /span3 -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<h2>음성합성</h2>
					<hr>
					<p>텍스트를 음성으로 변환하는 기술입니다. 음성 안내, 책 읽기 서비스 등 다양한 분야에서 활용할 수 있습니다.</p>
					<hr>
					<p>-기기 및 애플리케이션의 음성 사용자 인터페이스로 사용자 참여 유도하기</p>
					<p>-사용자가 원하는 음성 및 언어를 사용하여 커뮤니케이션 맞춤설정하기</p>
				</div>
			</div>

			<!-- /span3 -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<h2>Selenium</h2>
					<hr>
					<p>브라우저 자동화, 크롤링과 관련된 라이브러리입니다.</p>
					<hr>
					<p>-자동로그인, 검색 등 다양한 작업 가능.</p>
					<p>-크롤링(Crawling) 이나 웹 매크로(Macro)등 다양한 작업을 할 수 있습니다.</p>
				</div>
			</div>
			<!-- /span3 -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<h2>Utility</h2>
					<hr>
					<p>사용자에게 편리한 기능을 제공합니다.</p>
					<hr>
					<p>-시간, 실시간 날씨 정보 제공.</p>
					<p>-최근 음성 검색 데이터 제공, higt chart로 제공.</p>
				</div>
			</div>
			<h2 style="color: white;">프로그램 흐름</h2>
			<img src="/Speech_Project/images/story.png" width="800" height="480">

			<h1 style="color: white;">음성인식 사용해보기</h1>

			<button id="no_speech" onclick="no_speech_to_text()">음성인식 시작</button>
			<button id="stop" onclick="no_stop()">정지</button>
			<p id="message">버튼을 누르고 아무말이나 하세요.</p>

			<div class="textWrapper">
				<div style="color: white;" id="no_korea" class="textbox"></div>
			</div>
			<br>
			<br>

			<script type="text/javascript">
				var message = document.querySelector("#message");
				var button = document.querySelector("#no_speech");
				var korea = document.querySelector("#no_korea");
				var isRecognizing = false;

				if ('SpeechRecognition' in window) {
					// Speech recognition support. Talk to your apps!
					console.log("음성인식을 지원하는 브라우저입니다.")
				}

				try {
					var recognition = new (window.SpeechRecognition
							|| window.webkitSpeechRecognition
							|| window.mozSpeechRecognition || window.msSpeechRecognition)();
				} catch (e) {
					console.error(e);
				}

				recognition.lang = 'ko-KR'; //선택하게 해줘야 할듯 .
				recognition.interimResults = false;
				recognition.maxAlternatives = 5;
				//recognition.continuous = true;

				function no_speech_to_text() {

					recognition.start();
					isRecognizing = true;

					recognition.onstart = function() {
						console.log("음성인식이 시작 되었습니다. 이제 마이크에 무슨 말이든 하세요.")
						message.innerHTML = "음성인식 시작...";
						button.innerHTML = "Listening...";
						button.disabled = true;
					}

					recognition.onspeechend = function() {
						message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
						button.disabled = false;
						button.innerHTML = "Start STT";
					}

					recognition.onresult = function(event) {
						console.log('You said: ',
								event.results[0][0].transcript);
						// 결과를 출력
						var resText = event.results[0][0].transcript;
						korea.innerHTML = resText;

						//text to sppech
						no_text_to_speech(resText);

					};

					recognition.onend = function() {
						message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
						button.disabled = false;
						button.innerHTML = "Start STT";
						isRecognizing = false;

					}
				}

				function no_stop() {
					recognition.stop();
					message.innerHTML = "버튼을 누르고 아무말이나 하세요.";
					button.disabled = false;
					button.innerHTML = "Start STT";
					isRecognizing = false;
				}

				// Text to speech
				function no_text_to_speech(txt) {
					// Web Speech API - speech synthesis
					if ('speechSynthesis' in window) {
						// Synthesis support. Make your web apps talk!
						console.log("음성합성을 지원하는  브라우저입니다.");
					}
					var msg = new SpeechSynthesisUtterance();
					var voices = window.speechSynthesis.getVoices();
					//msg.voice = voices[10]; // 두번째 부터 완전 외국인 발음이 됨. 사용하지 말것.
					msg.voiceURI = 'native';
					msg.volume = 1; // 0 to 1
					msg.rate = 1.3; // 0.1 to 10
					//msg.pitch = 2; //0 to 2
					msg.text = txt;
					msg.lang = 'ko-KR';

					msg.onend = function(e) {
						if (isRecognizing == false) {
							recognition.start();
						}
						console.log('Finished in ' + event.elapsedTime
								+ ' seconds.');
					};
					window.speechSynthesis.speak(msg);
				}
			</script>
		</div>


		<%
			}
		%>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>