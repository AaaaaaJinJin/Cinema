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
.selectDate, #dateDiv {
	margin-left: 9.8em;
}

.list-group {
	margin-top: 2em;
	margin-left: 1em;
}

#showdate {
	padding: -5px;
	font-size: 1.2em;
	font-weight: bold;
}

.label-default {
	margin-top: 2em;
	font-size: 1.2em;
	margin-left: 1em;
}

.sActive {
	background-color: lavenderblush;
}

.col-xs-11 {
	margin: 1em 1em;
}

.screenTitle {
	font-size: 2em;
}

.show {
	width:10em;
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
						<li role="presentation" class=" lead"><a
							href="createshow.jsp">新增檔期</a></li>					
						<li role="presentation" class="active lead"><a
							href="preshow.jsp">上周檔期</a></li>					
						<li role="presentation" class=" lead"><a
							href="show.jsp">本周檔期</a></li>
						<li role="presentation" class="lead"><a href="nextshow.jsp">下周檔期</a></li>

					</ul>


					<div class="row list-group text text-center">
						<div class="row col-xs-7" id="dateDiv">
							<h3></h3>
						</div>
						<div class="row">
							<div class="col-xs-12 selectDate ">
								<div class="col-xs-1 weekdate list-group-item list-group-item-info btn"
									id="">星期四</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期五</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期六</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期日</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期一</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期二</div>
								<div class="col-xs-1 weekdate list-group-item btn" id="">星期三</div>
							</div>
						</div>


						<div class="row showDiv" id="d0">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d0screen200"><span class="btn btn-lg screenTitle col-xs-1">A廳</span></div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d0screen210"><span class="btn btn-lg screenTitle col-xs-1">B廳</span></div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d0screen220"><span class="btn btn-lg screenTitle col-xs-1">C廳</span></div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d0screen230"><span class="btn btn-lg screenTitle col-xs-1">D廳</span></div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->

						<div class="row showDiv" id="d1">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d1screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d1screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d1screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d1screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->

						<div class="row showDiv" id="d2">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d2screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d2screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d2screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d2screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->

						<div class="row showDiv" id="d3">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d3screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d3screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d3screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d3screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->



						<div class="row showDiv" id="d4">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d4screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d4screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d4screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d4screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->

						<div class="row showDiv" id="d5">
							<div class="col-xs-12">
								<div class="alert">
									<div class="col-xs-11" id="d5screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">

									<div class="col-xs-11" id="d5screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d5screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d5screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->

						<div class="row showDiv text text-left" id="d6">
							<div class="col-xs-12">
								<div class="alert">

									<div class="col-xs-11" id="d6screen200">
										<span class="btn btn-lg screenTitle col-xs-1">A廳</span>
									</div>
								</div>
								<div class="alert">
									<div class="col-xs-11" id="d6screen210">
										<span class="btn btn-lg screenTitle col-xs-1">B廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d6screen220">
										<span class="btn btn-lg screenTitle col-xs-1">C廳</span>
									</div>
								</div>
								<div class="alert ">

									<div class="col-xs-11" id="d6screen230">
										<span class="btn btn-lg screenTitle col-xs-1">D廳</span>
									</div>
								</div>
								<!-- /.alert -->
							</div>
							<!-- col-xs-12 -->
						</div>
						<!-- .row -->



					</div>
					<!-- .row -->
				</div>
				<!-- .row -->
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
			$('.showDiv').hide();
			var showList = {
				d0 : [],
				d1 : [],
				d2 : [],
				d3 : [],
				d4 : [],
				d5 : [],
				d6 : []
			};
			var date = getDate();
			var weekShowList = getData(date);

			// 依照星期(0=日) 分類show
			$(weekShowList).each(function() {
				switch (new Date(this.showDate).getDay()) {
				case 0:
					showList.d0.push(this);
					break;
				case 1:
					showList.d1.push(this);
					break;
				case 2:
					showList.d2.push(this);
					break;
				case 3:
					showList.d3.push(this);
					break;
				case 4:
					showList.d4.push(this);
					break;
				case 5:
					showList.d5.push(this);
					break;
				case 6:
					showList.d6.push(this);
					break;
				}
			});

			showOn(showList);
			// click換顯示內容
			$('.weekdate').click(function(){
				var date = this.id;
				setShowDate(new Date(date));
			})
			
		}) //$(function)

		/* 以下參考check.jsp註解 */
		function getData(date) {
			var result = null;

			$.ajax({
				async : false,
				url : "getshowByDate.do",
				data : {
					start : date.thursday,
					end : date.wednesday
				},
				dataType : "json",
				success : function(data) {
					result = data;
				}
			});
			return result;
		}

		// 尋找星期四，作為第一筆資料
		function getDate() {
			var date = {}; // 使用date物件裝時間參數
			var start = new Date(); // 取得現在時間

			date.weekDay = start.getDay(); // 取得星期?
			date.start = start.toLocaleDateString(); // 將現在時間轉為string，放入 date.start

			// find thursday，今天不是星期四，往前尋找
			while (start.getDay() != 4) {
				start.setDate(start.getDate() - 1);
			}
			// 找到本周四在減7特定為上周四，
			start.setDate(start.getDate() - 7);
			
			// 顯示上周四資料
			setShowDate(start);
			// 將星期四的日期字串，放入date.thursday
			date.thursday = start.toLocaleDateString();
			
			// 依序將一周的字串放入 .weekdate的id中，作為點選改變日期參數
			$('.weekdate').each(function(){
				this.id = start.toLocaleDateString();
				start.setDate(start.getDate() + 1)			
			})

			//  將星期三的日期字串，放入date.thursday
			start.setDate(start.getDate() - 1);	
			date.wednesday = start.toLocaleDateString();


			return date;
		}

		// 顯示所選到日期
		function setShowDate(date) {
			var index = parseInt(date.getDay());
			var weekIndex= date.toLocaleDateString();
			// 顯示
			$('.showDiv').hide();
			$('#d' + index).show();

			if(index >= 4){
				index = index-4;
			} else {
				index = 7 + index - 4 ;	
			}
			
			
			// 設定week day tag
			$('.weekdate').removeClass("list-group-item-info");
			$($('.weekdate')[index]).addClass("list-group-item-info");

			$('#dateDiv>h3').html(date.toLocaleDateString());

		}

		// 將分類好的show，依傳入的星期幾index顯示
		function showOn(showList) {
			$.each(showList, function(date, shows) {
				$(shows).each(
						function() {
							// 取得要顯示的目標格
							var selectString = '#' + date + 'screen'
									+ this.screenId;
							var targetDiv = $(selectString);
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

							var showDiv = $('<div></div>');
							showDiv.addClass('btn btn-default col-xs-1 show')

							showDiv.append(name).append(showTime)
							//.append("<img src=" + image + " />");

							targetDiv.append(showDiv)
						})
			});
		}
	</script>

</body>

</html>
