<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs"
	prefix=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sprint Boot MVC Snake Database App</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
</head>

<body>

	<div class="container">
		<c:if test="${not empty snake }">
			<div class="row">
				<h1 class="col-12">${species.name }</h1>
			</div>
			<div class="row">

				<div class="col-6">
					<form action="modifySnake.do" method="POST">
						<div class="row">
							<div class="col-6">
								<label for="name" class="label-text-align">Pet Name:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="name"
									value="${snake.name}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="species" class="label-text-align">Scientific
									Name:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="species"
									value="${species.species}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="dateOfBirth" class="label-text-align">Hatch
									Date:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="dateOfBirth"
									value="${snake.dateOfBirth}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="morph" class="label-text-align">Morph:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="morph"
									value="${snake.morph}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="weightInGrams" class="label-text-align">Weight(g):</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="weightInGrams"
									value="${snake.weightInGrams}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="lengthInCM" class="label-text-align">Length(cm):</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="lengthInCM"
									value="${snake.lengthInCM}" />
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="purchasedFrom" class="label-text-align">Purchased
									from:</label>
							</div>
							<div class="col-6">
								<input type="text" class="input-text-align" name="purchasedFrom"
									value="${snake.purchasedFrom}" />
							</div>
						</div>
						<br><br>
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
				<div class="col-6">
					<c:choose>
						<c:when test="${empty snake.imageURL }">
							<p>
								<img src="${species.defaultImageURL}" class="img-fluid">
							</p>
						</c:when>
						<c:otherwise>
							<p>
								<img src="${snake.imageURL}" class="img-fluid">
							</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:if>
	</div>

	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>