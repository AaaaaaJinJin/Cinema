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
body{
	 -webkit-user-select: none;
	 -moz-user-select: none;
}

#movietable {
	margin-top: 1em;
}

.sActive {
	background-color: lavenderblush;
}

th,td, #next, #pre {
	cursor: pointer;
}

#next, #pre{
	color:bule;
}

#next:hover, #pre:hover {
	color: pink;
}

#dateShow{
	font-size:1.2em;
	width:20em;
	text-align: center; 
}

.showDiv{
	width:150px;
}

#movietable{
	float:right;
	position:fixed;
	right:0px;
	z-index:20;
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
						<li role="presentation" class="active lead"><a
							href="createshow.jsp">新增檔期</a></li>					
						<li role="presentation" class=" lead"><a
							href="preshow.jsp">上周檔期</a></li>					
						<li role="presentation" class=" lead"><a
							href="show.jsp">本周檔期</a></li>
						<li role="presentation" class="lead"><a href="nextshow.jsp">下周檔期</a></li>

					</ul>



					<div class="row">
						<div class="col-xs-8">

							<div class="alert alert-warn row">

								<div class="row">
									<form action="addShow.do" method="POST">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>
														<div class="row">
															<div class="col-xs-2">
																<button class="btn btn-lg btn-info" type="button" id='hidePics'>隱藏圖片</button>
																<button class="btn btn-lg btn-primary" type="button" id='showPics'>顯示圖片</button>
															</div>
															<div class=" col-xs-8 ">
															<h4>
																<span class="btn  btn-lg btn-default" id="pre"> ◄ </span> 
																<label id="dateShow" class="btn btn-default"></label>
																<input name="showDate" type="hidden" id="showDate"
																	readonly> <span id='next' class="btn btn-lg btn-default"> ► </span>
																<input type="hidden" value="hide" id="displayflag">	
															</h4>
															</div>
														</div>
													</th>
												</tr>
												<tr>
											<thead>
											<tbody>
												<tr class="sActive screen" id="ScreenA">
													<td id="0">
														<h4>
															A廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40" selected>08:40</option>
																<option value="09:00">09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds1">2D</label> <input type="radio"
																name="showtype1" value="21" id="2Ds1" checked> <label
																for="3Ds1">3D</label> <input type="radio"
																name="showtype1" value="31" id="3Ds1">
															<button class="btn btn-warning reshuttle" type="button">重排</button>
															<span class="btn btn-danger">未完成 </span> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="200">
														</h4>
													</td>
												</tr>
												<tr class="screen" id="ScreenB">
													<td id="1">
														<h4>
															B廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds2">2D</label> <input type="radio"
																name="showtype2" value="21" id="2Ds2" checked> <label
																for="3Ds2">3D</label> <input type="radio"
																name="showtype2" value="31" id="3Ds2">
															<button class="btn btn-warning reshuttle" type="button">重排</button>
															<span class="btn btn-danger">未完成 </span> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="210">
														</h4>
													</td>
												</tr>
												<tr class="screen" id="ScreenC">
													<td id="2">
														<h4>
															C廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds3">2D</label> <input type="radio"
																name="showtype3" value="21" id="2Ds3" checked> <label
																for="3Ds3">3D</label> <input type="radio"
																name="showtype3" value="31" id="3Ds3">
															<button class="btn btn-warning reshuttle" type="button">重排</button>
															<span class="btn btn-danger">未完成 </span> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="220">
														</h4>
													</td>
												</tr>
												<tr class="screen" id="ScreenD">
													<td id="3">
														<h4>
															D廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds4">2D</label> <input type="radio"
																name="showtype4" value="21" id="2Ds4" checked> <label
																for="3Ds4">3D</label> <input type="radio"
																name="showtype4" value="31" id="3Ds4">
															<button class="btn btn-warning reshuttle" type="button">重排</button>
															<span class="btn btn-danger">未完成 </span> <input
																type="hidden" name="showtype" value="21"> <input
																type="hidden" name="screenId" value="230">
														</h4>
													</td>
												</tr>
												<tr id="screenEnd">
													<td><input class="btn btn-lg btn-success"
														type='button' value="新增排程" id="submit"> <input id="resetAll"
														class="btn btn-lg btn-danger" type='button' value="全部重排">
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

						<div class="col-xs-3" id="movietable">
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
		var screenShows = {	showList : [], finish : false}; //  儲存每個廳當天內的場次
		var ssInDay = [screenShows,screenShows,screenShows,screenShows]; // 儲存screenShows
		
		$(function() {
			// 初始化
			init();
			
			// click 隱藏圖片
			$('#hidePics').click(function(){
				$('img').hide();
				$(this).hide();$('#showPics').show(); $('#displayflag').val('hide');
			})
			// click 顯示圖片
			$('#showPics').click(function(){
				$('img').show();
				$(this).hide(); $('#hidePics').show(); $('#displayflag').val('show');
			})
			
			// 點擊箭頭換日期
			$('#pre').click(function() {
				changeDay(this);
			});
			$('#next').click(function() {
				changeDay(this);
			});

			// click換首場時間
			$('select').change(function(){
				showTimeChange($(this));
			});
			
			// 準備當showType被點取時的欄位Id
			var showTypeArray = ("2Ds1,3Ds1,2Ds2,3Ds2,2Ds3,3Ds3,2Ds4,3Ds4")
					.split(',');

			// click每個radio時會把hidden input設為相應的值
			$(showTypeArray).each(function() {
				$('#' + this).click(function() {
					showtypeClick($(this))
				});
			})
			
			// 點到某一廳時設為sActive
			$('.screen').each(function() {
				$(this).click(function() {
					// 選道別廳時先清空screenShows資料
					screenShows = {showList : [],finish : false};
					$('.sActive').removeClass("sActive");
					$(this).addClass("sActive");
				})
			})

			// 當click重排按鈕時，刪除該廳所有的影片
			$('.reshuttle').click(function() {		
				var targetH4 = $(this).parent(); 				// 選到點擊按鈕的parent <h4>
				reshuttle(targetH4);
			})			
			
			// click 全部重排，刪除全部的影片
			$('#resetAll').click(function(){
				deleteAll();
			})
			
			//click取得電影資料庫 table >tr 內容, 傳回data
			_movieTable.$('tr').click(function() {
				var movie = _movieTable.fnGetData(this);
				addShowInScreen(movie); // 新增場次
			});

			$('#submit').click(function() {
				insertShows();
			})
		})

		function init(){
			getMovieTable(getData());
			setThursDay();			
			$('#hidePics').hide();
		}
		
		function deleteAll(){
			 screenShows = {	showList : [], finish : false};
			 ssInDay = [screenShows,screenShows,screenShows,screenShows];
			 $('td>div').remove();			 
		}
		
		// 改變首場時間
		function showTimeChange($target){
			// $target 為所點取的首場時間select;
			
			// 找到點選的index
			var index = $target.parent().parent().attr('id');
			
			// 取得首場時間日期資料
			var date  = ssInDay[index].date	;		
			var screenShows = ssInDay[index] ;
			screenShows.firstshow = $target.val();	

			var showDivs = $target.parent().siblings();
			$(screenShows.showList).each(function(index){
				// if first show, start time is same with screenShows.firstshow
				if (index == 0){
					this.start = new Date(screenShows.date + " "+ screenShows.firstshow); 
					this.end = 	new Date(this.start.getTime() + 60 * 1000*(this.length + this.restTime));
				} else{
					this.start = screenShows.showList[index-1].end;
					this.end = 	new Date(this.start.getTime() + 60 * 1000*(this.length + this.restTime));
				}
				
				// redisplay the date,time 
				var showDiv = $(showDivs[index]);
				var startText = $(showDiv.children()[1]);
				var endText = $(showDiv.children()[2]);
				var start = this.start.toTimeString().substring(0, 9);
				var end = this.end.toTimeString().substring(0, 9);

				startText.html(start);
				// endText.html(end);
			})
		}
		
		// 重新排程
		function reshuttle(targetH4){
			// <h4>的siblings為場次div ，刪除每個div，並清空screenShows資料
			var targets = targetH4.siblings();
			targets.remove();			
			// 刪除排程中的screenShows
			screenShows = {
					showList : [],
					finish : false
				};		
			// 找到td作為index，刪除已完成的screenShows
			var index = $(this).parent().parent().attr('id');
			ssInDay[index] = screenShows;	
			
			// 完成tag 改為  未完成tag
			var finishtag = targetH4.children('span');			
			finishtag.html('未完成');
			finishtag.addClass('btn-danger');
			finishtag.removeClass('btn-success');			
		}
		
		// 更換日期
		function changeDay(action) {
			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");

			var action = $(action).attr("id");
			var date = new Date($('#showDate').val());
			if (action == 'next') {
				
				// mark本來程式，打開下行可以新增一周後的場次
				// date.setDate(date.getDate() + 1);
				
				if (date.getDay() == 3) {
					date.setDate(date.getDate() - 6);
				} else {
					date.setDate(date.getDate() + 1);
				}
			} else {
				// mark本來程式，打開下行可以新增一周前的場次			
				date.setDate(date.getDate() - 1);
/* 				if (date.getDay() == 4) {
					date.setDate(date.getDate() + 6);	
				} else {
					date.setDate(date.getDate() - 1);
				} */
			}
			// 改變顯示日期，更新每一場show的日期
			$('#dateShow').html(
							date.toLocaleDateString() + ' 星期'
							+ weekDay[date.getDay()]);
			$('#showDate').val(date.toLocaleDateString());
			$(ssInDay).each(function() {
				this.date = $('#showDate').val();
			})
		} // changeDay
		
		// 尋找下一個星期四，作為下周檔期開始日
		function setThursDay() {
			var thursday = new Date();
			do {
				thursday.setDate(thursday.getDate() + 1);
			} while (thursday.getDay() != 4)

			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");
			$('#dateShow').html(
					 thursday.toLocaleDateString() + ' 星期'
							+ weekDay[thursday.getDay()]);
			$('#showDate').val(thursday.toLocaleDateString());
		}

		function insertShows() {
			// Date物件經過json轉換時間會重00:00開始算，先將時間轉字串來解決這個問題
			$(ssInDay).each(function() {
				$(this.showList).each(function() {
					this.endd = this.end.toTimeString().substring(0, 8);
					this.startt = this.start.toTimeString().substring(0, 8);
				});
			});

			$.ajax({
				async : false,
				data : {
					data : JSON.stringify(ssInDay)
				},
				type : "POST",
				url : "addShow.do",
				dataType : "text",
				success : function(result) {
					alert("新增完成，跳轉至下一天排程")
					changeDay($('#next'));
					/*
					jQuery("html,body").animate({
						scrollTop : 0
					}, 500);*/
				}
			});

		}

		function addShowInScreen(movie) {
			// 使用sActive下的td id作為目前在哪一廳的index
			var screenIndex = $('.sActive>td').attr('id');

			if (screenIndex != null) {
				ssInDay[screenIndex] = screenShows;
				ssInDay[screenIndex].screenName = $('.sActive').attr('id');
				ssInDay[screenIndex].date = $('#showDate').val(); //日期
				ssInDay[screenIndex].screenId = $('input[name=screenId]')[screenIndex].value; //  screenId
				// 準備showVO儲存場次資料 
				var showVO = {};

				// 取得 點選的電影資料
				showVO.movieId = movie.movieId; //電影Id
				showVO.name = movie.name; //電影名稱
				showVO.image = movie.image; //圖片
				showVO.length = parseInt(movie.showLength); //電影長度

				// 當天首場時間 tr>td>h4>select，準備showList array放每一場電影資料
				ssInDay[screenIndex].firstshow = $('.sActive>td>h4>#firstshow')
						.val();

				// 取得該場次賣的票種
				ssInDay[screenIndex].ticketType = $("input[name=showtype]")[screenIndex].value;

				// 休息時間20分鐘 + 電影長度取10分鐘整數
				showVO.restTime = 20 + 10 - showVO.length % 10;

				// 使用javascript Date物件處理時間，new Date(yyyy/MM/dd HH:mm) 

				var showStart = new Date(screenShows.date + " "
						+ screenShows.firstshow);
				// if showList 不是第一筆，取得前一筆showEnd時間作為show start時間
				var showNumberInScreen = ssInDay[screenIndex].showList.length;
				if (showNumberInScreen > 0) {
					var preShow = ssInDay[screenIndex].showList[showNumberInScreen - 1];
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
					ssInDay[screenIndex].showList.push(showVO);
					screenShows = {
						showList : [],
						finish : false
					};
					// 完成一天的場次後，紅色標籤改為綠色，並顯示完成
					ssInDay[screenIndex].finish = true;
					var finishtag = $('.sActive>td>h4>span');
					finishtag.html('完成');

					finishtag.removeClass('btn-danger');
					finishtag.addClass('btn-success');

					// alert(ssInDay[screenIndex].screenName + "排程已滿");
					var target = $('.sActive');

					target.removeClass('sActive');
					if (target.attr('Id') != 'ScreenD') {
						target.next().addClass('sActive');
					}

				} else {
					ssInDay[screenIndex].showList.push(showVO);
					showOnWeb();
				}
				//將新增的場次顯示在螢幕上，							
			}//if

			function showOnWeb() {
				var screenIndex = screenIndex;
				start = new Date(showVO.start).toTimeString().substring(0, 9);
				end = new Date(showVO.end).toTimeString().substring(0, 9);
				// 新增場次必要資料   movieId, screenId, showDate, showTime, ticketTypeId
				// 準備要顯示資料的div sessionShow

				var sessionShow = $("<div></div>");
				
				// 修正電影名稱過長
				var movieName = "<p>" + showVO.name +"</p>";
				if(movieName.length>8){
					var split = movieName.search('：');
					if(split != -1){
						movieName = "<p>" + showVO.name.substring(0,split-3) +"<br>" + showVO.name.slice(split-2) +"</p>";			
					}
				}
				
				if(movie.length);
				sessionShow.addClass("btn btn-success showDiv")
						.append(movieName)
						.append("<p>" + start + "</p>")
						.append("<img src=" +  showVO.image +" width='100'>");						
						// .append("<p>" + end + "</p>")
						

				$('.sActive>td').append(sessionShow);
				
				// 隱藏圖片
				if($('#displayflag').val() == 'hide'){
					$('img').hide();				
				}

			} // showOnWeb

		} // function

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
					"title" : "序號",
					"data" : "movieId",
					"width" : "6%"
				}, {
					"title" : "電影名稱",
					"data" : "name",
					"width" : "28%"
				}, {
					"title" : "片長",
					"data" : "showLength",
					"width" : "8%"
				}, {
					"title" : "狀態",
					"data" : "status",
					"width" : "12%"
				}, ]
			});
		}
	</script>

</body>

</html>
