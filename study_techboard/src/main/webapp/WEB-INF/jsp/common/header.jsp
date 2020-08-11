<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TECH BOARD</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel='stylesheet' href='/webjars/bootstrap/3.3.6/css/bootstrap.min.css'> 	<!-- Bootstrap css import -->
<script src="/webjars/jquery/2.2.1/jquery.min.js"></script>						<!-- jQuery import -->
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script> 			<!-- BootStrap import -->
<link type="text/css" rel="stylesheet" href="../../css/common/header.css">			<!-- 외부 css 파일 잡기 -->
<link type="text/css" rel="stylesheet" href="../../css/common/common.css">			<!-- 공통 css 파일 잡기 -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
</head>

<body>
<header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <h1><a href="/" class="scrollto"><i class="fas fa-book-reader"> TECH BOARD</i></a></h1>
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="/">Home</a></li>
          <li><a href="/board/boardList">기술게시판</a></li>
          <li>
			<a href="">통합 회사지원 관리시스템</a>
          	<ul>
              <li><a href="/cmp/info/cmpInfoList">회사정보 목록</a></li>
              <li><a href="/cmp/applyInfo/cmpApplyInfoList">회사지원상태 목록</a></li>
              <li><a href="/cmp/offerInfo/cmpOfferInfoList">회사제안 목록</a></li>
            </ul>
          </li>
          <!-- 
          <li><a href="">Register</a></li>
          
          <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
           <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="">Contact</a></li>
           -->
        </ul>
      </nav><!-- #nav-menu-container -->

    </div>
  </header><!-- #header -->
</body>