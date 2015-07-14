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
.seat {
	margin: 5px 2px;
	width: 2em;
	height: 2em;
	border: solid 1px black;
}

.titleTime {

}

.titleDate {
	font-size: 0.5em;
}

.page-wrapper {
	margin-top:2em;
}


.overtime {
	margin: 5px 2px;
	width: 2em;
	height: 2em;
	border: solid 1px black;
	width: 2em;
	background-color: gray;
}

#selldiv {
	margin-top: 2em;
	margin-bottom: 10em;
}

#selldiv>div>span {
	margin: 0em 1em;
}

.row.text.text-center {
	margin-top: 0.5em;
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
					<div class="col-xs-1" id='showTicket'></div>
					<div  class="col-xs-7  text-center">
						<div class="col-xs-12" id="seats"></div>
					</div>
					
					<div class="col-xs-3">				
						<div class="col-xs-12 thumbnail title  ">
							<div>
								<h3>
									<span class="alert ">${screenVO.screenName}</span><span
										class="alert titleDate ">${screenVO.showDate}</span> <span
										class="titleTime ">${screenVO.showTime}</span>
								</h3>
								<div class="col-xs-12 " id="title">
									<h3>
										<span class="alert ">${screenVO.movieName}
											${screenVO.movieEname} </span>
									</h3>
								</div>
							</div>
						</div>

						<div class="col-xs-12">
							<img src='${screenVO.movieImage}' width='250'
								class='img-thumbnail' />
						</div>

					</div>	
					
				</div>

				<div class="row text text-center" id='selldiv'>
					<div class="col-xs-9">
						<span class="btn "></span> <span class="btn "></span> <span
							class="btn btn-lg btn-success" id='sell'>售票</span> <span
							class="btn "></span> <span class="btn btn-lg btn-warning"
							id='reselect'>重選</span> <span class="btn btn-lg btn-danger"
							id='refund'>退票</span>
					</div>
				</div>


				<!-- /vcenter -->
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
		var _ticketList = [];  // 儲存所有票的資料
		$(document).ready(function() {
			getTickets();
			showSeat();
			setStatus();
			console.log("${overTimeFlag}")	
							
			// 點擊選取 空座位 
			$('.bookable').each(function(){
				$(this).click(function(){
					selectSeat($(this));
				})
			});
			// 賣票
			$('#sell').click(function(){
				$('.selectSeat').each(function(){
					sell($(this));		
				})
				resetShowTicket;setStatus;
			});
					
			// 點擊選取 已賣出 座位
			$('.sold').each(function(){
				$(this).click(function(){
					selectSold($(this));
				})
			});			
			// 退票
			$('#refund').click(function(){		
				$('.refund').each(function(){
					refund($(this));		
				});
				resetShowTicket;setStatus;
			});
			
			// 重選
			$('#reselect').click(function(){
				resetShowTicket;setStatus;
			});			
			
		});
		
		function sell(ticket){
			// 取得要賣的票，狀態設為sold
			var index = ticket.attr('id');
			var sTicket = _ticketList[index];
			sTicket.status = 'sold';
			
			$.post("updateTicket.do",{ticket:JSON.stringify(sTicket),type:"sell"},function(){
				setStatus();
			});
		}
	
		function refund(ticket) {
			// 取得要退的票，狀態設為bookable
			var index = ticket.attr('id');
			var sTicket = _ticketList[index];
			sTicket.status = 'bookable';	
			$.post("updateTicket.do",{ticket:JSON.stringify(sTicket),type:"refund"},function(){
				setStatus();
			});			
		}
		
		// 選擇可賣座位
		function selectSeat(target){		
			/*
			// 已賣出的座位不能選，退票按鈕不能按
			$('.sold').each(function(){
				$(this).attr("disabled","disabled")
			})
			$('#refund').attr("disabled","disabled")	
			*/
			// 改變座位顏色, success表示被選取座位
			target.toggleClass('btn-default');
			target.toggleClass('btn-success');
			target.toggleClass('selectSeat');
			
			// 如果選擇的座位為0個，恢復賣出座位與退票紐
			if($('.selectSeat').length == 0){
				$('.sold').each(function(){
					$(this).attr("disabled",false)
				})
				$('#refund').attr("disabled",false)				
			}
			
			var seatDiv = null;
			// 顯示選擇的座位
			$('.selectSeat').each(function(){
				console.log(this)
				var index = target.attr('id');
				seatDiv = $('<div></div>');
				seatDiv.addClass('btn btn-block btn-default');
				seatDiv.append('座位:' + _ticketList[index].seatX + '-' + _ticketList[index].seatY)					
			});		
			$('#showTicket').append(seatDiv)
		} // select seat
		
		// 選擇已售座位
		function selectSold(target){
			/*
			// 未賣出的座位不能選，售票按鈕不能按
			$('.bookable').each(function(){
				$(this).attr("disabled","disabled")
			})
			$('#sell').attr("disabled","disabled")	
			*/
			target.toggleClass('btn-danger');
			target.toggleClass('btn-info');
			target.toggleClass('refund');
			
			// 如果選擇的座位為0個，恢復可賣座位與售票紐
			if($('.refund').length == 0){
				$('.bookable').each(function(){
					$(this).attr("disabled",false)
				})
				$('#sell').attr("disabled",false)				
			}
			// 顯示選擇的座位
			$('.refund').each(function(){
				console.log(this)
				var index = target.attr('id');
				seatDiv = $('<div></div>');
				seatDiv.addClass('btn btn-block btn-default');
				seatDiv.append('座位:' + _ticketList[index].seatX + '-' + _ticketList[index].seatY)					
			});		
			$('#showTicket').append(seatDiv)	
		}
		
		// 顯示座位表
		function showSeat() {
			// var rowLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			var screenId = ${screenVO.screenId};
			
			var xMax = ${screenVO.rowX};
			// yMax + 2 = 空出來的走道 
			var yMax = ${screenVO.rowY}+2;
			var seatsTable = $('#seats');			
			console.log($('#seats').size());
			// 使用傳入參數改變影廳座位表
			switch (screenId){
				case 200:  setTicket(3)	;break;
				case 210:  setTicket(3)	;break;
				case 220:  setTicket(6)	;break;
				case 230:  setTicket(6)	;break;
			}

			function setTicket(n){
				var index = 0;	
				for (var x = 1; x <= xMax; x++) {
					var row = $("<div class='row seatRow'></div>");
					for (var y = 1; y <= yMax; y++) {
						// 前n排，左右各空出4格
						if(x <= n && y<5 || x <= n && y > yMax-4) { 				
						} else if(y == 5 || y == yMax-4) { 
							// 如果是第5個位子，插入空白做為走到
							var seat = $('<div></div>');
							seat.addClass("btn btn-lg");		
							row.append(seat);						
						} else{
							var seat = $('<div></div>');
							seat.addClass("btn btn-lg seat");
							seat.attr("id",index++); // 設定票的編號( 0  ~ max-1)對應_ticketList
							row.append(seat);
						}	
					} // for y
					seatsTable.append(row);
				} // for x
			} //setTicket
		} //function showSeat() 
		
		function getTickets() {	
			<c:forEach var="t"  items="${tickets}" varStatus="status">
				var ticket = {};
				ticket.seatX = "${t.seatX}";
				ticket.seatY = "${t.seatY}";
				ticket.showId = "${t.showId}";
				ticket.screenId = "${t.screenId}";
				ticket.ticketTypeId = "${t.ticketTypeId}";
				ticket.orderNo = "${t.orderNo}";
				ticket.status = "${t.status}"			
				_ticketList.push(ticket);
			</c:forEach>			
		}
		
		function setStatus(){
			$('.seat').each(function(index){	
				$(this).attr("disabled",false)
				target = $(this);
				
				switch (_ticketList[index].status){
					case 'bookable': bookable(target);  break;
					case 'overtime': overtime(target); break;			
					case 'sold': sold(target);break;	
					default : bookable(target);
				}
	
				function bookable(target){	
					target.removeClass();
					target.addClass('seat btn ');
					target.addClass('btn-default');
					target.addClass('bookable');
				}
				
				function sold(target){
					target.removeClass();
					target.addClass('seat btn ');
					target.addClass('btn-danger');
					target.addClass('sold');						
				}
				
				function overtime(target){
					target.removeClass();
					target.addClass('seat btn ');
					target.addClass('btn-success');
					target.addClass('overtime');								
				}
			});
		} // function setStatus 
		
		function resetShowTicket(){
			$('#showTicket').html("");
			
		}
	</script>

</body>

</html>
