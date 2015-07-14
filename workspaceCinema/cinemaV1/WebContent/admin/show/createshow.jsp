<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="tw">

<head>
<!-- head -->
<jsp:include page="/admin/fragments/head.jsp" />
<link
	href=http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js
	rel="stylesheet">
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.2/themes/black-tie/jquery-ui.css"
	rel="stylesheet">


<style>
body {
	-webkit-user-select: none;
	-moz-user-select: none;
}

#movietable {
	margin-top: 1em;
}

.sActive {
	background-color: lavenderblush;
}

th, td, #next, #pre {
	cursor: pointer;
}

#next, #pre {
	color: bule;
}

#next:hover, #pre:hover {
	color: pink;
}

#dateDiv {
	font-size: 1.2em;
	width: 20em;
	text-align: center;
}

.showDiv {
	width: 150px;
}

#movietable {
	float: right;
	position: fixed;
	right: 0px;
	z-index: 20;
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
						<li role="presentation" class=" lead"><a href="preshow.jsp">上周檔期</a></li>
						<li role="presentation" class=" lead"><a href="show.jsp">本周檔期</a></li>
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
																<button class="btn btn-lg btn-info" type="button"
																	id='hidePics'>隱藏圖片</button>
																<button class="btn btn-lg btn-primary" type="button"
																	id='showPics'>顯示圖片</button>
															</div>
															<div class="col-xs-2">
																<button class="btn btn-lg btn-info" type="button"
																	id='copy'>複製前一天</button>
															</div>																
															<div class=" col-xs-7 ">
																<h4>
																	<span class="btn  btn-lg btn-default" id="pre">
																		◄ </span> <label id="dateDiv" class="btn btn-default"></label>
																	<input name="showDate" type="hidden" id="showDate"
																		readonly> <span id='next'
																		class="btn btn-lg btn-default"> ► </span> <input
																		type="hidden" value="hide" id="displayflag">
																</h4>
															</div>
															
														
															
														</div>
													</th>
												</tr>
												<tr>
											<thead>
											<tbody>
												<tr class="sActive screen" id="200">
													<td id="0">
														<h4>
															A廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40">08:40</option>
																<option value="09:00" selected>09:00</option>
																<option value="09:20">09:20</option>
																<option value="09:40" >09:40</option>
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
												<tr class="screen" id="210">
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
												<tr class="screen" id="220">
													<td id="2">
														<h4>
															C廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40" selected>08:40</option>
																<option value="09:00">09:00</option>
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
												<tr class="screen" id="230">
													<td id="3">
														<h4>
															D廳 <label>首場電影開始時間</label> <select id="firstshow">
																<option value="08:40" selected>08:40</option>
																<option value="09:00">09:00</option>
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
														type='button' value="新增排程" id="submit"> <input
														id="resetAll" class="btn btn-lg btn-danger" type='button'
														value="全部重排"></td>

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
		var ssInDay = _fnShow_showInDayByScrrenVO(); // 儲存screenShows
		var _movieTable; // 電影資料庫table	

		var screenShows = {
			showList : [],
			finish : false
		}; //  儲存每個廳當天內的場次

		$(function() {
			// 初始化
			init();

			// click 隱藏圖片
			$('#hidePics').click(function() {
				$('img').hide();$(this).hide();
				$('#showPics').show(200);$('#displayflag').val('hide');
			})
			// click 顯示圖片
			$('#showPics').click(function() {
				$('img').show();$(this).hide();
				$('#hidePics').show(200);$('#displayflag').val('show');
			})

			// click換首場時間
			$('select').change(function() {
				showTimeChange($(this));
			});

			// 準備當showType被點取時的欄位Id，click每個radio時會把hidden input設為相應的值
			var showTypeArray = ("2Ds1,3Ds1,2Ds2,3Ds2,2Ds3,3Ds3,2Ds4,3Ds4").split(',');
			$(showTypeArray).each(function() {
				$('#' + this).click(function() {
					showTypeChange($(this))
				});
			})

			// 點到某一廳時設為sActive
			$('.screen').each(function() {
				$(this).click(function() {
					$('.sActive').removeClass("sActive");
					$(this).addClass("sActive");
				})
			})

			// 當click重排按鈕時，刪除該廳所有的影片
			$('.reshuttle').click(function() {
				var target = $(this).parent().parent(); // 選到點擊按鈕的td
				reshuttle(target);
			})

			// click 全部重排，刪除全部的影片
			$('#resetAll').click(function() {
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
			
			// 點擊箭頭換日期
			$('#pre').click(function() {
				changeDay(this);
			});
			$('#next').click(function() {
				changeDay(this);
			});
			
			// 複製前一天
			$('#copy').click(function(){
				copyYesterDay();
			})
		}) // document.ready

		function copyYesterDay(){
			$('.screen').removeClass('sActive').addClass('finished');
			var date = new Date($('#showDate').val());			
			date.setDate(date.getDate() - 1 );
			getExistShowData(date.toLocaleDateString(),'copy');		
		}
		
 		// 改變首場時間
		function showTimeChange($target) {
			// $target 為所點取的首場時間select;
			
			// 找到點選的index
			var index = $target.parents('td').attr('id');
			
			// 取得首場時間日期資料
			var date = ssInDay[index].date;
			ssInDay[index].firstshow = $target.val();

			$(ssInDay[index].showlist).each(function(idx) {
						// if first show, start time is same with screenShows.firstshow
						if (idx == 0) {
							this.showTime = new Date(ssInDay[index].showDate + " "
									+ ssInDay[index].firstshow);
							this.end = new Date(this.showTime.getTime() + 60
									* 1000 * (this.showLength + this.restTime));
						} else {
							this.showTime = ssInDay[index].showlist[idx - 1].end;
							this.end = new Date(this.showTime.getTime() + 60*1000*(this.showLength + this.restTime));
						}
			})
			addShowOnWeb();
		}

		// 重新排程
		function reshuttle(target) {	
			// 找到td作為index，刪除已完成的screenShows
			var index = target.attr('id');			
			ssInDay[index] = _fnShow_screenListVO();
			finishtag =  $('#' + index + ' span');
			finishtag.html('未完成').addClass('btn-danger').removeClass('btn-success');	
			addShowOnWeb();
		}

		// 更換日期
		function changeDay(action) {
			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");

			var action = $(action).attr("id");
			var date = new Date($('#showDate').val());
			if (action == 'next') {

				// mark本來程式，打開下行可以新增一周後的場次
				date.setDate(date.getDate() + 1);
// 				if (date.getDay() == 3) {
// 					date.setDate(date.getDate() - 6);
// 				} else {
// 					date.setDate(date.getDate() + 1);
// 				}
			} else {
				// mark本來程式，打開下行可以新增一周前的場次			
				date.setDate(date.getDate() - 1);
// 				if (date.getDay() == 4) {
// 				 date.setDate(date.getDate() + 6);	
// 				 } else {
// 				 date.setDate(date.getDate() - 1);
// 				}
			}
			// 改變顯示日期，更新每一場show的日期		
			 getExistShowData(date.toLocaleDateString());
			 setDateDiv(date);
		} // changeDay


		function deleteAll() {
			// 可加入一個刪除的servlet，刪除已經存在的場次
			ssInDay = _fnShow_showInDayByScrrenVO();
			$('td h4 button').attr('disabled',false);
			$('.sActive').removeClass('sActive').removeClass('finished');
			$('#200').addClass('sActive');
			$('td span').html('未完成').addClass('btn-danger').removeClass('btn-success');	
			$('.showDiv').remove();
			$('#copy').attr('disabled',false);
			addShowOnWeb();
			toTop();
		}
		
		function addShowInScreen(movie) {
		
			// 使用sActive下的td id作為目前在哪一廳的index
			var targetScreenTd = $('.sActive').children('td');
			var screenIndex = targetScreenTd.attr('id');
			var targetScreen = ssInDay[screenIndex];
			
			
			if (!ssInDay[screenIndex].finished && screenIndex != null) {
				// 設定 targetScreen screenId、firstshow、showDate
				targetScreen.showDate = $('#showDate').val();
				targetScreen.screenId = targetScreenTd.parent().attr('id');
				targetScreen.firstshow = targetScreenTd.find('select').val();

				// 準備showVO儲存場次資料 
				var showVO = {};
				// 取得 點選的電影資料
				showVO.movieName = movie.name;
				showVO.movieId = movie.movieId;
				showVO.screenId = targetScreenTd.parent().attr('id');
				showVO.showLength = parseInt(movie.showLength);
				// 網頁上取得showType
				showVO.showType =$(".sActive input[name='showtype']").val();
				showVO.movieImage = movie.image;

				
				// 休息時間20分鐘 + 電影長度取10分鐘整數
				showVO.restTime = 20 + 10 - showVO.showLength % 10;
				
				// 使用javascript Date物件處理時間，new Date(yyyy/MM/dd HH:mm) 
				var showStart = new Date(targetScreen.showDate + " " + targetScreen.firstshow);


				// if showList 不是第一筆，取得前一筆showEnd時間作為show start時間
				var showNumberInScreen = ssInDay[screenIndex].showlist.length;
				if (showNumberInScreen > 0) {
					var preShow = ssInDay[screenIndex].showlist[showNumberInScreen - 1];
					showVO.showTime = preShow.end;
					showVO.end = new Date(showVO.showTime.getTime() + 60 * 1000
							* (showVO.showLength + showVO.restTime));
				} else {
					showVO.showTime = showStart;
					showVO.end = new Date(showStart.getTime() + 60 * 1000
							* (showVO.showLength + showVO.restTime))
				}  	
								
				// if 結束時間在8點以前或23點以後，表示當天這個廳已經滿場，新增一整天的場次到ssInDay
				if(showVO.showTime.getHours() >= 23 || showVO.showTime.getHours() < 8){
					ssInDay[screenIndex].finished = true;
					var targetDiv = $('.sActive');
					targetDiv.removeClass('sActive').addClass('finished');
				
					// 完成後捲軸自動往下
					$('html,body').scrollTop($(document).height() - $(window).height())
					
					if(targetDiv.next('tr').attr('id')!= 'screenEnd' && !ssInDay[screenIndex].finished ) {
						targetDiv.next().addClass('sActive');
					} else {					
						$('.screen').each(function(){
							if(!$(this).hasClass('finished')){
								$(this).addClass('sActive');
								return false;
							}
						})
						
					}
				} else {
					ssInDay[screenIndex].showlist.push(showVO);		
					ssInDay[screenIndex].finished = false;
				};
				
				addShowOnWeb();
			} // if (!ssInDay[screenIndex].finished && screenIndex != null) {
		}	// function addShowInScreen()
			
		/* showType 被點取改變的時候，設定hidden的input值跟著改變 */
		function showTypeChange($target) {
			var input = $target; //傳入的資料
			var index = input.attr('id').slice(3) - 1 //輸入目標最後一碼表示目前所在廳院
			var setTarget = $('input[name=showtype]')[index]; //取得輸出的目標
			$(setTarget).val(input.val()) //設定input[name=showtype]的值與輸入相同
		}

//---------------------------將電影場次顯示在網頁上的工作，統一由 showOnWeb執行 ， 日期時間由setDateDiv執行------------------------//
		function showOnWeb() {
			// 重製全部的場次div
			$('.showDiv').remove();

			// ssInDay內的index等於screen div的index,利用這點取得目標screenDiv，對A-D廳加入相關資訊
			$.each(ssInDay,function(index, value) {
				var screenDiv = $(".screen")[index];
				// 設定首場電影時間， 場次 2D、3D，finished					
				setScreen(this);			

				// 取得該廳下所有的電影場次，顯示在對應的screenDiv
				$(this.showlist).each(function() {	
				
					// 準備要掛載的場次div，已經有的場次結束時間就先別管了
				  	var showDiv = $("<div class='btn btn-info showDiv'></div>");
					var start = timeFormat(this.showTime);
					// var end = timeFormat(this.showTime,this.length);
					var image = getImage(this.movieImage);
					var movieName = nameFormat(this.movieName);

					showDiv.html(movieName + start).append(image)
					$(screenDiv).children().append(showDiv);
				}) // $(this.showlist).each
			}) // each ssInDay

			// 顯示圖片
			$('#showPics').hide();
			$('#hidePics').show();
			$('#displayflag').val('show');
			$('img').show();


			//---------------------------function In showOnWeb()----------/
			// 設定首場電影時間與showType(2D、3D)，finished tag 狀態
			function setScreen(target) {
					
				// 取得目標screenId ， 	// 網頁擷取的A、B、C、D廳
				var screedId = (target.screenId-200)/10;
				
				var targetFinishtag = $('#' + screedId + ' span');
				if(target.finished){
					targetFinishtag.html('完成').removeClass('btn-danger').addClass('btn-success');
				}
				
				// 取得目標Radio
				var targetRadio = $('#' + screedId + '>h4>input[type=radio]');
				// 取得目標hidden input 
				var showtype = $('#' + screedId + '>h4>input[name=showtype]');
				$($(targetRadio).children()).attr('checked',false);				
				// 判斷input的showType，設定到targetRadio
				if(target.showlist[0].showType == '2D'){
					$(targetRadio[0]).attr('checked','checked');
					showtype.val(targetRadio.val());
				} else if (target.showlist[0].showType == '3D'){
					$(targetRadio[1]).attr('checked','checked');	
					showtype.val(targetRadio.val());
				} 
								
				// 判斷input的firstTime，設定到target select - > option
				var targetSelect = $('#' + screedId + '>h4>select');	
				// 刪除預設的option
				$($(targetSelect).children()).attr('selected',false);
 				switch(target.firstshow.substr(0,5)){
 					case '08:40':  targetSelect[0].selectedIndex = 0 ;break;
 					case '09:00':  targetSelect[0].selectedIndex = 1 ;break;
 					case '09:20':  targetSelect[0].selectedIndex = 2 ;break;
 					case '09:40':  targetSelect[0].selectedIndex = 3 ;break;
 				}
			}
			
			function getImage(image) {
				// 傳入影片位址 image

				// 新增html tag
				var imgTag = $('<img>');

				// set attribute
				imgTag.attr("src", image);
				imgTag.attr("width", 100);
				return imgTag;
			}

			function timeFormat(showTime, length) {			
				
				var time = showTime.substr(0, 5)
				var ampm = showTime.substr(8, 4);
								
				// 隨便取得一個data物件，處理由servlet傳回的日期String
				var date = new Date();
				
				
				// 設定電影的時間與傳入start("08:40")字串相等
				date.setHours(showTime.substr(0, 2));
				date.setMinutes(showTime.substr(3, 2));

				// if有傳入電影長度，加上電影長度，回傳end time	
				if (length != null) {
					date.setMinutes(date.getMinutes() + parseInt(length));
				}
				// 沒傳入電影長度，回傳start time

				var dateString = date.toLocaleTimeString();
				var index = dateString.lastIndexOf(':');
				dateString = dateString.substr(0, index);
				return '<p>' + ampm + " " + time + '</p>';
			}

			// 修正電影名稱過長			
			function nameFormat(movieName) {
				var name = "<p>" + movieName + "</p>";
				
				// 如果電影名稱長度超過8			
				if (movieName.length > 8) {
					var splitIndex = movieName.search('：');
					// 而且含有 ":"，就以":"做分行
					if (splitIndex != -1) {
						name = "<p>" + movieName.substring(0, splitIndex)
								+ "<br>" +
						movieName.slice(splitIndex) + "</p>";
					}
				}
				return name;
			}
		} // showOnWeb		

		//show date time	
		function setDateDiv(date) {
			var dayString = "日,一,二,三,四,五,六";
			var weekDay = dayString.split(",");			
			// 設定顯示的日期
			$('#dateDiv').html(date.toLocaleDateString() + ' 星期' + weekDay[date.getDay()]);
			// hidden的input
			$('#showDate').val(date.toLocaleDateString());				
		}
	
//-------------------------------------初始化init()----------------------------------------//	
		function init() {
			$('#hidePics').hide();
			getMovieTable(getData());
			getExistShowData(getStartDate());
		}

		// get start date String(取得下周四的日期字串作為起始日)
		function getStartDate() {
			var startDate = new Date();
			do {
				startDate.setDate(startDate.getDate() + 1);
			} while (startDate.getDay() != 4) // 4 = 星期四

			// 顯示今日時間與設定hidden input時間
			setDateDiv(startDate);
			
			return startDate.toLocaleDateString();
		}
						
		
		// 取得日期內的場次排程
		function getExistShowData(date,type) {
			var date = date;
			$.ajax({
				async : true,
				data : {
					start : date,
					end : date
				},
				type : "POST",
				url : "getshowByDate.do",
				dataType : "Json",
				success : function(result) {	
					if(result.length > 0 && type == 'copy'){
						sortExistShowData(result,type);
						addShowOnWeb();
						$('#copy').attr('disabled','disabled');
						$('td h4 span').attr('disabled',false);

					} else if(result.length > 0){
						sortExistShowData(result);
						showOnWeb();
						$('#copy').attr('disabled','disabled');
						$('td h4 button').attr('disabled','disabled');
					} else {

						// 顯示圖片
						$('#showPics').show();
						$('#hidePics').hide();
						$('#displayflag').val('hide');
						$('img').hide();					
						$('#copy').attr('disabled',false)
						$('td h4 button').attr('disabled',false);
						var finishtag = $('td h4 span').html('未完成').addClass('btn-danger').removeClass('btn-success');
						$('.showDiv').remove();
						ssInDay = _fnShow_showInDayByScrrenVO();
						$('.screen').removeClass('finished');
						
						$('.screen').each(function(){
							if(!$(this).hasClass('finished')){
								$(this).addClass('sActive');
								return false;
							}
						});			
					}
				}
			});
		}

		// 將取回的資料依廳做分類，type='copy'複製前一天日期須重新設定 
		function sortExistShowData(result,type) {
			// 重置存放資料的ssInDay
			ssInDay = _fnShow_showInDayByScrrenVO();
			
			// copy前一天，重設showTime為Date物件型態，
			if(type=='copy'){
				date = $('#showDate').val().replace('/','-').replace('/','-');				
				$(result).each(function() {
					var time = timeFormat(this.showTime);
					this.showTime = new Date(date + time);
					this.showLength = parseInt(this.length);
					this.showType = (this.showType=='2D') ? 21:31;
					this.restTime =  20 + 10 - this.showLength % 10;
					this.end = new Date(this.showTime.getTime() + 60 * 1000
							* (this.showLength + this.restTime));
					
					delete this.length;
					delete this.movieEname;
					delete this.showId;
					delete this.showDate;
				});
			}
			
			$(result).each(function() {
				switch (this.screenId) {
				case 200:
					// 將每場show依序放入showlist
					ssInDay[0].showlist.push(this);
					ssInDay[0].screenId = this.screenId;	
					ssInDay[0].finished = true;				
					// 設定放映日期、時間  一樣分為是不是copy
					if(type=='copy'){
						ssInDay[0].showDate = $('#showDate').val();
						ssInDay[0].firstshow = '0'	+ ssInDay[0].showlist[0].showTime.toLocaleTimeString().substr(2,4);
					} else{
						ssInDay[0].showDate = ssInDay[0].showlist[0].showDate;
						ssInDay[0].firstshow = ssInDay[0].showlist[0].showTime;						
					}
					break;
				case 210:
					ssInDay[1].showlist.push(this);
					ssInDay[1].screenId = this.screenId;	
					ssInDay[1].finished = true;	
					if(type=='copy'){
						ssInDay[1].showDate = $('#showDate').val();
						ssInDay[1].firstshow = '0'	+ ssInDay[0].showlist[0].showTime.toLocaleTimeString().substr(2,4);
					} else{
						ssInDay[1].showDate = ssInDay[0].showlist[0].showDate;
						ssInDay[1].firstshow = ssInDay[0].showlist[0].showTime;						
					}
					break;
				case 220:
					ssInDay[2].showlist.push(this);
					ssInDay[2].screenId = this.screenId;	
					ssInDay[2].finished = true;	
					if(type=='copy'){
						ssInDay[2].showDate = $('#showDate').val();
						ssInDay[2].firstshow = '0'	+ ssInDay[0].showlist[0].showTime.toLocaleTimeString().substr(2,4);
					} else{
						ssInDay[2].showDate = ssInDay[0].showlist[0].showDate;
						ssInDay[2].firstshow = ssInDay[0].showlist[0].showTime;						
					}
					break;
				case 230:
					ssInDay[3].showlist.push(this);
					ssInDay[3].screenId = this.screenId;		
					ssInDay[3].finished = true;	
					if(type=='copy'){
						ssInDay[3].showDate = $('#showDate').val();
						ssInDay[3].firstshow = '0'	+ ssInDay[0].showlist[0].showTime.toLocaleTimeString().substr(2,4);
					} else{
						ssInDay[3].showDate = ssInDay[0].showlist[0].showDate;
						ssInDay[3].firstshow = ssInDay[0].showlist[0].showTime;						
					}
					break;
				}
			})
			return ssInDay;
			
			function timeFormat(time){
				var ampm = time.slice(9);
				var hour = time.substr(0,2);
				var minute = time.substr(3,2);
				if(ampm == '下午' ){
					hour = parseInt(hour) + 12;
				}
				return " " + hour + ':' + minute
			}
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
		//----------------------------------初始化結束----------------------------------------//					

//--------------------------------存放資料的VO-------------------------------------------------//					
		// 放映廳每日的資料
		function _fnShow_screenListVO() {
			return {
				screenId : "",
				showlist : [],
				showDate : "",
				firstshow : "",
				finished:false,
				ticketType : "",
			}
		}
		
		// 存放4個放映廳的資料
		function _fnShow_showInDayByScrrenVO() {
			return [ _fnShow_screenListVO(), _fnShow_screenListVO(),
					_fnShow_screenListVO(), _fnShow_screenListVO() ]

		}
		
		function _fnShow_showVO(){
			
			return {
					
			
			}
		}

//--------------------------------資料寫入database----------------------------------------------------//							
		function insertShows() {
			// Date物件經過json轉換時間會重00:00開始算，先將時間轉字串來解決這個問題
			$(ssInDay).each(function() {
				$(this.showlist).each(function() {
					var date =  this.showTime.toLocaleDateString().replace('/','-').replace('/','-');
					var hour = this.showTime.getHours();
					var minutes = ""+ this.showTime.getMinutes();
					if(hour<10){hour = "0"+hour;}
					if(minutes.length == 1){minutes = "0" + minutes;}
					this.start =  date + " " + hour + ":" + minutes+":00";
				});
			});

			$.ajax({
				async : false,
				data : {
					data : JSON.stringify(ssInDay)
				},
				type : "POST",
				url : "addShow.do",
				success : function(result) {
					if(confirm("新增完成，跳轉至下一天，是否複製前一天檔期")){
						changeDay($('#next'));					
						copyYesterDay();
						$('html,body').animate({
							scrollTop:($(document).height() - $(window).height())
						},200)
					} else {
						changeDay($('#next'));			
						toTop();
					}
				}
			});

		}
		
		//---------------------------將電影場次顯示在網頁上的工作，統一由 addShowOnWeb執行 ， 日期時間由setDateDiv執行------------------------//
		function addShowOnWeb() {
			// 重製全部的場次div
			$('.showDiv').remove();

			// ssInDay內的index等於screen div的index,利用這點取得目標screenDiv，對A-D廳加入相關資訊
			$.each(ssInDay,function(index, value) {
				var screenDiv = $(".screen")[index];
				
				// 取得該廳下所有的電影場次，顯示在對應的screenDiv
				$(this.showlist).each(function() {								
					// 準備要掛載的場次div
				  	var showDiv = $("<div class='btn btn-info showDiv'></div>");
					var start = timeFormat(this.showTime);
					var end = timeFormat(this.showTime,this.showLength);					
					var movieImage = getImage(this.movieImage);
					var movieName = nameFormat(this.movieName);

					showDiv.html(movieName + start + end).append(movieImage)
					$(screenDiv).children().append(showDiv);
				}) // $(this.showlist).each
				
				setScreen(this);			
			}) // each ssInDay

			// 隱藏圖片
			if ($('#displayflag').val() == 'hide') {
				$('img').hide();
			}

			//---------------------------function In addShowOnWeb()----------/

			// 設定首場電影時間與showType(2D、3D)，finished tag 狀態
			function setScreen(target) {

				var screenId = 	(target.screenId-200)/10;			
				var finishtag = null;
				// 取得目標finishtag
				if(screenId >= 0 && target.finished){
					finishtag =  $('#' + screenId + ' span');
					finishtag.html('完成').removeClass('btn-danger').addClass('btn-success');			
				} else {
					finishtag =  $('#' + screenId + ' span');
					finishtag.html('未完成').addClass('btn-danger').removeClass('btn-success');						
				}
			}
			
			function getImage(image) {
				// 傳入影片位址 image

				// 新增html tag
				var imgTag = $('<img>');

				// set attribute
				imgTag.attr("src", image);
				imgTag.attr("width", 100);
				return imgTag;
			}

			function timeFormat(showTime, length) {				
				// 由網頁取得的showTime為Date物件，須先轉為String
				var minutes =""+showTime.getMinutes();
				var hours =  showTime.getHours();
				if(minutes.length == 1){
						minutes = "0" + minutes;
				}
				if(hours < 10){
					hours = "0" + hours;
				}								
				showTime = hours + ":" + minutes;		
				// 隨便取得一個data物件，處理由servlet傳回的日期String
				var date = new Date();
	
				// 設定電影的時間與傳入start("08:40")字串相等
				date.setHours(showTime.substr(0, 2));
				date.setMinutes(showTime.substr(3, 2));


				// if有傳入電影長度，加上電影長度，回傳end time	
				if (length != null) {
					date.setMinutes(date.getMinutes() + parseInt(length));
				}
				// 沒傳入電影長度，回傳start time

				var dateString = date.toLocaleTimeString();
				var index = dateString.lastIndexOf(':');
				dateString = dateString.substr(0, index);
				return '<p>' + dateString + '</p>';
			}

			// 修正電影名稱過長			
			function nameFormat(movieName) {
				var name = "<p>" + movieName + "</p>";
				
				// 如果電影名稱長度超過8			
				if (movieName.length > 8) {
					var splitIndex = movieName.search('：');
					// 而且含有 ":"，就以":"做分行
					if (splitIndex != -1) {
						name = "<p>" + movieName.substring(0, splitIndex)
								+ "<br>" +
						movieName.slice(splitIndex) + "</p>";
					}
				}
				return name;
			}
		} // showOnWeb		

		function toBottom() {
			$('html,body').animate({
					scrollTop:($(document).height() - $(window).height())
			},200)
		}

		function toTop() {		
			$('html,body').animate({
				scrollTop:(0)
			},200)		
		}
	</script>
</body>

</html>
