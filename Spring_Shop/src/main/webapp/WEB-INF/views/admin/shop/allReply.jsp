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

#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }
.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
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
					<div id="container_box">
						<ul>
							<c:forEach items="${reply}" var="reply">
								<li>
									<div class="replyInfo">
										<p>
											<span>작성자</span>${reply.userName} (${reply.userId})
										</p>
										<p>
											<span>작성된 상품</span> <a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
										</p>
									</div>
									<div class="replyContent">${reply.repCon}</div>
									<div class="replyControll">
										<form role="form" method="post">
											<input type="hidden" name="repNum" value="${reply.repNum}" />
											<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
										</form>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>

</html>