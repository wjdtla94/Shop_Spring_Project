<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">

<title>JY SHOP</title>
<style>
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.gdsInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.gdsInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}
.deliveryChange { text-align:right; }
.delivery1_btn,
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
</style>
</head>

<body>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>관리자페이지</h4>
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
				<jsp:include page="/WEB-INF/views/admin/include/nav.jsp"></jsp:include>
				<div class="col-lg-9">
					<div class="orderInfo">
					 <c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
							<p>
								<span>주문자</span>${orderView.userId}</p>
							<p>
								<span>수령인</span>${orderView.orderRec}</p>
							<p>
								<span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2}
								${orderView.userAddr3}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.amount}" />
								원
							</p>
							<p>
								<span>상태</span>${orderView.delivery}</p>

								<div class="deliveryChange">
									<form role="form" method="post" class="deliveryForm">

										<input type="hidden" name="orderId"
											value="${orderView.orderId}" /> <input type="hidden"
											name="delivery" class="delivery" value="" />
										<c:if test="${orderView.delivery eq '배송준비'}" >
										<button type="button" class="delivery1_btn">배송 중</button>
										<button type="button" class="delivery2_btn">배송 완료</button>
										</c:if>
										<c:if test="${orderView.delivery eq '배송 중'}" >
										<button type="button" class="delivery2_btn">배송 완료</button>
										</c:if>
										<script>
											$(".delivery1_btn").click(
													function() {
														$(".delivery").val(
																"배송 중");
														run();
													});

											$(".delivery2_btn").click(
													function() {
														$(".delivery").val(
																"배송 완료");
														run();

													});

											function run() {
												$(".deliveryForm").submit();
											}
										</script>
									</form>
								</div>
						</c:if>
						</c:forEach>
					</div>

					<ul class="orderView">
						<c:forEach items="${orderView}" var="orderView">
							<li>
								<div class="thumb">
									<img src="${orderView.gdsThumbImg}" />
								</div>
								<div class="gdsInfo">
									<p>
										<span>상품명</span>${orderView.gdsName}<br /> <span>개당 가격</span>
										<fmt:formatNumber pattern="###,###,###"
											value="${orderView.gdsPrice}" />
										원<br /> <span>구입 수량</span>${orderView.cartStock} 개<br /> <span>최종
											가격</span>
										<fmt:formatNumber pattern="###,###,###"
											value="${orderView.gdsPrice * orderView.cartStock}" />
										원                 
									</p>
								</div>
							</li>
						</c:forEach>
					</ul>

				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>

</html>