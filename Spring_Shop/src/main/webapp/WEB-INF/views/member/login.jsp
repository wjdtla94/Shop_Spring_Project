<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="/resources/css2/style.css">
<script type="text/javascript">
	function btn(str) {
		if(str == 'login'){
			frm.action ="/member/login";
		}else{
			frm.action = "/member/join";
		}
		
	}
</script>
</head>
<body>
	<c:if test="${msg == true}">
	<script type="text/javascript">
	alert("회원가입 성공");
	</script>
	</c:if>
	
    <div class="container">
        <div class="card card-container">
          
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" name="frm" method="post">
                <input type="text" name="userId" id="userId" class="form-control" placeholder="id" >
                <input type="password" name="userPass" id="userPass" class="form-control" placeholder="Password" >
                <div id="remember" class="checkbox">
                 
                </div>
                 <c:if test="${msg == false}">
                <p style="color:#f00;">로그인에 실패했습니다.</p>
<!--                 <script type="text/javascript">
                alert("로그인 실패");
                </script> -->
                </c:if>
                 <div class="wrapper">
                        <button  type="submit" onclick="btn('login')">로그인</button>
                        <button  type="submit" onclick="btn('join')">회원가입</button>
                </div>
             
               
            </form><!-- /form -->
           
           
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>