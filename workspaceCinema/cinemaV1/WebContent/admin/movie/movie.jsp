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
						<li role="presentation" class="active lead"><a
							href="movie.jsp">新增電影資料</a></li>
						<li role="presentation" class="lead"><a href="edit.jsp">修改/刪除電影資料</a></li>
					</ul>

					<div class="alert alert-info row">
						<form action="addMovie.do" method="POST"
							enctype="multipart/form-data">
							<div class="form-horizontal">
								<div class="row form-group">
									<label class="control-label col-xs-1">電影名稱</label>
									<div class="col-xs-2">
										<input class="form-control" id="name" name="name" 
											required>
									</div>
									<label class="control-label col-xs-1">英文名稱</label>
									<div class="col-xs-2">
										<input class="form-control" id="eName" name="eName"
											 required>
									</div>
									<label class="control-label col-xs-1">影片分級</label>
									<div class="col-xs-4">
									<label class="radio-inline"> <input type="radio"
											name="movieRating" value="普遍級" > 普遍級
										</label> 
										<label class="radio-inline"> <input type="radio"
											name="movieRating" value="保護級" required> 保護級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="輔導級"> 輔導級
										</label> <label class="radio-inline"> <input type="radio"
											name="movieRating" value="限制級" > 限制級
										</label>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">導演</label>
									<div class="col-xs-2">
										<input id="director" name="director" 
											class="form-control" required>
									</div>
									<label class="control-label col-xs-1">演員</label>
									<div class="col-xs-2">
										<input id="actors" name="actors" class="form-control"
											required>
									</div>
									<label class="control-label col-xs-1">發行公司</label>
									<div class="col-xs-2">
										<input id="company" name="company" 
											class="form-control" required>
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">上映日期</label>
									<div class="col-xs-2">
										<input type="date" class="form-control" id="debutDate"
											name="debutDate" >
									</div>
									<label class="control-label col-xs-1">片長</label>
									<div class="col-xs-1">
										<input id="showLength" name="showLength" class="form-control">
									</div><label class="control-label">分鐘</label>								
								</div>

								<div class="row form-group">

									<label class="control-label col-xs-1">影片分類</label>
									<div class="col-xs-8">
										<label class=".checkbox-inline "> <input type="checkbox" multiple 
											name="movieType" value="動作" > 動作
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="喜劇" > 喜劇
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="愛情"> 愛情
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="劇情"> 劇情
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="恐怖"> 恐怖 
										</label>  <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="懸疑"> 懸疑
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="驚悚"> 驚悚 
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="記錄"> 記錄
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="科幻"> 科幻
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="歌舞"> 歌舞
										</label> <label class=".checkbox-inline "> <input type="checkbox"
											name="movieType" value="動畫"> 動畫
										</label> <label class=".checkbox-inline "> <input
											type="checkbox" name="movieType" value="冒險"> 冒險
										</label>
																				
									</div>
								</div>

								<div class="row form-group">
									<label class="control-label col-xs-1">海報</label>
									<div class="col-xs-2">
										<input name="image" type="file" id="image">
									</div>
									<div class="col-xs-10"></div>
									<div class="row">
										<img id="imagePreView">
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
									<input type="submit" class="btn btn-primary " id="insertBtn"
										value="新增電影">
								</div>
								<div class="col-xs-2" style="margin: 20px 60px">
									<input type="reset" class="btn btn-primary" id="clearBtn"
										value="清除資料">
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
	<script type="text/javascript">
		$(document).ready(
				function() {
					/* 自動產生假資料
						var ver = Math.round(Math.random() * 100);
						if (Math.round(Math.random() * 5) == 5) {
							$('#name').val("功夫" + ver);
						} else if (Math.round(Math.random() * 5) == 4) {
							$('#name').val("地震熊貓人" + ver);
						} else if (Math.round(Math.random() * 5) == 3) {
							$('#name').val("蜘蛛鐵達尼" + ver);
						} else if (Math.round(Math.random() * 5) == 2) {
							$('#name').val("飛天鋼鐵人" + ver);
						} else if (Math.round(Math.random() * 5) == 1) {
							$('#name').val("超人VS浩克" + ver);
						} else {
							$('#name').val("侏儸紀超人" + ver);
						}
						var showLength = $('#showLength').val(
								Math.round(Math.random() * 90 + 90))
						var showDay = Math.round(Math.random() * 20 + 10);
						$('#debutDate').val("2015-07-" + showDay);
					*/			
		}) // $(document).ready(

		$('#image').change(fileviewer);
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
	</script>
</body>

</html>
