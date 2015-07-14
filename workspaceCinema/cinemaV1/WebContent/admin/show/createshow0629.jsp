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
#movietable {
	margin-top: 1em;
}

.sActive {
	background-color: lavenderblush;
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
						<h1 class="page-header">檔期管理</h1>
					</div>
				</div>

				<div class="row">
					<ul class="nav nav-tabs">
						<li role="presentation" class="lead"><a href="show.jsp">本周檔期</a></li>
						<li role="presentation" class="lead"><a href="nextshow.jsp">下周檔期</a></li>
						<li role="presentation" class="active lead"><a
							href="createshow.jsp">新增檔期</a></li>
					</ul>


					<div class="row">
						<div class="col-xs-8">

							<div class="alert alert-warn row">

								<div class="row">
									<form action="addShow.do" method="POST">
										<table class="table table-hover">
											<thead>
												<tr>
													<th colspan="2">
														<h3>
															<label for="showDate">日期</label> <input name="showDate"
																type="date" value="2015-06-25" id="showDate">

														</h3>
													</th>
												</tr>
												<tr>
											<thead>
											<tbody>
												<tr class="sActive screen" id="ScreenA">
													<td id="1">
														<h3>
															A廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40" selected>08:40</option>
																<option value="09:00">09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds1">2D</label> <input type="radio"
																name="showtype1" value="21" id="2Ds1" checked> <label
																for="3Ds1">3D</label> 
																<input type="radio"
																name="showtype1" value="27" id="3Ds1">
																<input
																type="hidden" name="showtype" value="21"> 
																
																<input
																type="hidden" name="screenId" value="200">
														</h3>
													</td>
												</tr>
												<tr class="screen" id="ScreenB">
													<td id="2">
														<h3>
															B廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds2">2D</label> <input type="radio"
																name="showtype2" value="21" id="2Ds2" checked> <label
																for="3Ds2">3D</label> <input type="radio"
																name="showtype2" value="27" id="3Ds2"> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="210">
														</h3>
													</td>
												</tr>
												<tr class="screen" id="ScreenC">
													<td id="3">
														<h3>
															C廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds3">2D</label> <input type="radio"
																name="showtype3" value="21" id="2Ds3" checked> <label
																for="3Ds3">3D</label> <input type="radio"
																name="showtype3" value="27" id="3Ds3"> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="220">
														</h3>
													</td>
												</tr>
												<tr class="screen" id="ScreenD">
													<td id="4">
														<h3>
															D廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds4">2D</label> <input type="radio"
																name="showtype4" value="21" id="2Ds4" checked> <label
																for="3Ds4">3D</label> <input type="radio"
																name="showtype4" value="27" id="3Ds4"> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="230">
														</h3>
													</td>
												</tr>
												<tr id="screenEnd">
													<td><input class="btn btn-lg btn-success"
														type='button' value="新增排程" id="submit"> <input
														class="btn btn-lg btn-danger" type='reset' value="重排">
													</td>

												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</div>
							<!-- /.alert -->
						</div>
						<!-- col-xs-8 -->

						<div class="col-xs-4" id="movietable">
							<table class="table" id="movies">
							</table>
						</div>

					</div>
					<!-- .row -->


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
		var _movieTable; // 電影資料庫table
		var ssInDay = []; // 儲存screenShows
		var screenShows = {
			screenName : "",
			firstshow : "",
			ticketType : "",
			showList : []
		}; //  儲存每個廳當天內的場次

		$(function() {
			getMovieTable(getData());

			// 準備當showType被點取時的欄位Id
			var showTypeArray = ("2Ds1,3Ds1,2Ds2,3Ds2,2Ds3,3Ds3,2Ds4,3Ds4")
					.split(',');

			// click每個radio時會把hidden input設為相應的值
			$(showTypeArray).each(function() {
				$('#' + this).click(function() {
					showtypeClick($(this))
				});
			})

			//click取得電影資料庫 table >tr 內容, 傳回data
			_movieTable.$('tr').click(function() {
				var movie = _movieTable.fnGetData(this);
				addShowInScreen(movie); // 新增場次
			});

			$('#submit').click(function(){
				insertShows();
			})
		})

		function insertShows(){
			
			// Date物件經過json轉換時間會重00:00開始算，先將時間轉字串來解決這個問題
			$(ssInDay).each(function(){
				$(this.showList).each(function(){
					this.end = this.end.toTimeString().substring(0,8);
					this.start = this.start.toTimeString().substring(0,8);
				});			
			})
			
			//console.log(JSON.stringify(ssInDay))
			$.post(				
				"addShow.do",
				{data:JSON.stringify(ssInDay)}
			);	
		}
		
		function addShowInScreen(movie) {
			// 使用ssInDay陣列內的長度判斷現在在處理哪個聽
			var screenIndex = ssInDay.length;
			screenShows.screenName = $('.sActive').attr('id')
			screenShows.date = $('#showDate').val(); //日期
			screenShows.screenId = $('input[name=screenId]')[screenIndex].value;   //  screenId
			// 準備showVO儲存場次資料 
			var showVO = {};

			// 取得 點選的電影資料
			showVO.movieId = movie.movieId; //電影Id
			showVO.name = movie.name; //電影名稱
			showVO.image = movie.image; //圖片
			showVO.length = parseInt(movie.showLength); //電影長度

			// 當天首場時間 tr>td>h3>select，準備showList array放每一場電影資料
			screenShows.firstshow = $('.sActive>td>h3>#firstshow').val();

			// 取得該場次賣的票種
			screenShows.ticketType = $("input[name=showtype]")[screenIndex].value;

			// 休息時間20分鐘 + 電影長度取10分鐘整數
			showVO.restTime = 20 + 10 - showVO.length % 10;

			// 使用javascript Date物件處理時間，new Date(yyyy/MM/dd HH:mm) 
			
			var showStart = new Date(screenShows.date + " " + screenShows.firstshow);
			// if showList 不是第一筆，取得前一筆showEnd時間作為show start時間
			var showNumberInScreen = screenShows.showList.length;
			if (showNumberInScreen > 0) {
				var preShow = screenShows.showList[showNumberInScreen - 1];
				showVO.start = preShow.end;
				showVO.end = new Date(showVO.start.getTime() + 60 * 1000
						* (showVO.length + showVO.restTime));
			} else {
				showVO.start = showStart;
				showVO.end = new Date(showStart.getTime() + 60 * 1000
						* (showVO.length + showVO.restTime))
			}


			// if 結束時間在8點以前或23點以後，表示當天這個廳已經滿場，新增一整天的場次到ssInDay
			if (showVO.start.getHours() > 22 || showVO.start.getHours() < 8) {
				screenShows.showList.push(showVO);
				ssInDay.push(screenShows)
				alert(screenShows.screenName + "排程已滿");
				// 換下一廳
				screenShows = {
					showList : []
				};
				var target = $('.sActive');
				target.removeClass('sActive');
				if (target.attr('Id') != 'ScreenD') {
					target.next().addClass('sActive');
				}
			} else {
				screenShows.showList.push(showVO);
				showOnWeb();
			}
			//將新增的場次顯示在螢幕上，							


			function showOnWeb() {
				var screenIndex = screenIndex;
				start = new Date(showVO.start).toTimeString().substring(0,9);
				end = new Date(showVO.end).toTimeString().substring(0,9);
				// 新增場次必要資料   movieId, screenId, showDate, showTime, ticketTypeId
				// 準備要顯示資料的div sessionShow
				
				var sessionShow = $("<div></div>");
				sessionShow.addClass("btn btn-success")
						.append("<p>" + showVO.name + "</p>")
						.append("<p>" + start + "</p>")
						.append("<p>" + end + "</p>")
						
				sessionShow.append("<img src=" +  showVO.image +" width='100'>");

				$('.sActive>td').append(sessionShow);
			}
		}

		/* showType 被點取改變的時候，設定hidden的input值跟著改變 */
		function showtypeClick($target) {
			var input = $target; //傳入的資料
			var index = input.attr('id').slice(3) - 1 //輸入目標最後一碼表示目前所在廳院
			var setTarget = $('input[name=showtype]')[index]; //取得輸出的目標
			$(setTarget).val(input.val()) //設定input[name=showtype]的值與輸入相同
		}

		
		//--------------table 相關----------------//
		/* 以下參考check.jsp註解 */
		function getData() {
			var result = null;
			$.ajax({
				async : false,
				url : "getmovies.do",
				dataType : "json",
				success : function(data) {
					result = data;
				}
			});

			$.each(result, function(key) {
				if (this.image == null) {
					this.image = "${systemRoot}/${result.movieId}";
				}
			})
			return result;
		}

		function getMovieTable(data) {
			_movieTable = $('#movies').dataTable({
				"language" : {
					"url" : "${systemRoot}/dataTable_zh.txt"
				},
				"data" : data,
				"order" : [ [ 0, "desc" ] ],
				"columns" : [ {
					"title" : "電影ID",
					"data" : "movieId",
					"width" : "15%"
				}, {
					"title" : "電影名稱",
					"data" : "name",
					"width" : "15%"
				}, {
					"title" : "片長",
					"data" : "showLength",
					"width" : "15%"
				}, {
					"title" : "上映狀態",
					"data" : "status",
					"width" : "15%"
				}, ]
			});
		}
	</script>

</body>

</html>
