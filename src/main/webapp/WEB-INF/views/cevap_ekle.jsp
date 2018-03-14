<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CEVAP SAYFASI - CEVAP EKLE</title>
</head>
<body>

	<div class="container-fluid row">

		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<form action='<s:url value="/cevap/${soruid}"></s:url>' method="post">
				<div class="form-group">

					<input type="text" name="cevapt" class="form-control"
						placeholder="cevap" />
				</div>
				<div class=" container row form-group form-inline float-right">
					<div class="col-sm-7">
						<select name="cevaps" class=" form-group form-control float-right "
							style="width: 300px">
							<option value="yanlıs">yanlış</option>
							<option value="dogru">doğru</option>
						</select>
					</div>
					<div class="col-sm-5">
						<input type="submit" value="ekle"
							class="btn btn-outline-primary " style="width: 100px" />
					</div>
				</div>


				<table class="table table-hover">
					<thead>
						<tr>


							
							<th scope="col">cevaplar</th>
								<th scope="col">durum</th>
							<th scope="col" >işlem</th>
						</tr>

					</thead>
					<c:if test="${not empty cvpList}">

						<c:forEach var="item" items="${cvpList}">
							<tbody>

								<tr>
									
									<td>${item.getCevap()}</td>
									<td>${item.getDurum()}</td>
									<td ><a href='<s:url value="/cevapsil/${item.getCevap_id() }"></s:url>'>
											<button type="button" class="btn btn-danger" >sil</button>
									</a></td>
								</tr>
						</c:forEach>
						</tbody>
					</c:if>
				</table>
			</form>
		</div>
		<div class="col-sm-3"></div>
	</div>





</body>
</html>