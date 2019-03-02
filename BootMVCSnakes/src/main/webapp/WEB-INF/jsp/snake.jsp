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
</head>

<body>

	<div class="container">
		<c:if test="${not empty snake }">
			<h1>${species.name }</h1>
			<ul>
				<li>Scientific Name: ${species.species}</li>
				<li>Pet Name: ${snake.name }</li>
				<li>Birthday: ${snake.dateOfBirth }</li>
				<li>Morph: ${snake.morph }</li>
				<li>Weight: ${snake.weightInGrams} (grams)</li>
				<li>Length: ${snake.lengthInCM} (cm)</li>
				<li>Purchased from: ${snake.purchasedFrom}</li>
				<li>Image: 
					<c:choose>
						<c:when test="${empty snake.imageURL }">
							<p>
								<img src="${species.defaultImageURL}">
							</p>
						</c:when>
						<c:otherwise>
							<p>
								<img src="${snake.imageURL}">
							</p>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</c:if>
	</div>

	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>