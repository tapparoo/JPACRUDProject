<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snake Database</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/styles.css?v=2">
</head>
<body>

	<div class="container">
		<h1>
			<a href="home.do">Spring Boot MVC Snake Database App</a>
		</h1>
		<div class="row">
			<div class="col-4 form-group">
				<h5>Search records by id</h5>
				<form action="getSnakeById.do" method="GET">
					<input class="form-control" type="number" min="1" max="500000" name="id" size="5"
						required value="0"> <input type="submit">
					<c:if test="${not empty result }">
						<br>
						<div class="result">${result}</div>
					</c:if>
				</form>
			</div>
			<div class="col-4 form-group">
				<h5>Select record from list</h5>
				<select class="form-control" onchange="window.location.href=this.value">
					<option></option>
					<c:forEach var="s" items="${allSnakes}">
						<option value="getSnakeById.do?id=${s.id}">${s.id}:
							${s.name} (${s.species.name})</option>
					</c:forEach>
				</select>
			</div>
			<!--  "Add Snake" Dropdown/Form -->
			<div class="dropdown col-4">
				<br>
				<button class="btn dropdown-toggle" type="button" id="greenButton"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add<br>
					Record</button>
				<div class="dropdown-menu">
					<form action="addSnake.do" method="POST" class="px-4 py-3">
						<div class="form-group">
							<label for="title">Name</label> <input type="text"
								class="form-control" name="name">
						</div>
						<div class="form-group">
							<label for="dateOfBirth">Date of Birth</label> <input type="date"
								class="form-control" name="dateOfBirth" value="2019-01-01"
								min="1990-01-01" max="2030-01-01">
						</div>
						<div class="form-group">
							<select name="speciesId">
								<c:forEach var="species" items="${allSpecies}">
									<option value="${species.id}"
										<c:if test="${snake.speciesId == species.id }">selected</c:if>>${species.name}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>


		</div>


		<!-- Snake table -->
		<br> <br>
		<div class="row">
			<div class="col">
				<label class="label-text-align">Filter by:</label>
			</div>
			<select name="tableFilterOption" class="col-auto input-text-align"
				onchange="window.location.href=this.value">
				<option value="FilterTable.do?tableFilterOption=all"
					<c:if test="${filterChoice == 'all' || empty filteredSnakes}">selected</c:if>>View
					All Snakes</option>

				<c:forEach var="species" items="${allSpecies}">
					<option value="FilterTable.do?tableFilterOption=${species.name}"
						<c:if test="${filterChoice == species.name }">selected</c:if>>${species.name}</option>
				</c:forEach>
			</select>
			<div class="col"></div>
		</div>
		<table class="table table-bordered col ">
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
					<c:if
						test="${empty filteredSnakes || filterChoice == 'all' || filterChoice == snake.species.name }">
						<tr>
							<th scope="row"><a
								href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.id}</a></th>
							<td><a
								href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.name}</a></td>
							<td><a
								href="getSnakeById.do?id=<c:out value="${snake.id}"/>">${snake.species.name}</a></td>
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
					</c:if>
				</c:forEach>
			</tbody>

		</table>

	</div>

	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>