<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sprint Boot MVC Snake Database App</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css?v=2">
</head>

<body>

	<div class="container">
		<h1 class="col-12">${snake.species.name }</h1>
		<c:if test="${not empty snake }">
			<div class="row">

				<div class="col-sm-6 col-md-6 col-lg-6 form-group">
					<form id="snakeForm" action="modifySnake.do" method="POST">
						<div class="row">
							<div class="col-2">
								<button class="btn btn-sm btn-secondary greenButton"
									formaction="home.do" formmethod="GET">Home</button>
							</div>
							<div class="col-4">
								<label class="label-text-align">ID:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align form-control " name="id"
									value="${snake.id}" readonly="readonly" size="4" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="name" class="label-text-align">Pet Name:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align form-control" name="name"
									value="${snake.name}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="species" class="label-text-align">Common
									Name:</label>
							</div>
							<div class="col-5">
								<select name="speciesId">
									<c:forEach var="species" items="${allSpecies}">
										<option value="${species.id}"
											<c:if test="${snake.speciesId == species.id }">selected</c:if>>${species.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label class="label-text-align">Scientific Name:</label>
							</div>
							<div class="col-6">
								<label class="input-text-align">${snake.species.species}</label>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="dateOfBirth" class="label-text-align">Hatch
									Date:</label>
							</div>
							<div class="col-6">
								<input type="date" class="input-text-align form-control date" name="dateOfBirth"
									value="${snake.dateOfBirth}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="morph" class="label-text-align">Morph:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align form-control" name="morph"
									value="${snake.morph}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="weightInGrams" class="label-text-align">Weight(g):</label>
							</div>
							<div class="col-6">
								<input type="number" min="0.0" class="input-text-align form-control"
									name="weightInGrams" step="0.01" value="${snake.weightInGrams}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="lengthInCM" class="label-text-align">Length(cm):</label>
							</div>
							<div class="col-6">
								<input type="number" min="0.0" step="0.01"
									class="input-text-align form-control" name="lengthInCM"
									value="${snake.lengthInCM}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="purchasedFrom" class="label-text-align"> <c:if
										test="${not empty snake.purchasedFrom}">
										<a href="${snake.purchasedFrom}" target="_blank">
									</c:if> Purchased from: <c:if test="${not empty snake.purchasedFrom}">
										</a>
									</c:if>
								</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align form-control" name="purchasedFrom"
									value="${snake.purchasedFrom}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="imageURL" class="label-text-align">Image
									URL:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align form-control" name="imageURL"
									placeholder="Default ${snake.species.name} image is being used" value="${snake.imageURL}"/>
							</div>
						</div>
						<br>
						<c:if test="${not empty result }">
							<div class="row result">
								<div class="col-12">${result }</div>
							</div>
						</c:if>
						<div class="row">
							<div class="col-12">
								<button type="submit" class="btn btn-primary btn-sm">Save
									Changes</button>
								<button type="submit" class="btn btn-danger btn-sm"
									formmethod="POST" formaction="deleteSnake.do">Delete
									Record</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-auto col-md-auto col-lg-6">
					<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${empty snake.imageURL }">
									<p>
										<img src="${snake.species.defaultImageURL}"
											class="img-fluid rounded">
									</p>
								</c:when>
								<c:otherwise>
									<p>
										<img src="${snake.imageURL}" class="img-fluid rounded">
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
		</c:if>
	</div>

	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>