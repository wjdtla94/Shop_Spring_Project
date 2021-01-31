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
/* #container_box table{width: 900px !important; } */
/* #container_box table th {font-size: 20px !important; font-weight: bold !important; text-align: center !important; padding: 10px ; border-bottom: 2px solid #666 !important;} */
/* #container_box table tr:hover {background: #eee !important;} */
/* #container_box table td { padding: 10px !important; text-align: center !important;} */
/* #container_box table img { width: 150px !important; height: auto !important;} */

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
					<h2>상품목록</h2>
					<br>
					<div class="container_box">
						<table>
							<thead>
								<tr>
									<th>썸네일</th>
									<th>이름</th>
									<th>카테고리</th>
									<th>가격</th>
									<th>수량</th>
									<th>등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr>
										<td style="width: 100px;"><img src="${list.gdsThumbImg}" style="width: 150px; height: auto;"></td>
										<td style="width: 100px;"><a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
										</td>
										<td style="width: 100px;">
											<!-- ${list.cateCode} --> ${list.cateName}
										</td>
										<td style="width: 100px;"><fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###" /></td>
										<td style="width: 100px;">${list.gdsStock}</td>
										<td style="width: 100px;"><fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
						<div class="product__pagination">
						<div>
							<ul>
								<c:if test="${pageMaker.prev}">
									<a
										href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<c:if test="${pageMaker.cri.page != idx}">
										<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
									</c:if>

									<c:if test="${pageMaker.cri.page == idx}">
										<a class="active">${idx}</a>
									</c:if>
									<%-- 									<a href="list${pageMaker.makeQuery(idx)}">${idx}</a> --%>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<a
										href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
								</c:if>
							</ul>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>

</html>