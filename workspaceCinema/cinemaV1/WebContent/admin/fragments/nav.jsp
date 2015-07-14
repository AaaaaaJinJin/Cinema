<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<style>
 #_nav_daySale,#_nav_weekSale{
 	font-weight:bold;
 }
</style>
<script>
var _clock_per_second = null;
var _nav_statist_data = {};
$(function() {
	nav_getData();
	nav_showOn();	
	$('#_nav_daySale').hide();
	$('#_nav_weekSale').hide();

	_clock_per_second = setInterval(function() {
		nav_getData();
		nav_showOn();
	}, 5000);

	//  		weekSale = FormatNumber(weekSale);
	// 		 $('#weekSale').html('本周累計票房：$' + weekSale);
})

function nav_showOn() {
	var dayDiv = $('#_nav_daySale');
	var weekDiv = $('#_nav_weekSale');
	var weekTotal = 0;
	var todayTotal = 0;

	if (_nav_statist_data != null) {
		weekTotal = sumWeek();
	}

	if (_nav_statist_data.today != null) {
		todayTotal = nav_FormatNumber(_nav_statist_data.today);
		dayDiv.show().html('今日累計票房: $' + todayTotal);

		weekTotal = nav_FormatNumber(weekTotal);
		weekDiv.show().html('本周累計票房: $' + weekTotal);
	}
	function sumWeek() {
		var total = 0;
		$.each(_nav_statist_data, function(key, value) {
			total += value;
		})
		
		total -= _nav_statist_data.today;
		return total;
	}
}

/* 以下參考check.jsp註解 */
function nav_getData() {
	var date = nav_getDate();
	var result = null;
	$.ajax({
		async : true,
		url : "${adminSystemRoot}/getTotalByDate.do",
		data : {
			thursday : date.thursday,
			sunday : date.sunday,
			monday : date.monday,
			tuesday : date.tuesday,
			wednesday : date.wednesday,
			friday : date.friday,
			saturday : date.saturday,
			today : date.today,
		},
		dataType : "json",
		success : function(data) {
			_nav_statist_data = data;
			result = data;
		}
	});
	return result;
} // getData()

// 尋找星期四，作為第一筆資料
function nav_getDate() {
	var date = {}; // 使用date物件裝時間參數
	var start = new Date(); // 取得現在時間

	date.today = start.toLocaleDateString();
	// find thursday，今天不是星期四，往前尋找
	while (start.getDay() != 4) {
		start.setDate(start.getDate() - 1);
	}

	// 將星期四的日期字串，放入date.thursday
	date.thursday = start.toLocaleDateString();

	start.setDate(start.getDate() + 1);
	date.friday = start.toLocaleDateString();
	start.setDate(start.getDate() + 1);
	date.saturday = start.toLocaleDateString();
	start.setDate(start.getDate() + 1);
	date.sunday = start.toLocaleDateString();
	start.setDate(start.getDate() + 1);
	date.monday = start.toLocaleDateString();
	start.setDate(start.getDate() + 1);
	date.tuesday = start.toLocaleDateString();
	//  將星期三的日期字串，放入date.thursday
	start.setDate(start.getDate() + 1);
	date.wednesday = start.toLocaleDateString();

	return date;
}

function nav_FormatNumber(n) {
	n += "";
	var arr = n.split(".");
	var re = /(\d{1,3})(?=(\d{3})+$)/g;
	return arr[0].replace(re, "$1,")
			+ (arr.length == 2 ? "." + arr[1] : "");
}


</script>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header col-xs-2">
<!--                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> -->
<!--                     <span class="sr-only">Toggle navigation</span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                 </button> -->
                <a class="navbar-brand" href="${adminSystemRoot}/index.jsp">${adminSystemName}</a>
            </div>
            <!-- /.navbar-header -->

	<div class="navbar-header text text-left row ">
		<span class="navbar-brand bg-info" id="_nav_daySale">今日票房</span> <span
			class="navbar-brand bg-info" id="_nav_weekSale">本周票房</span>
	</div>

	<ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i><i class="fa fa-caret-down"></i>
                    </a>
                    
                    <ul class="dropdown-menu dropdown-messages">
                    
                    
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                      
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 使用者資訊</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 設定</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<!-- 搜尋欄位 -->
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        
                        <li>
                            <a href="${adminSystemRoot}/index.jsp"><i class="fa fa-dashboard fa-fw"></i> 首頁</a>
                        </li>
            
                       <li>
                            <a href="${adminSystemRoot}/statist/statist.jsp"><i class="fa fa-dashboard fa-fw"></i> 統計資訊</a>
                        </li> 
                        
                        <li>
                            <a href="${adminSystemRoot}/movie/movie.jsp"><i class="fa fa-table fa-fw"></i> 電影管理</a>
                        </li>
                        
                        <li>
                            <a href="${adminSystemRoot}/show/createshow.jsp"><i class="fa fa-table fa-fw"></i> 檔期管理</a>
                        </li>
 
                        <li>
                            <a href="${adminSystemRoot}/show/sellsystem.jsp"><i class="fa fa-dashboard fa-fw"></i> 售票系統</a>
                        </li> 
                        
                        <li>
                            <a href="${adminSystemRoot}/website.jsp"><i class="fa fa-edit fa-fw"></i> 網站管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
 
                        
                        <li>
                            <a href="${adminSystemRoot}/comment.jsp"><i class="fa fa-edit fa-fw"></i> 評論管理</a>
                        </li>
 
                        <li>
                            <a href="${adminSystemRoot}/contactus/contactus.jsp"><i class="fa fa-edit fa-fw"></i> 客訴管理</a>
                        </li>                       
                                                                        
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>