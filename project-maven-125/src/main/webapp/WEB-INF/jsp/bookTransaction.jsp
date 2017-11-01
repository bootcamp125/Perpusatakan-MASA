<%@page import="com.xsis.training125.model.BookTransaction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library MASA Book Transaction</title>
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="container">
		<form action="returnTransaction/save" method="POST">
			<h2>Book Transaction</h2>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="book">Book 1
					:</label>
				<div class="col-sm-3">
					<select class="form-control" name="book.id">
						<c:forEach var="book" items="${books }">
							<option value="${book.id }" label="${book.name }" />
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" name="submit"
						value="save">Submit</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>