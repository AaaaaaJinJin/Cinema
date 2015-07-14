<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="tw">

<head>
<!-- head -->
<jsp:include page="/admin/fragments/head.jsp" />

<style>
.schartDiv,.bchartDiv {
	width: 48em;
	height: 36em;
}

.cDiv{
	margin-bottom:10em;
}
#movieTagRow {
	margin-top: 2em;
	padding-left:15em;
	padding-right:5em;
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
					<div class="col-xs-12">
						<h1 class="page-header">統計資訊</h1>
					</div>
					<!-- /.col-xs-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<ul class="nav nav-tabs">
						<li role="presentation" class="active lead"><a
							href="statist.jsp">票房走勢</a></li>
						<li role="presentation" class=" lead"><a
							href="statist-taipei.jsp">台北票房</a></li>
						<li role="presentation" class=" lead"><a
							href="statistweek-taipei.jsp">台北週末票房排行榜</a></li>
						<li role="presentation" class="lead"><a
							href="statistweek-usa.jsp">全美週末票房排行榜 </a></li>
					</ul>


				</div>
				<!-- /.row -->

				<div class ='well row' id='movieTagRow'>

				</div>
				<div class="row">
					<div id="BchartRow" class="col-xs-6 cDiv"></div>
	
					<div id="SchartRow" class="col-xs-6 cDiv" ></div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- footer -->

	<jsp:include page="/admin/fragments/footer.jsp" />


	<script src="//cdn.bootcss.com/flot/0.8.3/excanvas.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.min.js"></script>
	<script src="//cdn.bootcss.com/flot/0.8.3/jquery.flot.time.min.js"></script>
	
</body>

<script>
	$(function() {
		$.ajax({
			async : true,
			url : "getSoldRatePerDay.do",
			data : {},
			dataType : "json",
			success : function(data) {
				showSoldRate(data);				
			}
		});
		
		$.ajax({
			async : true,
			url : "getBoxOfficeByMoive.do",
			data : {},
			dataType : "json",
			success : function(data) {
				showBoxOffice(data);
				$('.movieTag').click(function(){
					changeMovie(this);
				})
			}
		});
		
		

		
	}) // document.ready

	function changeMovie(targe){
		console.log(targe)
	}
	
	
	// 累積票房bar chart
	function showBoxOffice(data) {
		// 產生圖表需要三個資料 1.div 2.dataSet{資料} 3.options{設定} 
		// dataSet = [object,object,object] , 每個object代表一條折線
		// object.data <-- 折線的每一個[X,Y]點陣列 

	 		var chartSet = {
	 			grid: {
	 				    hoverable: true,
	 				    borderWidth: 3,        
	 				    backgroundColor: { colors: ["#ffffff", "#EDF5FF"] }
	 				},
				xaxis : {
					mode : "time",
		            tickSize: [1, 'day'],
					tickLength: 0,
					color: "black"			            
				},
				legend : {
					show:false,
				},
			
			}		
		
		// 依電影開始進行資料分類
		$.each(data, function(key, value) {
			// 準備要顯示的charDiv，使用電影名稱做為id
			var movieTagDiv = $("<div class='col-xs-2 btn btn-info movieTag'><div>");
			movieTagDiv.text(key);
			$('#movieTagRow').append(movieTagDiv);			


			chartSet.xaxis.min = (new Date(2015,06,07).getTime())
			chartSet.xaxis.max = (new Date(2015,06,13).getTime())
			

			var totalList = {};
			var boxOfficeList = {};

			// boxoffice 儲存每一部電影再週期內(1~2周)每日的票房資料
			var boxoffice = [];			
			var totalBox = [];			

			var preBoxOffice = 0;
			var lastDate = null;
			$(value).each(function() {
				// 每一點由 x(時間long)，y(票房)組成
				var date = new Date(this.showDate).getTime()+8*60*60*1000;
				totalBox.push([ date, this.boxOffice/1000 + preBoxOffice]);
				boxoffice.push([ date, this.boxOffice/1000]);
				preBoxOffice += this.boxOffice/1000;			
				lastDate = date;
			})

			boxoffice.push([ lastDate + 24*60*60*1000,0]);

			
			totalList.data = totalBox;
			totalList.label = key;
			totalList.color = "#5482FF";
			totalList.bars = {
		            show: true,
		            barWidth: 0.4,
		            lineWidth: 50,
		            align: 'right',
		            //barWidth: 12*24*60*60*300,
	                fill: true,
		    }
			boxOfficeList.color = "#FF0000";			
			boxOfficeList.data = boxoffice;
			boxOfficeList.label = key;
			boxOfficeList.lines = {show:true};
			// 將每周的票房資料加入顯示清單
			var dataSet = [];			
			dataSet.push(totalList);

			dataSet.push(boxOfficeList);
			// 準備要顯示 chart的chartDiv
			var chartDiv =  $("<div class='bchartDiv '> </div>");	
			$('#BchartRow').append(chartDiv);		
 			$.plot(chartDiv, dataSet, chartSet);		

		});
	//	$('.bchartDiv').hide();
		$($('.bchartDiv')[0]).show();
		$($('.movieTag')[0]).addClass('btn-success').removeClass('btn-info')
	}	
	
	

	// 入座率chart
	function showSoldRate(data) {
 		var chartSet = {
				grid : {
					backgroundColor : {
						colors : [ "#B0D5FF", "#5CA8FF" ]
					}
				},
				xaxis : {
					mode : "time",
					tickSize: [1, "day"],   
				
     
				},
				legend : {
					position : "nw"
				},
				points : {
					symbol : "circle",
					fillColor : "#FF0000",
					show : true
				},
				lines: {show:true},
				color:"#5482FF"
			}		
		// 依電影開始進行資料分類
		$.each(data, function(key, value) {
			var dataList = {

			};

			// soldRate 儲存每一部電影再週期內(1~2周)每日的入座濾資料
			var soldRate = [];
			$(value).each(function() {
				// 每一點由 x(時間long)，y(票房)組成
				var date = new Date(this.showDate).getTime()+8*60*60*1000;
				soldRate.push([ date, this.soldRate]);
			})
			dataList.data = soldRate;
			dataList.label = key;

			// 將每周的票房資料加入顯示清單
			var dataSet = [];			
			dataSet.push(dataList);
			// 準備要顯示 chart的chartDiv
			var chartDiv =  $("<div class='schartDiv '> </div>");	
			$('#SchartRow').append(chartDiv);				
 			$.plot(chartDiv, dataSet, chartSet);	
		});
	//	$('.schartDiv').hide();
		$($('.schartDiv')[0]).show();				
	}		
</script>

</html>
