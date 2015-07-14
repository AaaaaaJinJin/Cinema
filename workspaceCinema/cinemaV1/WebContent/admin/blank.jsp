<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="tw">

<head>
	<jsp:include page="/admin/fragments/head.jsp"/>
</head>
<body>

    <div id="wrapper">
	<!-- Navbar -->
	<jsp:include page="/admin/fragments/nav.jsp"/>
	<!-- Navbar -->
	
        
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Blank</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
           
           
           <div class="navbar-header  col-xs-6 text text-left">
           		<img src="${adminSystemRoot}/movie/getmovies.do">
                <input type="button" class="navbar-brand " value=${adminSystemRoot}/movie/getmovies.do id="daySale"/>
                <span class="navbar-brand "  id="weekSale">本周票房</span>
            </div>          
                
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<!-- footer -->
	<jsp:include page="/admin/fragments/footer.jsp" />
	
</body>
<script>
$(function(){
	console.log($('img'))
	
})

</script>
</html>
