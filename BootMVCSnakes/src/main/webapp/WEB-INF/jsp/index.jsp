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
<title>Snake Database</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>

	<h1>Spring Boot MVC Snake Database App</h1>
	<div class="container-fluid">
		<div class="row">
			<div class="col-4">
				<h5>Search records by id</h5>
				<form action="getSnakeById.do" method="GET">
					<input type="text" name="id" size="5"> <input type="submit">
				</form>
			</div>
			<div class="col-4">
				<h5>Select record from list</h5>
				<select onchange="window.location.href=this.value">
					<c:forEach var="s" items="${allSnakes}">
						<option value="getSnakeById.do?id=${s.id}">${s.id}:
							${s.name}(${s.species.name})</option>
					</c:forEach>
				</select>
			</div>
			<!--  "Add Snake" Dropdown/Form -->
			<div class="dropdown col-4">
				<br>
				<button class="btn dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Add Record</button>
				<div class="dropdown-menu">
					<form action="addSnake.do" method="POST" class="px-4 py-3">
						<div class="form-group">
							<label for="title">Name</label> <input type="text"
								class="form-control" name="name">
						</div>
						<div class="form-group">
							<label for="dateOfBirth">Date of Birth</label> <input type="text"
								class="form-control" name="dateOfBirth" value="2019-01-01">
						</div>
						<div class="form-group">
							<label class="hasToolTip" for="speciesId" data-toggle="tooltip"
								data-html="true"
								title="<div style='text-align:left'>1 - English<br>2 - Italian<br>3 - Japanese<br>4 - Mandarin<br>5 - French<br>6 - German</div>">Language
								ID: </label> <input type="text" class="form-control col-4"
								name="speciesId" value="1">
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
			

		</div>


		<!-- Snake table -->
		<table class="table table-bordered col-10 offset-1">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Species</th>
					<th scope="col">Image</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="snake" items="${allSnakes}">
					<tr>
						<th scope="row"><a href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.id}</a></th>
						<td><a href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.name}</a></td>
						<td><a href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.species.name}</a></td>
						<td>
							<!--  Snake (or default species) image thumbnail --> <c:if
								test="${not empty snake.imageURL}">
								<img src="${snake.imageURL}" width="50px" data-toggle="modal"
									data-target="#<c:out value='snake${snake.id}'/>" />
							</c:if> <c:if test="${empty snake.imageURL }">
								<img src="${snake.species.defaultImageURL}" width="50px"
									data-toggle="modal"
									data-target="#<c:out value='snake${snake.id}'/>" />
							</c:if> <!--  Snake (or default species) popup image on click -->
							<div id="snake${snake.id}" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<c:if test="${not empty snake.imageURL}">
												<img src="${snake.imageURL}" class="img-fluid">
											</c:if>
											<c:if test="${empty snake.imageURL }">
												<img src="${snake.species.defaultImageURL}"
													class="img-fluid">
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>

	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>