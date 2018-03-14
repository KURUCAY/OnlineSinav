<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href='<s:url value="/anasayfa"></s:url>'>Anasayfa</a>
		</div>


		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href='<s:url value="/sinavolustur"></s:url>'>Sınav Oluştur</a></li>
				<li><a href='<s:url value="/sinavsayfasi"></s:url>'>Sınava Gir</a></li>
			</ul>
			<form action='<s:url value="/ara"></s:url>'class="navbar-form navbar-right" role="search" method="post">
				<div class="form-group input-group">
					<input type="text" class="form-control" placeholder="Adınız" name="ad">
					<span class="input-group-btn">
						<input class="btn btn-default" type="submit" />
							<span class="glyphicon glyphicon-search"></span>
						
					</span>
				</div>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a><span></span> sorgula</li>
			</ul>
		</div>
	</div>
</nav>