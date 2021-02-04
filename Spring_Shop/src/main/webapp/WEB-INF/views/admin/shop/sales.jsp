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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
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
				<nav class="header__menu mobile-menu">
                                <ul class="dropdown">
                                    <li><a href="#" class = "sales_btn">최근 1주일 매출</a></li>
                                    <li><a href="#" class = "goods_btn">상품별 구매 현황</a></li>
                                    <li><a href="#"class ="product_btn">상품 재고 </a></li>
                                </ul>
                            </nav>
						<script>
		$(".sales_btn").click(function() {
		var chartLabels = [];

		var chartData = [];
		$.getJSON("/admin/shop/salesList", function(data) {

			$(data).each(function() {

				chartLabels.push(this.orderDate);

				chartData.push(this.amount);

			});

			createChart();


		});

		var lineChartData = {

			labels : chartLabels,

			datasets : [

			{

				label : "금액",

				fillColor : "rbga(151,187,205,0.2)",

				strokeColor : "rbga(151,187,205,1)",
				
				pointColor : "rbga(151,187,205,1)",

				pointStrokeColor : "#fff",

				pointHighlightFill : "#fff",

				pointHighlightStroke : "rbga(151,187,205,1)",

				data : chartData

			}

			]

		}

		function createChart() {

			var ctx = document.getElementById("canvas").getContext("2d");

			var myChart = new Chart(ctx, {
				type : 'line',
				data : lineChartData,

				options : {

					scales : {

						yAxes : [ {

							ticks : {
								beginAtZero : true

							}

						} ]

					}

				}

			})

		}
		});
		
	</script>
	<script type="text/javascript">
	$(".goods_btn").click(function() {
		var chartLabels = [];

		var chartData = [];
		$.getJSON("/admin/shop/goodsList", function(data) {

			$(data).each(function() {

				chartLabels.push(this.gdsName);

				chartData.push(this.count);

			});

			createChart();


		});

		var lineChartData = {

			labels : chartLabels,

			datasets : [

			{

				label : "판매수",

				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",

				pointColor : "rbga(151,187,205,1)",

				pointStrokeColor : "#fff",

				pointHighlightFill : "#fff",

				pointHighlightStroke : "rbga(151,187,205,1)",

				data : chartData

			}

			]

		}

		function createChart() {

			var ctx = document.getElementById("canvas").getContext("2d");

			var myBar = new Chart(ctx, {
				type : 'horizontalBar',
				data : lineChartData,

				options : {

					scales : {

						xAxes : [ {

							ticks : {
								
								beginAtZero: true


							}

						} ]

					}

				}

			})

		}
		});
	</script>
	<script type="text/javascript">
	$(".product_btn").click(function() {
		var chartLabels = [];

		var chartData = [];
		$.getJSON("/admin/shop/productList", function(data) {

			$(data).each(function() {

				chartLabels.push(this.gdsName);

				chartData.push(this.gdsStock);

			});

			createChart();


		});

		var lineChartData = {

			labels : chartLabels,

			datasets : [

			{

				label : "재고",

				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",

				pointColor : "rbga(151,187,205,1)",

				pointStrokeColor : "#fff",

				pointHighlightFill : "#fff",

				pointHighlightStroke : "rbga(151,187,205,1)",

				data : chartData

			}

			]

		}

		function createChart() {

			var ctx = document.getElementById("canvas").getContext("2d");

			var myBar2 = new Chart(ctx, {
				type : 'horizontalBar',
				data : lineChartData,

				options : {

					scales : {

						xAxes : [ {

							ticks : {
								
								beginAtZero: true


							}

						} ]

					}

				}

			})

		}
		});
	</script>
					<div style="width: 80%">
						<div>

							<canvas id="canvas" height="500" width="1000"></canvas>

						</div>

					</div>
				
					
						
				</div>

			</div>

		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>

</html>