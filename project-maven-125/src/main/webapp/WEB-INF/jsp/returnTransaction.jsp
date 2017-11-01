<%@page import="com.xsis.training125.model.ReturnTransaction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library MASA Return Transaction</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="http://code.gijgo.com/1.6.1/js/gijgo.js"
	type="text/javascript"></script>
<link href="http://code.gijgo.com/1.6.1/css/gijgo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="container">
		<form action="returnTransaction/save" method="POST">
			<h2>Return Transaction</h2>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="employee">Employee
					:</label>
				<div class="col-sm-3">
					<select class="form-control" name="employee.id">
						<c:forEach var="employee" items="${employees }">
							<option value="${employee.id }" label="${employee.name }" />
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="returnDate">Return
					Date :</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="returnDate" placeholder=" "
						name="returnDate">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" name="submit"
						value="save">Submit</button>
				</div>
			</div>
		</form>

		<script>
        $('#returnDate').datepicker({
            uiLibrary: 'bootstrap4',
            iconsLibrary: 'fontawesome'
        });
    </script>
	</div>
</body>
</html>