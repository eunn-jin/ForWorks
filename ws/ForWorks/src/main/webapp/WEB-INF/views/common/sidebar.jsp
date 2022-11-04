<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root}/resources/css/common/bootstrap.css">

<link rel="stylesheet" href="${root}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
<!-- <link rel="stylesheet" href="resources/vendors/bootstrap-icons/bootstrap-icons.css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${root}/resources/css/common.css">
	
<div id="sidebar" class="active">
    <div class="sidebar-wrapper active">
        <div class="sidebar-header">
            <div class="d-flex justify-content-between">
                <div class="logo">
                    <a href="${root}"><span>FOR WORKS</span></a>
                </div>
                <div class="toggler">
                    <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                </div>
            </div>
            <div class="d-flex justify-content-between">
                <div class="profile">
                    <a href="#">
	                    <img src="${root}/resources/img/imgTest.jpg">                
	                	<span class="user-name"> Hong gil dong</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="menu">

                <li class="sidebar-title">Menu</li>

                <li class="sidebar-item has-sub">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-cloud-lightning-rain"></i>
                        <span>근태관리</span>
                    </a>
                    <ul class="submenu" id="att-part">
                        <li class="submenu-item " id="att-day">
                            <a href="${root}/att/day">일일근태 등록</a>
                        </li>
                        <li class="submenu-item " id="att-month">
                            <a href="${root}/att/month">월 근태 현황</a>
                        </li>
                        <li class="submenu-item " id="att-off">
                            <a href="${root}/off/manage">휴가관리</a>
                        </li>
                    </ul>
                </li>
                
                <li class="sidebar-item has-sub">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-cloud-lightning-rain"></i>
                        <span>급여관리</span>
                    </a>
                    <ul class="submenu" id="salary-part">
                        <li class="submenu-item" id="salary-pay">
                            <a href="${root}/salary/payslip">급여명세서</a>
                        </li>
                        <li class="submenu-item " id="salary-main">
                            <a href="${root}/salary/main">급여관리자</a>
                        </li>
                      
                    </ul>
                </li>

				<li class="sidebar-item has-sub">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-cloud-lightning-rain"></i>
                        <span>문서관리</span>
                    </a>
                    <ul class="submenu" id="doc-part">
                        <li class="submenu-item" id="doc-list">
                            <a href="${root}/docmanage/list">일반문서</a>
                        </li>
                        <li class="submenu-item "id="doc-write">
                            <a href="component-badge.html">결재문서</a>
                        </li>
                        <li class="submenu-item"  id="doc-manage">
                            <a href="${root}/docmanage/manage/1">문서관리</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>