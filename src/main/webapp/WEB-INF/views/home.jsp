<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SORU SAYFASI - SORU EKLE - HIZLI SORU OLUŞTUR</title>
</head>
<body>

	<!-- 
	<style type="text/css" media="screen">
.row>.col, .row>[class^=col-] {
	padding-top: .75rem;
	padding-bottom: .75rem;
	background-color: rgba(86, 61, 124, .15);
	border: 1px solid rgba(86, 61, 124, .2);
}
</style>
 -->


	<div class="container-fluid row ">
	
	<div class="col-sm-12"></div>
	
	</div>


	<div class=" row container-fluid">

		<div class="col-sm-5">

			<c:if test="${not empty hata }">
				<div class="alert alert-danger" role="alert">${hata}</div>

			</c:if>
			<form action='<s:url value="/ekle"></s:url>' class="form-control"
				method=post>


				<div class="input-group">
					<label for="sorunuz">soru içeriği</label>
					<textarea class="form-control form-group"
						aria-label="With textarea" name="soru" id="sorunuz"></textarea>
				</div>

				<div class=" row container-fluid">


					<div class="col-sm-9"></div>
					<div class="col-sm-3">
						<input type="submit"
							class="btn btn-success form-control form-group" value="kaydet" />
					</div>
				</div>
			</form>


		</div>
		<div class="col-sm-7">



			<form action='<s:url value="/soruislem"></s:url>' method="post"
				class="form-control">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">no</th>

							<th scope="col">sorular</th>
							<th scope="col">işlem</th>

						</tr>

					</thead>
					<c:if test="${not empty sList }">
						<tbody>

							<c:forEach var="item" items="${sList }">
								<tr>
									<td>${ item.getSoru_id()}</td>
									<td>${ item.getSoru()}</td>
									<td><a
										href='<s:url value="/cevap_ekle/${item.getSoru_id()}"></s:url>'>


											<button type="button" class="btn btn-outline-info">cevap
												ekle</button>
									</a> <a href='<s:url value="/sil/${item.getSoru_id()}"></s:url>'>


											<button type="button" class="btn btn-danger">sil</button>
									</a></td>
								</tr>
							</c:forEach>

						</tbody>

					</c:if>


				</table>


			</form>
		</div>


	</div>







</body>
</html>
