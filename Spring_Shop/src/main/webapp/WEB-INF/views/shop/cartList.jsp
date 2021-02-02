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
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 */
 .listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }
section#content ul li {
	margin: 10px 0;
}

section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.gdsInfo {
	float: right;
	width: calc(100% - 270px);
}

section#content div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

* /
  section#content div.gdsInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

section#content div.gdsInfo .delete {
	text-align: right;
}

section#content div.gdsInfo .delete button {
	font-size: 22px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}
.orderInfo { border:5px solid #eee; padding:20px; display: none;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
/* .checkBox { float:left; width:30px; } */
/* .checkBox input { width:16px; height:16px; } */
</style>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>

<body>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>My Page</h4>
						<div class="breadcrumb__links">
							<a href="/index">Home</a> <span>CartList</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<jsp:include page="/WEB-INF/views/member/nav.jsp"></jsp:include>
				<div class="col-lg-9">
					<section id="content">
						<ul>
							<li>
								<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" /><label
										for="allCheck">모두 선택</label>
									<script>
										$("#allCheck")
												.click(
														function() {
															var chk = $(
																	"#allCheck")
																	.prop(
																			"checked");
															if (chk) {
																$(".chBox")
																		.prop(
																				"checked",
																				true);
															} else {
																$(".chBox")
																		.prop(
																				"checked",
																				false);
															}
														});
									</script>
								</div>

								<div class="delBtn">
									<button type="button" class="selectDelete_btn">선택 삭제</button>
									<script>
										$(".selectDelete_btn")
												.click(
														function() {
															var confirm_val = confirm("정말 삭제하시겠습니까?");

															if (confirm_val) {
																var checkArr = new Array();

																$(
																		"input[class='chBox']:checked")
																		.each(
																				function() {
																					checkArr
																							.push($(
																									this)
																									.attr(
																											"data-cartNum"));
																				});

																$
																		.ajax({
																			url : "/shop/deleteCart",
																			type : "post",
																			data : {
																				chbox : checkArr
																			},
																			success : function(
																					result) {
																				if (result == 1) {
																					location.href = "/shop/cartList";
																				} else {
																					alert("삭제 실패");
																				}
																			}
																		});
															}
														});
									</script>
								</div>

							</li>
							<c:set var="sum" value="0" />
							<c:forEach items="${cartList}" var="cartList">
								<li>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox"
											data-cartNum="${cartList.cartNum}" />
										<script>
											$(".chBox").click(
													function() {
														$("#allCheck").prop(
																"checked",
																false);
													});
										</script>
									</div>

									<div class="thumb">
										<img src="${cartList.gdsThumbImg}" />
									</div>
									<div class="gdsInfo">
										<p>
											<span>상품명</span>${cartList.gdsName}<br /> <span>개당 가격</span>
											<fmt:formatNumber pattern="###,###,###"
												value="${cartList.gdsPrice}" />
											원<br /> <span>구입 수량</span>${cartList.cartStock} 개<br /> <span>최종
												가격</span>
											<fmt:formatNumber pattern="###,###,###"
												value="${cartList.gdsPrice * cartList.cartStock}" />
											원
										</p>

										<div class="delete">
											<button type="button" class="delete_${cartList.cartNum}_btn"
												data-cartNum="${cartList.cartNum}">삭제</button>

											<script>
												$(
														".delete_${cartList.cartNum}_btn")
														.click(
																function() {
																	var confirm_val = confirm("정말 삭제하시겠습니까?");

																	if (confirm_val) {
																		var checkArr = new Array();
																		checkArr
																				.push($(
																						this)
																						.attr(
																								"data-cartNum"));

																		$
																				.ajax({
																					url : "/shop/deleteCart",
																					type : "post",
																					data : {
																						chbox : checkArr
																					},
																					success : function(
																							result) {
																						if (result == 1) {
																							location.href = "/shop/cartList";
																						} else {
																							alert("삭제 실패");
																						}
																					}
																				});
																	}
																});
											</script>
										</div>
									</div>
								</li>
								<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
							</c:forEach>
						</ul>
						<div class="listResult">
							<div class="sum">
								총 합계 :
								<fmt:formatNumber pattern="###,###,###" value="${sum}" />
								원
							</div>
							<div class="orderOpne">
								<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
								<script>
									$(".orderOpne_bnt").click(function() {
										$(".orderInfo").slideDown();
										$(".orderOpne_bnt").slideUp();
									});
								</script>
							</div>
						</div>
						<div class="orderInfo">
							<form role="form" method="post" autocomplete="off">
								<c:forEach items="${cartList}" var="cartList">
								<input type="hidden" name="gdsName" value="${cartList.gdsName}" />
								</c:forEach>
								<input type="hidden" name="amount" value="${sum}" />
								
								<div class="inputArea">
									<label for="">수령인</label> <input type="text" name="orderRec"
										id="orderRec" required="required" />
								</div>

								<div class="inputArea">
									<label for="orderPhon">수령인 연락처</label> <input type="text"
										name="orderPhon" id="orderPhon" required="required" />
								</div>

								<div class="inputArea">
									<label for="userAddr1">우편번호</label> <input type="text"
										name="userAddr1" id="userAddr1" required="required" />
										<button type="button" class="adrress_btn">기본주소</button>
										<script>

										$(".adrress_btn").click(function() {
											$.getJSON("/shop/address", function(data){
												 $(data).each(function(){
													 $("#userAddr1").val(this.userPostcode);
													 $("#userAddr2").val(this.userAddress);
													 $("#userAddr3").val(this.userDetailad);
												 });
											});
											});
									
									</script>
										
								</div>

								<div class="inputArea">
									<label for="userAddr2">1차 주소</label> <input type="text"
										name="userAddr2" id="userAddr2" required="required" />
								</div>

								<div class="inputArea">
									<label for="userAddr3">2차 주소</label> <input type="text"
										name="userAddr3" id="userAddr3" required="required" />
								</div>

								<div class="inputArea">
									<button type="submit" class="order_btn">주문</button>
									<button type="button" class="cancel_btn">취소</button>
									<script>

										$(".cancel_btn").click(function() {
											$(".orderInfo").slideUp();
											$(".orderOpne_bnt").slideDown();
										});
									</script>
								</div>

							</form>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- 	<section id="content"> -->
	<!--  <ul> -->
	<%--   <c:forEach items="${cartList}" var="cartList"> --%>
	<!--   <li> -->
	<!--    <div class="thumb"> -->
	<%--     <img src="${cartList.gdsThumbImg}" /> --%>
	<!--    </div> -->
	<!--    <div class="gdsInfo"> -->
	<!--     <p> -->
	<%--      <span>상품명</span>${cartList.gdsName}<br /> --%>
	<%--      <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원<br /> --%>
	<%--      <span>구입 수량</span>${cartList.cartStock} 개<br /> --%>
	<%--      <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원 --%>
	<!--     </p> -->

	<!--     <div class="delete"> -->
	<!--      <button type="button" class="delete_btn">삭제</button> -->
	<!--     </div> -->
	<!--    </div>    -->
	<!--   </li> -->
	<%--   </c:forEach> --%>
	<!--  </ul> -->
	<!-- </section> -->
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