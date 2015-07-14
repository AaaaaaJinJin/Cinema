<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="tw">

<head>
<!-- head -->
<jsp:include page="/admin/fragments/head.jsp" />
<link href="https://cdn.datatables.net/1.10.7/css/jquery.dataTables.css"
	rel="stylesheet">
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/themes/black-tie/jquery-ui.css"
	rel="stylesheet">


<style>

.show {
	width:10em;
}
body {
	-webkit-user-select: none;
	-moz-user-select: none;
}


.screen {
	font-size: 2em;
}

#showdate {
	padding: -5px;
	font-size: 1.2em;
	font-weight: bold;
}

#dateShow{
	font-size:1.2em;
	width:20em;
	text-align: center; 
}
.showarea {
	margin-bottom: 20em;
}

#next, #pre {
	cursor: pointer;
}


</style>
</head>
<body>

	<div id="wrapper">
		<!-- Navbar -->
		<jsp:include page="/admin/fragments/nav.jsp" />


		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">

					<div class="col-lg-12">
						<h1 class="page-header">售票系統</h1>
					</div>
				</div>

				<div class="row">
					<div class=" col-xs-8 text text-center">
						<h4>
							<span id='pre' class="btn  btn-lg btn-info"> ◄ </span> <label
								id="dateShow" class="btn btn-info"></label> <input
								name="showDate" type="hidden" id="showDate" readonly> <span
								id='next' class="btn btn-lg btn-info"> ► </span> <input
								type="hidden" value="hide" id="displayflag">
						</h4>
					</div>
				</div>
				<div class="row showarea">
					<div class="col-xs-12">
						<div class="alert">
							<div class="col-xs-12 screen" id="screen200"><span class="btn btn-lg screenTitle col-xs-1">A廳</span></div>
						</div>
						<div class="alert">
							<div class="col-xs-12 screen" id="screen210"><span class="btn btn-lg screenTitle col-xs-1">B廳</span></div>
						</div>
						<div class="alert ">
							<div class="col-xs-12 screen" id="screen220"><span class="btn btn-lg screenTitle col-xs-1">C廳</span></div>
						</div>
						<div class="alert ">
							<div class="col-xs-12 screen" id="screen230"><span class="btn btn-lg screenTitle col-xs-1">D廳</span></div>
						</div>
						<!-- /.alert -->


					</div>
					<!-- col-xs-12 -->


				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- footer -->
	<jsp:include page="/admin/fragments/footer.jsp" />
	<script
		src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>

	<script>
		var _showTable; // 場次資料庫table

		$(function() {
			// 今日時間表格初始化
			init();

			// 點擊箭頭換日期
			$('#pre').click(function() {
				changeDay(this);
			});
			$('#next').click(function() {
				changeDay(this);
			});
		})

		// 更換日期
		function changeDay(action) {
			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");

			var action = $(action).attr("id");
			var date = new Date($('#showDate').val());

			if (action == 'next') {
				date.setDate(date.getDate() + 1);
			} else {
				date.setDate(date.getDate() - 1);
			}

			// 改變顯示日期
			$('#dateShow').html(
					date.toLocaleDateString() + ' 星期' + weekDay[date.getDay()]);
			$('#showDate').val(date.toLocaleDateString());

			// 重新載入當天的場次
			$('.screen>a').remove();
			showOn(getData());
		} // changeDay		

		function init() {
			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");
			// 設定初始時間
			var date = new Date();
			$('#showDate').val(date.toLocaleDateString());
			$('#dateShow').html(
					date.toLocaleDateString() + ' 星期' + weekDay[date.getDay()]);
			// 取得場次資料
			showOn(getData());
		}

		/* 以下參考check.jsp註解 */
		function getData() {
			var date = $('#showDate').val();
			var result = null;

			var start = date 
			var end = date
			$.ajax({
				async : false,
				url : "getshowByDate.do",
				data : {
					start : start,
					end : end
				},
				dataType : "json",
				success : function(data) {
					result = data;
				}
			});
			return result;
		}

		function showOn(show) {

			// show the shows
			$(show).each(
					function() {
						// 取得要顯示的目標格
						var target = $('#screen' + this.screenId);
						var showType = ' (' + this.ShowType + ')';
						if (this.ShowType == '2D'){
							showType = "";
						}
						
						var name = '<p>' + this.movieName +  showType + '</p>';
						var image = this.movieImage;
						var showTime = this.showTime;
						showTime = '<p>' + showTime.substring(0,5) +  '</p>'
							
						// 處理電影名稱長度過長
						if (name.length > 8) {
							var split = this.movieName.search('：');
							if (split != -1) {
								name = "<p>"
										+ this.movieName
												.substring(0, split)
										+ "<br>"
										+ this.movieName.slice(split + 1)
										+ "</p>";
							}
						}
	
						var href = $("<a></a>");
						var image = $("<img width='70'>")
						image.attr("src", this.movieImage);
						href.attr("href", "showticket.do?showId="+ this.showId);

						var sessionShow = $("<div></div>");
						sessionShow.addClass("btn btn-info show col-xs-1 alert");
						sessionShow.append(name).append(showTime).append(image);

						href.html(sessionShow);
						target.append(href);
					});

		}
	</script>

</body>

</html>
