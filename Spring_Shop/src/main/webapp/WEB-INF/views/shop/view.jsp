<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>JY SHOP</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<style>
 div.replyModal { position:relative; z-index:1; display: none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:550px; height:300px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
</style>
<script type="text/javascript"> 
								function replyList() {
									
								
 									var gdsNum = ${view.gdsNum};
 									$.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
									var str = "";
  
 									 $(data).each(function(){
								   var repDate = new Date(this.repDate);
								   repDate = repDate.toLocaleDateString("ko-KR")
   
								   str += "<li data-repNum='" + this.repNum + "'>"
									     + "<div class='userInfo'>"
									     + "<span class='userName'>" + this.userName + "</span>"
									     + "<span class='date'>" + repDate + "</span>"
									     + "</div>"
 									     + "<div class='replyContent'>" + this.repCon + "</div>"
 									     + "<c:if test='${member != null}'>"
 									     + "<div class='replyFooter'>"
 									     + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
 									     + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
 									     + "</div>"
 									     + "</c:if>"
									     + "</li>";           
 										 });
  
									  $("section.replyList ol").html(str);
 											});
 									}
								
								
								
</script>
</head>

<body>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<div class="header__logo">
					<a href="/index"><img
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt=""></a>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<nav class="header__menu mobile-menu">
					<ul>
						<li><a href="/index">Home</a></li>
						<li class="active"><a href="/shop/shop">Shop</a></li>
						
					</ul>
				</nav>
			</div>
			
		</div>

	</div>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shop</h4>
						<div class="breadcrumb__links">
							<a href="/index">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<section class="shop spad">
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
				<div class="col-lg-9">
					<form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>

					<div class="goods">
						<div class="goodsImg">
							<img src="${view.gdsImg}">
						</div>

						<div class="goodsInfo">
							<p>
								<b>${view.gdsName}</b>
							</p>

							<p>
								<b>${view.cateName}</b>
							</p>

							<p>
								<b> <fmt:formatNumber pattern="###,###,###"
										value="${view.gdsPrice}" /> 원
								</b>
							</p>

							<p>
								<b> <fmt:formatNumber pattern="###,###,###"
										value="${view.gdsStock}" /> EA
								</b>
							</p>

							<p>
								<span><b>구입 수량</b></span> <input type="number" class="numBox" max="${view.gdsStock}" value="1">
							</p>

							<p class="addToCart">
 								<button type="button" class="addCart_btn">카트에 담기</button>
 
 <script>
 $(".addCart_btn").click(function(){
  var gdsNum = $("#gdsNum").val();
  var cartStock = $(".numBox").val();
           
  var data = {
    gdsNum : gdsNum,
    cartStock : cartStock
    };
  
  $.ajax({
   url : "/shop/view/addCart",
   type : "post",
   data : data,
   success : function(result){
    
    if(result == 1) {
     alert("카트 담기 성공");
     $(".numBox").val("1");
    } else {
     alert("회원만 사용할 수 있습니다.")
     $(".numBox").val("1");
    }
   },
   error : function(){
    alert("카트 담기 실패");
   }
  });
 });
 </script>
</p>
						</div>



						<div id="reply">



							<c:if test="${member != null}">
								<section class="replyForm">
									<form role="form" method="post" autocomplete="off">
										<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
										<div class="input_area">
											<textarea name="repCon" id="repCon"></textarea>
										</div>

										<div class="input_area">
											<button type="button" id="reply_btn">리뷰 남기기</button>
											<script>
 $("#reply_btn").click(function(){
  
  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#gdsNum").val();
  var repCon = $("#repCon").val()
  
  var data = {
    gdsNum : gdsNum,
    repCon : repCon
    };
  
  $.ajax({
   url : "/shop/view/registReply",
   type : "post",
   data : data,
   success : function(){
    replyList();
    $("#repCon").val("");
   }
  });
 });
</script>
										</div>

									</form>
								</section>
							</c:if>
							<hr>
							<section class="replyList">
							
							<ol>
							
							</ol>
							<script type="text/javascript">
							replyList();
							</script>
<script type="text/javascript">
$(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").fadeOut(200);
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});
	
$(document).on("click", ".delete", function(){
	  var deletConfirm = confirm("정말 삭제하시겠습니까?");
	  if(deletConfirm){
	  var data = {repNum : $(this).attr("data-repNum")};
	   
	  $.ajax({
	   url : "/shop/view/deleteReply",
	   type : "post",
	   data : data,
	   success : function(result){
		   
		   if(result == 1) {
		    replyList();
		   } else {
		    alert("작성자 본인만 할 수 있습니다.");     
		   }
		  },
		  error : function(){
			  alert("로그인하셔야합니다.")
			 }
	  });
	  }
	 });
</script>
							</section>
							<hr>
						</div>
						<div class="gdsDes">${view.gdsDes}</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="replyModal">

 <div class="modalContent">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>
<script>
$(".modal_cancel").click(function(){
	 $(".replyModal").fadeOut(200);
	});
$(document).on("click", ".modify", function(){
	 //$(".replyModal").attr("style", "display:block;");
	 $(".replyModal").fadeIn(200);
	 
	 var repNum = $(this).attr("data-repNum");
	 var repCon = $(this).parent().parent().children(".replyContent").text();
	 
	 $(".modal_repCon").val(repCon);
	 $(".modal_modify_btn").attr("data-repNum", repNum);
	 
	});
$(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").fadeOut(200);
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});

</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.nicescroll.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/js/mixitup.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>
</body>

</html>