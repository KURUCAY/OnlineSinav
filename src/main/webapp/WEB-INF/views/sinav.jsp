<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SINAV-SINAV YAP-HIZLI SINAV YAP</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container-fluid row">

		<div class="col-sm-3"></div>
		<div class="col-sm-6">


			<c:if test="${ empty sonuclarLs }">

				<c:if test="${not empty giris}">
					<form action='<s:url value="/sinav/giris"></s:url>' method="post">

						<div class="container-fluid row">
							<div class="col-sm-6">

								<input type="text" name="ad" placeholder="adiniz"
									class="form-control form-group" /> <input type="submit"
									value="gönder" class="btn btn-success" />
							</div>
						</div>
					</form>
				</c:if>

				<c:if test="${ empty liste }">
					
						<div class="container-fluid row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">

								<a href='<s:url value="/basla"></s:url>'>
									<center>
										<button class="btn btn-light btn-lg">Sınava Başla</button>
									</center>
								</a>
							</div>
							<div class="col-sm-3"></div>
						</div>
					
				</c:if>

				<c:if test="${not empty liste }">

					<h1>${liste.getSoru() }</h1>

				</c:if>

				<c:if test="${not empty cevaplist}">

					<form action='<s:url value="/ileri"  ></s:url>' method="post">

						<c:forEach var="item" items="${cevaplist}">
							<div class="container-fluid row container-group">

								<div class="custom-control custom-radio">
									<input type="radio" name="rdbkontrol"
										value="${item.getCevap_id()  }" /> <label>${item.getCevap()}</label>
								</div>
							</div>
						</c:forEach>
						<input type="submit" value="ileri" class="btn btn-success" />
					</form>
				</c:if>
			</c:if>

			<c:if test="${ not empty sonuclarLs  }">

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

		</div>

		<div class="col-sm-3"></div>
</body>
</html>