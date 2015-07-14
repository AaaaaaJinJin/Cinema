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
	.movietableDiv {
		padding:2em;
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
						<h1 class="page-header">電影管理</h1>
					</div>
				</div>

				<div class="row">
					<ul class="nav nav-tabs">
						<li role="presentation" class=" lead"><a href="movie.jsp">新增電影資料</a></li>
						<li role="presentation" class="active lead"><a
							href="edit.jsp">修改/刪除電影資料</a></li>
					</ul>

					<div class="alert alert-warn row" id="editDiv">
						<form action="updateMovie.do" method="post"
							enctype="multipart/form-data">
							<div class="form-horizontal">

<!-- 								<div class="row form-group"> -->
<!-- 									<label class="control-label col-xs-1">電影ID</label> -->
<!-- 									<div class="col-xs-2"> -->
										<input class="form-control" type="hidden" id="movieId" name="movieId"
											readonly>
<!-- 									</div> -->
<!-- 								</div> -->

								<div class="row form-group">
									<label class="control-label col-xs-1">電影名稱</label>
									<div class="col-xs-2">
										<input class="form-control" id="name" name="name" required>
									</div>
									<label class="control-label col-xs-1">英文名稱</label>
									<div class="col-xs-2">
										<input class="form-control" id="eName" name="eName" required>
									</div>
									<label class="control-label col-xs-1">影片分級</label>
									<div class="col-xs-4">
										<label class="radio-inline"> <input type="radio"
											name="movieRating" value="普遍級"> 普遍級
										</label> 
										<label class="radio-inline"> <input type="radio"
											name="movieRating" value="保護級" required> 保護級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="輔導級"> 輔導級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="限制級"> 限制級
										</label>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">導演</label>
									<div class="col-xs-2">
										<input id="director" name="director" class="form-control"
											required>
									</div>
									<label class="control-label col-xs-1">演員</label>
									<div class="col-xs-2">
										<input id="actors" name="actors" class="form-control" required>
									</div>
									<label class="control-label col-xs-1">發行公司</label>
									<div class="col-xs-2">
										<input id="company" name="company" class="form-control"
											required>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">上映日期</label>
									<div class="col-xs-2">
										<input type="date" class="form-control" id="debutDate"
											name="debutDate" value="2015-06-26" required>
									</div>
									<label class="control-label col-xs-1">片長</label>
									<div class="col-xs-1">
										<input id="showLength" name="showLength" class="form-control">
									</div>	<label class="control-label">分鐘</label>		
								</div>

								<div class="row form-group">

									<label class="control-label col-xs-1">影片分類</label>
									<div class="col-xs-8">
										<label class=".checkbox-inline "> <input
											type="checkbox" multiple name="movieType" value="動作">
											動作
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="喜劇"> 喜劇
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="愛情"> 愛情
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="劇情"> 劇情
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="恐怖"> 恐怖
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="懸疑"> 懸疑
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="驚悚"> 驚悚
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="記錄"> 記錄
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="科幻"> 科幻
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="歌舞"> 歌舞
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="動畫"> 動畫
										</label><label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="冒險"> 冒險
										</label>

									</div>
								</div>


							</div>
							<div class="row">
								<label class="control-label col-xs-1 text-right">海報</label>
								<div class="col-xs-11">
									<input name="image" type="file" id="image">
								</div>
								<div class="col-xs-11">
									<img id="imagePreView">
								</div>
							</div>


							<hr />

							<div class="form-horizontal">
								<div class="row form-group">
									<label class="control-label col-xs-1">國家</label>
									<div class="col-xs-2">
										<input class="form-control" id="country" name="country">
									</div>
									<label class="control-label col-xs-3">編劇</label>
									<div class="col-xs-2">
										<input type="text" class="form-control" id="writer"
											name="writer">
									</div>

								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">劇照</label> <input
										name="image1" type="file" class="col-xs-1">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-xs-2" style="margin: 20px 60px">
									<input type="submit" class="btn btn-primary " id="updateBtn"
										value="儲存修改">
								</div>

								<div class="col-xs-2" style="margin: 20px 60px">
									<input type="button" class="btn btn-info " id="resetBtn"
										value="重新選取">
								</div>

								<div class="col-xs-2" style="margin: 20px 60px">
									<input type="button" id="deletebtn" class="btn btn-warning"
										id="deletebtn" value="刪除影片">
								</div>

							</div>

						</form>
					</div>
					<!-- /.alert -->


					<div class="row movietableDiv">
						<div class="xs-col-1">
							<table id="movies" class="hover row-borders stripe">
							</table>
						</div>
					</div>



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
		var _movieTable; // 操作資料庫表格變數

		$(document).ready(function() {
			// 初始隱藏上方編輯畫面
			$('#editDiv').hide();
			
			getMovieTable(getData()); // 使用getData()取出資料庫資料，並交由getMovieTable顯示
			$('#deletebtn').click(deleteMovie); // delete按下，執行delete.do
			$('#image').change(fileviewer); // 上傳圖片顯示在畫面上

			// 當點擊資料庫表格的tr，取得tr內容，並將movie傳給toEdit(movie);
			_movieTable.$('tr').click(function() {
				var movie = _movieTable.fnGetData(this); //取得 tr內的movie內容
				
				$('#editDiv').show(500); //顯示畫面
				$('.movietableDiv').hide(500); //隱藏movie table
				
				toEdit(movie); // 將movie資料傳給function toEdit，將movie資料帶到上面編輯欄
			});
			
			// 重新選舉按鈕按下
			$('#resetBtn').click(function(){
				$('#editDiv').hide(500); //顯示畫面
				$('.movietableDiv').show(500); //隱藏movie table				
				
			})
		})

		//自動載入上傳的圖片
		function fileviewer() {
			var reader = new FileReader;
			reader.onload = function(e) {
				var fileContent = e.target.result;
				var show = $('#imagePreView');
				show.attr("width", 300)
				show.attr("src", fileContent);
			}
			var file = $('#image')[0];
			reader.readAsDataURL(file.files[0]);
		}

		// 按下表格後將資料帶到上面編輯欄
		function toEdit(movie) {

			// getElementById取得編輯欄位   
			var movieId = $('#movieId');
			var name = $('#name');
			var debutDate = $('#debutDate');
			var director = $('#director');
			var company = $('#company')
			var showLength = $('#showLength');
			var actors = $('#actors');
			var eName = $('#eName')
			var imageDiv = $('#imagePreView');

			// get the show data of the movie, replace "/" to "-", for matching the {input:date}
			var showDay = (movie.debutDate).replace("/", "-").replace("/", "-");
			// get movie class and type from movieObject
			var movieRating = movie.movieRating; //與EL相同，取得movie物件下面的movieRating的值
			var movieType = movie.movieType.split(','); //movieType使用array儲存，可console.log(movieType)來看

			// 將取得的資料塞入編輯欄位
			movieId.val(movie.movieId);
			name.val(movie.name);
			director.val(movie.director);
			company.val(movie.company);
			showLength.val(movie.showLength);
			eName.val(movie.eName);
			actors.val(movie.actors)
			setTypeClass();
			getImage();
			debutDate.val(showDay);
			// 將從movie.image(<--這是一個路徑)設定為imageDiv屬性
			function getImage() {
				if (movie.image != null) {
					var i = new Date().getMilliseconds();
					imageDiv.show();
					imageDiv.attr("width", 200)
					imageDiv.attr("src", movie.image);
				} else {
					imageDiv.hide();
				}
			}

			// 從movie物件取得movieRating跟movieType，將對應的選項選起來
			function setTypeClass() {
				// 選擇input裡面name = e=movieRating 的元素
				$('input[name=movieRating]').each(function() {
					// 如果這個元素內的value == movieRating，checked
					if (this.value == movieRating) {
						$(this).prop('checked', true);
					}
				});

				$('input[name=movieType]').each(function() {
					// 清空所有checkbox勾選
					$(this).prop('checked', false);
				})			
				
				$('input[name=movieType]').each(function() {
					// 設定目標為當前的checkbox
					var $target = $(this);  
					$.each(movieType, function() {
						// if 當前checkbox的value == movieTyper矩陣的內容，打勾
						if ($target.val() == this) {
							$target.prop('checked', true);
						}
					})
				});

			}
			
		} // toEdit

		// 使用ajax取得電影資料
		function getData() {
			var result = null;
			$.ajax({
				async : false,
				url : "getmovies.do", // call getmovies.do servlet
				dataType : "json", // pass value by json
				success : function(data) {
					result = data;
				}
			});
			// 上映日期空值則修改在畫面上顯示為未決定
			$.each(result, function(key) {
				if (this.debutDate == null) {
					this.debutDate = "未決定";
				}
			})
			return result;
		}

		// 使用jQuery dataTable PlugIn 來動態插入表格
		function getMovieTable(movies) {
			_movieTable = $('#movies').dataTable({
				"language" : {
					"url" : "${systemRoot}/dataTable_zh.txt"
				}, // language設定顯示語言
				"order" : [ [ 0, "desc" ] ], // 依欄位0(電影ID)反向排序，新增電影會先顯示
				"data" : movies, // 外部傳入movies資料作為欄位內容
				"columns" : [ { // 設定欄位名稱與內容
					"title" : "電影ID",
					"data" : "movieId"
				}, {
					"title" : "電影名稱",
					"data" : "name"
				}, {
					"title" : "片長",
					"data" : "showLength"
				}, {
					"title" : "上映日期",
					"data" : "debutDate"
				} ]
			});
		}

		/* 刪除電影 */
		function deleteMovie() {
			// 畫面上取得ID = movieId與 ID = name欄位值
			var movieId = $('#movieId').val();
			var name = $('#name').val();

			if (movieId == "") {
				alert("select a movie from database first"); //什麼資料都沒選不能刪
			} else {
				$.get("deleteMovie.do", { //使用 ajax傳送movieId進行刪除
					movieId : movieId,
					type : "edit"
				}, function(url) {
					alert("刪除影片: " + name) //回傳刪除資料
					location.href = url; //重新導向回這個頁面
				});
			}
		}
	</script>

</body>

</html>
