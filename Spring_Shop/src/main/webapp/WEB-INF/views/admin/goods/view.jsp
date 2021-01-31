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
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 80px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}

.oriImg {width: 500px; height: auto;}
.thumbImg {}
.gdsDes img { max-width:600px; height:auto; }
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
					<h2>상품조회</h2>
					<br>
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="n" value="${goods.gdsNum}" />
						<div class="inputArea">
							<label>1차 분류</label> <span class="category1"></span> <label>2차
								분류</label> <span class="category2">${goods.cateCode}</span>
						</div>

						<div class="inputArea">
							<label for="gdsName">상품명</label> <span>${goods.gdsName}</span>
						</div>

						<div class="inputArea">
							<label for="gdsPrice">상품가격</label> <span><fmt:formatNumber
									value="${goods.gdsPrice}" pattern="###,###,###" /></span>
						</div>

						<div class="inputArea">
							<label for="gdsStock">상품수량</label> <span>${goods.gdsStock}</span>
						</div>

						<div class="inputArea">
							<label for="gdsDes">상품소개</label> <div class="gdsDes">${goods.gdsDes}</div>
						</div>
						<div class="inputArea">
							<label for="gdsImg">이미지</label>
							<p>원본 이미지</p>
							<img src="${goods.gdsImg}" class="oriImg" />

							<p>썸네일</p>
							<img src="${goods.gdsThumbImg}" class="thumbImg" />
						</div>
						<div class="inputArea">
							<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
							<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

							<script>
								var formObj = $("form[role='form']");

								$("#modify_Btn").click(
										function() {
											formObj.attr("action",
													"/admin/goods/modify");
											formObj.attr("method", "get")
											formObj.submit();
										});

								$("#delete_Btn").click(
										function() {

											var con = confirm("정말로 삭제하시겠습니까?");

											if (con) {
												formObj.attr("action",
														"/admin/goods/delete");
												formObj.submit();
											}
										});
							</script>
						</div>
					</form>
				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>


</body>

</html>