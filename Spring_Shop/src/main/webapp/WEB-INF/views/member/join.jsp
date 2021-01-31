<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" href="/resources/css2/responsive.css">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <style>
        /* .help-block 을 일단 보이지 않게 설정 */
        #myForm .help-block{
            display: none;
        }
        /* glyphicon 을 일단 보이지 않게 설정 */
        #myForm .glyphicon{
            display: none;
        }
    </style>
    <script type="text/javascript">
    	function btn(str) {
    		if(str == 'join'){
    			frm.action = "/member/join";
    		}else if(str =='address'){
    			window.open('/member/address', '', 'width=500,height=800');
    		}else if(str == 'idcheck'){
    			var data = { userId : $("#userId").val()};
    			
    			$.ajax({
    				url : "/member/idCheck",
    				type : "post",
    				data : data,
    				success : function(data) {
						if(data == 1){
							$(".result .msg").text("사용불가");
							$(".result .msg").attr("style","color:#f00");
							
						}else{
							$(".result .msg").text("사용가능");
							$(".result .msg").attr("style","color:#00f");
						}
					}
    				
    				
    			});
    		}
			
		}
    </script>
</head>
<body>
<div class="container">
    <h3>회원가입</h3>
    <form name="frm" method="post">
        <div class="form-group has-feedback">
            <label class="control-label" for="id">아이디</label>
        <input class="btn btn-success" type="button" onclick="btn('idcheck')" value="중복체크"><br>
            <input class="form-control" type="text" name="userId" id="userId" style="width: 300px"/>
            <p class="result">
            <span class="msg"><b>아이디를 확인해 주세요</b></span>
            </p>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="pw">비밀번호</label>
            <input class="form-control" type="password" name="userPass" id="userPass" style="width: 300px"/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="name">이름</label>
            <input class="form-control" type="text" name="userName" id="userName" style="width: 300px"/>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="e-mail">이메일</label>
            <input class="form-control" type="text" name="userEmail" id="userEmail" style="width: 300px"/>
        </div>
<!--          <div class="form-group has-feedback"> -->
<!--             <label class="control-label" for="name">인증번호 확인</label> -->
<!--             <input class="form-control" type="text" name="eNum" id="eNum" style="width: 300px"/> -->
<!--         </div> -->
        <div class="form-group has-feedback">
            <label class="control-label" for="zip_num">우편번호</label>
        <input class="btn btn-success" type="button" onclick="btn('address')" value="우편검색"><br>
            <input class="form-control" type="text" name="userPostcode" id="userPostcode" style="width: 100px"/>
       
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="address">기본주소</label>
            <input class="form-control" type="text" name="userAddress" id="userAddress" style="width: 300px"/>
       
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="address">상세주소</label>
            <input class="form-control" type="text" name="userDetailad" id="userDetailad" style="width: 300px"/>
       
        </div>
       
        
        <input class="btn btn-success" type="submit" onclick="btn('join')" value="가입">
        <input class="btn btn-success" type="button" onclick="window.history.back()" value="취소">
    </form>
</div>

</body>
</html>
