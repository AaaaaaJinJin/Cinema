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
	margin-top:1em;
}

.sActive {
	background-color:lavenderblush;
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
									<form action="addShow0626.do" method="POST">
										<table class="table table-hover">
											<thead>
												<tr>
													<th colspan="2">
														<h3>
															<label for="showDate">日期</label> 
															
															<input name="showDate" 
																type="date" value="2015-06-25" id="showDate">

														</h3>
													</th>
												</tr>
												<tr>
											<thead>
											<tbody>
												<tr class="sActive screen" >
													<td >
														<h3>
															A廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds1">2D</label> <input type="radio"
																name="showtype" value="21" id="2Ds1" checked> <label
																for="3Ds1">3D</label> <input type="radio" name="showtype1"
																value="27" id="3Ds1"> <input type="hidden"
																name="screenId" value="210">
														</h3>
													</td>
												</tr>
												<tr class="screen" >
													<td >
														<h3>
															B廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds2">2D</label> <input type="radio"
																name="showtype2" value="21" id="2Ds2" checked> <label
																for="3Ds2">3D</label> <input type="radio" name="showtype2"
																value="27" id="3Ds2"> <input type="hidden"
																name="screenId" value="220">
														</h3>
													</td>
												</tr>
												<tr  class="screen">
													<td >
														<h3>
															C廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds3">2D</label> <input type="radio"
																name="showtype3" value="21" id="2Ds3" checked> <label
																for="3Ds3">3D</label> <input type="radio" name="showtype3"
																value="27" id="3Ds3"> <input type="hidden"
																name="screenId" value="230">
														</h3>
													</td>
												</tr>
												<tr class="screen" id="">
													<td >
														<h3>
															D廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40">09:40</option>
															</select> <label for="2Ds4">2D</label> <input type="radio"
																name="showtype4" value="21" id="2Ds4" checked > <label
																for="3Ds4">3D</label> <input type="radio" name="showtype4" 
																value="27" id="3Ds4"> <input type="hidden"
																name="screenId" value="240">
														</h3>
													</td>
												</tr>
												<tr id="screenEnd">
													<td>
														<input class="btn btn-lg btn-success" type='submit' value="新增排程" >
														<input class="btn btn-lg btn-danger" type='reset' value="重排">															
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
	<script	src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>

	<script>
		var dayIndex = 1;
		var totalShowTime = 0;
		var _movieTable;  // 電影資料庫table
		
		$(function() {
			getMovieTable(getData());
			
			//click取得電影資料庫 table >tr 內容, 傳回data
			_movieTable.$('tr').click(function() {
				var movie = _movieTable.fnGetData(this); 
				addSession(movie); // 新增場次
			});

		})

		function addSession(movie) {
			var showEnd;
			// 取得 點選的電影資料
			var name = movie.name;							//電影名稱
			var image = movie.image;						//圖片
			var showLength = parseInt(movie.showLength); 	//電影長度
			
			// 頁面上的資料
			var showDate = $('#showDate').val(); 	 //日期
			var firstshow = $('#firstshow').val();   //首場時間
			
			// 
			var restTime = 20 + 10 - showLength%10;  // 休息時間20分鐘 + 電影長度取10分鐘整數
			
			// 使用javascript Date物件處理時間，new Date(yyyy/MM/dd HH:mm) 
			var showStart = new Date(showDate + " " + firstshow); 

			// 首場時間 showStart + 總播映時間 = 下一場開始時間
			showStart = new Date(showStart.getTime() + totalShowTime*60*1000);
			showEnd = new Date(showStart.getTime() + showLength*60*1000);
		

			// 新增場次資料 set movieId and start time for the show(session) 
			/*** movieId, screenId(input name = screenId), startTime, ticketTypeId( name = showtype) ***/
			var movieIdInput = $("<input type='hidden' name=movieId value=" + movie.movieId + ">");
			var showTimeString = showStart.toLocaleTimeString().substring(2)
			var showTimeInput = $("<input type='hidden' name=showTime value=" + showTimeString + ">");
			
			var sessionShow = $("<div></div>");
			sessionShow.addClass("btn btn-success")
					.append("<p>" + name + "</p>")
					.append("<p>" + showStart.toLocaleTimeString() + "</p>")
					.append("<p>" + showEnd.toLocaleTimeString() + "</p>")
					.append(movieIdInput).append(showTimeInput);
			
			sessionShow.append("<img src=" + image +" width='100'>");
			
			
			// the area of show the insert session 
			if($('.sActive').attr('Id')!='screenEnd') {
				var targetScreen = $('.sActive > td');
				targetScreen.append(sessionShow);
			}
			totalShowTime += (20 + showLength + 10 - showLength%10); // 已經播放的時間，每場20分鐘+取10整數為中場	
			// if 電影結束時間 < 8，代表已經超過12點，或倒數第二場 > 22 點， 跳到下一個廳繼續新增
			if (parseInt(showEnd.getHours())>22 || parseInt(showEnd.getHours()) < 8) {
					totalShowTime = 0;
					
					var target = $('.sActive');
				
					if(target.attr('Id')!='screenEnd'){
						target.removeClass('sActive');			
						target.next().addClass('sActive');
					} 		
			}			
		}

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
