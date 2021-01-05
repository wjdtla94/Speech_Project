<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"
       type="text/javascript"></script>
       <script type="text/javascript">
       $(function() {
       $("#idck").click(function() {
    	   var id =$('#id').val();
		$.ajax({
			type : 'post',
			url : '/Speech_Project/check.ajax',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data :  {id: id},			
			success : function(result) {
				if (result==1) {
						// 1 : 아이디가 중복되는 문구
						$('#chOK').attr('disabled', true);
						$("#id_check").text("사용중인 아이디입니다 ");
						$("#id_check").css("color", "red");
					} else {
						$('#chOK').attr('disabled', false);
						$("#id_check").text("사용가능한 아이디입니다 ");
						$("#id_check").css("color", "blue");
// 						button.disabled = true;

					}
				}, error : function() {
						console.log("실패");
				}
	     });
       });
   });
       
       function btn(form) {
		var id = form.id.value;
		console.log(id);
		opener.document.form.id.value = id;
		opener.document.getElementById("idcheck").innerHTML="사용가능한 아이디입니다";
 		self.close();
	}
       </script>
</head>
<body>
	<%
	String id = request.getParameter("id");
	%>
	<div style="text-align: center"> 
	<h3>* 아이디 중복확인 *</h3> 
	<form action="" >
	아이디 : <input type="text" name="id" id="id" maxlength="10"  value="<%=id%>"> 
	<input type="button" id="idck" value="중복확인">
	<br>
	<div class="check_font" id="id_check">
	</div>
	<input type="button" id="chOK" value="사용"  onclick="btn(form)">
	</form>
	</div>
	<br>
	

</body>
</html>