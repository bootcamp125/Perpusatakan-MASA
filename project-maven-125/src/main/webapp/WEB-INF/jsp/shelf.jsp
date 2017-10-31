<%@page import="com.xsis.training125.model.Shelf"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Library MASA Shelf Entry</title>
<link rel="stylesheet"
	href="/assets/bootstrap-4.0.0-beta.2/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container" id="container">
		<%
			/* List<Shelf> shelfs = //(List)request.getAttribute("shelfs");		
			for(Shelf shelf: shelfs){
				out.println("name : "+ shelf.getName());
			} */
		%>
		<table class="table table-sm table-striped table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Category</th>
					<th>Section</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="shelf" items="${shelfs }">
					<tr>
						<td>${shelf.category }</td>
						<td>${shelf.section }</td>
						<td><a data-id="${shelf.id }"
							class="btn btn-outline-danger delete-btn">Delete</a> <a
							id="${shelf.id }" class="btn btn-outline-warning update-btn">Update</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form action="shelf/save" method="POST">
			<h2>Shelf Entry</h2>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="category">Category :</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="category" placeholder=" "
						name="category">
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="section">Section
					:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="section"
						placeholder=" " name="section">
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

	<script type="text/javascript" src="/assets/js/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="/assets/bootstrap-4.0.0-beta.2/dist/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		var id = 0;
		$(document).ready(function() {

			$('.update-btn').on('click', function() {

				//ambil data dari server => ajax
				id = $(this).attr('id');

				$.ajax({
					type : 'POST',
					url : 'shelf/empid/' + id,
					success : function(data) {
						console.log(JSON.stringify(data));
						_setFieldUpdateModal(data);
					},
					dataType : 'json'
				});

				$('#updateModal').modal();
			});

			function _setFieldUpdateModal(data) {
				$('#modcategory').val(data.category);
				$('#modsection').val(data.section);

			}

			//event submit data for update
			$('#submit-update').click(function() {

				//Object ala js
				var Shelf = {
					id : id,
					category : $('#modcategory').val(),
					section : $('#modsection').val(),
				};

				//ajax update
				$.ajax({
					type : 'PUT',
					url : 'shelf/update',
					contentType : "application/json",
					data : JSON.stringify(Shelf),
					success : function(data) {
						window.location = "/shelf";
					}
				});
			});
		});

		//delete
		$(document).ready(function() {

			$('.delete-btn').on('click', function() {

				id = $(this).data('id');
				$('#deleteModal').modal(id);
			});

			$('#submit-delete').click(function() {

				$.ajax({
					type : 'DELETE',
					url : 'shelf/delete/' + id,
					success : function(data) {
						window.location = "/shelf";
					}
				});
			});
		});
	</script>

	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update
						Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="modcategory">Category</label> <input type="text"
								class="form-control" id="modcategory" name="modcategory" placeholder=" ">
							<!-- <small id="nameHelp" class="form-text text-muted">Silahkan anda mengisi nama dengan benar</small> -->
						</div>
						<div class="form-group">
							<label for="modsection">Section</label> <input type="text"
								class="form-control" id="modsection" name="modsection"
								placeholder=" ">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="submit-update">Update</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Delete
						Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="submit-delete">Delete</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>