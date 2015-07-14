<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="tw">

<head>
<!-- head -->
<jsp:include page="/admin/fragments/head.jsp" />
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
						<li role="presentation" class=" lead">確認新增電影資料</li>
					</ul>

					<div class="alert alert-danger row">
						<form action="updateMovie.do" method="post"  enctype="multipart/form-data">
							<div class="form-horizontal">

								<div class="row form-group">
									<label class="control-label col-xs-1">電影ID</label>
									<div class="col-xs-2">
										<input class="form-control" id="movieId" name="movieId"
											value="${movieVO.movieId}" readonly>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">電影名稱</label>
									<div class="col-xs-2">
										<input class="form-control" id="movieName" name="movieName"
											value="${movieVO.movieName}" required>
									</div>
									<label class="control-label col-xs-3">預計上映日期</label>
									<div class="col-xs-2">
										<input type="date" class="form-control" id="showDate"
											name="showDate" value="${movieVO.showDate}" required>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">導演</label>
									<div class="col-xs-2">
										<input id="director" name="director"
											value="${movieVO.director}" class="form-control" required>
									</div>
									<label class="control-label col-xs-3">發行片商</label>
									<div class="col-xs-2">
										<input id="company" name="company" value="${movieVO.company}"
											class="form-control" required>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">影片長度(分)</label>
									<div class="col-xs-2">
										<input id="showLength" name="showLength"
											value="${movieVO.showLength}" class="form-control">
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">影片分級</label>
									<div class="col-xs-4">
										<label class="radio-inline"> <input type="radio"
											id="class1" name="movieRating" value="保護級" required>
											保護級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="輔導級" id="class2"> 輔導級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="普遍級" id="class3"> 普遍級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="限制級" id="class4"> 限制級
										</label>
									</div>

									<label class="control-label col-xs-1">影片分類</label>
									<div class="col-xs-6">
										<label class="radio-inline"> <input type="radio"
											name="movieType" value="動作" required> 動作
										</label> <label class="radio-inline"> <input type="radio"
											name="movieType" value="喜劇"> 喜劇
										</label> <label class="radio-inline"> <input type="radio"
											name="movieType" value="愛情"> 愛情
										</label> <label class="radio-inline"> <input type="radio"
											name="movieType" value="劇情"> 劇情
										</label> <label class="radio-inline"> <input type="radio"
											name="movieType" value="恐怖"> 恐怖
										</label>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">海報</label>
									<div class="col-xs-3">									
										<img id="movieImagePreView" src="${movieVO.movieImage}" width="300">
									</div>
									<div class="col-xs-4">				
										<input type="file" value="修改圖片" id="movieImage" name="movieImage">
									</div>
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
										value="確定新增影片">
								</div>

								<div class="col-xs-2" style="margin: 20px 60px">
									<input type="button" id="deletebtn" class="btn btn-primary"
										id="deletebtn" value="取消新增影片">
								</div>

							</div>

						</form>
					</div>
					<!-- /.alert -->





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
	<script>
		$(document).ready(function(){
			init();
			$('#movieImage').change(fileviewer);
			$('#deletebtn').click(deleteMovie);
		})
		
		//自動載入上傳的圖片
		function fileviewer() {
			var reader = new FileReader;
			reader.onload = function(e){
				var fileContent = e.target.result;
				var show = $('#movieImagePreView');
				show.attr("width",300)
				show.attr("src",fileContent);
			}
			var file = $('#movieImage')[0];
			reader.readAsDataURL(file.files[0]);
		}		

		function deleteMovie() {
				$.get("deleteMovie.do", {
					movieId : "${movieVO.movieId}"
				}, function(url) {
					alert("取消新增影片資料")
					location.href = url;
				});
		}

		function init() {

			var movieRating = "${movieVO.movieRating}";
			$('input[name=movieRating]').each(function() {
				if (this.value == movieRating) {
					$(this).prop('checked', true);
				}
			});

			var movieType = "${movieVO.movieType}";
			$('input[name=movieType]').each(function() {
				if (this.value == movieType) {
					$(this).prop('checked', true);
				}
			});

		}
		
	</script>
</body>

</html>
