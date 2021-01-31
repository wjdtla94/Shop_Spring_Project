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
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
  section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
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
				<section id="content">
					<ul class="orderList">
						<c:forEach items="${orderList}" var="orderList">
							<li>
								<div>
									<p>
										<span>주문번호</span><a
											href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
									</p>
									<p>
										<span>주문자</span>${orderList.userId}</p>
									<p>
										<span>수령인</span>${orderList.orderRec}</p>
									<p>
										<span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2}
										${orderList.userAddr3}
									</p>
									<p>
										<span>가격</span>
										<fmt:formatNumber pattern="###,###,###"
											value="${orderList.amount}" />
										원
									</p>
									<p><span>상태</span>${orderList.delivery}</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</section>
				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>

</html>