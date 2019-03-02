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
		<form action="getSnakeById.do" method="GET">
			<input type="text" name="id">
			<input type="submit">
		</form>
		
		<table class="table">
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
    		      <th scope="row">${snake.id}</th>
	    	      <td>${snake.name}</td>
		          <td>${snake.species.name}</td>
		          <td>
		          
		          <img src="${snake.imageURL}" width="50px" data-toggle="modal" data-target="#<c:out value='snake${snake.id}'/>"/>

					<div id="snake${snake.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					        <div class="modal-body">
					            <img src="${snake.imageURL}">
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