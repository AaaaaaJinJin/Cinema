<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	



<style>
	.navbar-btn {
		padding:0px 5px;
		margin:0px ;
		border:none;
	}
	
	.loginarea {
		margin: 0px 0px 0px 100px;
	}
</style>

    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${systemRoot}/index.jsp"><img src="${systemRoot}/img/logo.png" alt="LOGO"></a>
            </div>
            
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="${systemRoot}/index.jsp">首頁</a></li>
                    <li><a href="${systemRoot}/cinema/about-us.jsp">關於我們</a></li>
                    <li><a href="${systemRoot}/cinema/about-us.jsp">線上訂票</a></li>
                    <li><a href="${systemRoot}/default.jsp">場次查詢</a></li>                  
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">電影介紹 <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="${systemRoot}/movie/portfolio.jsp">熱映電影</a></li>
                            <li><a href="${systemRoot}/movie/">電影預告</a></li>
                            <li><a href="#">Dropdown Menu 3</a></li>
                            <li><a href="#">Dropdown Menu 4</a></li>
                            <li><a href="#">Dropdown Menu 5</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </li>
                    <li><a href="${systemRoot}/admin/index.jsp">管理模式</a></li> 
				  <c:choose>

					<c:when test="${empty LoginMember}">
					<ul class="nav navbar-nav loginarea">					
                    <li class="btn navbar-btn btn-link"><a href="${systemRoot}/login/login.jsp"> 登入</a> </li>
                    <li class="btn navbar-btn btn-link "><a href="${systemRoot}/login/register.jsp"> 註冊</a> </li>                    
                    </ul>

                    </c:when>
                    <c:otherwise>
					<ul class="nav navbar-nav loginarea">	                    
                    <li class="btn navbar-btn btn-link"><a href="${systemRoot}/member/memberEdit.jsp">${LoginMember.memberName}</a> </li>
                    <li class="btn navbar-btn btn-link "><a href="${systemRoot}/logout.do">登出</a> </li>    
                    </ul>
                                                        	
                    </c:otherwise>
                    
                    
                  </c:choose> 
                </ul>
            </div>
        </div>
    </header>
