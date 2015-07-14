<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="tw">

<head>
	<!-- head -->
	<jsp:include page="/admin/fragments/head.jsp"/>
</head>
<body>

    <div id="wrapper">
    
	<!-- Navbar -->
	<jsp:include page="/admin/fragments/nav.jsp"/>

	
        
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">統計資訊</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                
                <div class="row">
                    <div class="col-lg-12">
                       <h1>Task</h1>
                        <h3>統計資料 </h3>
                       	本周與上周上映中電影 - 票房走勢圖 <br/>
                       	本周與上周上映中電影 - 入座率走勢圖 <br/>                       
                       	台北周末票房，台北票房(爬蟲程式)
                       	
                       	<h3>排程器</h3>
                       	場次新增時，開演前30min將booked tickets 設為 bookable(寄信通知未領票) <br/>             
						場次結束時，將tickets 設為overtime <br/>             
						電影上映時間為null,設首場上映時間為上映時間 status 上映中 <br/>             
						每天結束時判斷該電影是否還在未來的場次中，沒有則設 status 下映中 <br/>             
                       	
                       	<h3>版面</h3>
                       	場次新增頁面顯示已經有的場次<br/>        
                       	
                       	

                       
                       <h1>Bug</h1>
                       <h3>新增檔期</h3>
                       	改變首場時間無判斷是否可再新增<br/>
                       	切換廳後可再已滿的廳加入新場次<br/>
                       	
                       
                       
                       <h3>售票系統</h3>
                       too many QQ</br>
                       	
                       <h1> 預計功能</h1>                       
                       	場次新增時，設定在晚上1點自動新增票()<br/>
                       <p>現正登入會員監控(線上人數，來源IP等)</p>
                       <p>統計入座率，滿意度，依電影統計</p>
                       <p>顯示本周預計上映電影</p>
                       <p>未處理的聯絡我們</p>
                       <p>未處理的評論回報</p>
                       <p>未處理的評論申訴</p>
                       
                    </div>
                    <!-- /.col-lg-12 -->
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

</html>
