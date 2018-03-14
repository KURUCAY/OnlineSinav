<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>








<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SINAV - HIZLI SINAV- SINAV SAYFASI</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	
	<c:if test="${not empty sonuclarLs}">
<label> ${ad} cevaplarını inceleyebilirsin</label>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">soru</th>

					<th scope="col">cevap</th>
					<th scope="col">durum</th>

				</tr>

			</thead>

			<tbody>

				<c:forEach var="item" items="${sonuclarLs}">

					<tr>
						<td>${item.getSoru()}</td>
						<td>${item.getCevap()}</td>
						<td>${item.getDurum()}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</c:if>

<!--
	<c:if test="${ not empty sonuclarLs  }">
<h1> icine girildi</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">soru</th>

					<th scope="col">cevap</th>
					<th scope="col">durum</th>

				</tr>

			</thead>

			<tbody>

				<c:forEach var="item" items="${sonuclarLs}">

					<tr>
						<td>${item.getSoru()}</td>
						<td>${item.getCevap()}</td>
						<td>${item.getDurum()}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</c:if>
-->
</body>
</html>