<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Library MASA | BOOK</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="assets/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="assets/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="assets/asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="assets/asset/css/plugins/datatables.bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="assets/asset/css/plugins/animate.min.css"/>
  <link href="assets/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="assets/asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>

<body id="mimin" class="dashboard">
      <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
          <div class="col-md-12 nav-wrapper">
            <div class="navbar-header" style="width:100%;">
              <div class="opener-left-menu is-open">
                <span class="top"></span>
                <span class="middle"></span>
                <span class="bottom"></span>
              </div>
                <a href="index.html" class="navbar-brand"> 
                 <b>MASA</b>
                </a>

              <ul class="nav navbar-nav search-nav">
                <li>
                   <div class="search">
                    <span class="fa fa-search icon-search" style="font-size:23px;"></span>
                    <div class="form-group form-animate-text">
                      <input type="text" class="form-text" required>
                      <span class="bar"></span>
                      <label class="label-search">Type anywhere to <b>Search</b> </label>
                    </div>
                  </div>
                </li>
              </ul>

              <ul class="nav navbar-nav navbar-right user-nav" style="margin-right: 5px;">
                <li class="user-name"><span>Akihiko Avaron</span></li>
                  <li class="dropdown avatar-dropdown">
                   <img src="assets/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                   <ul class="dropdown-menu user-dropdown">
                     <li><a href="#"><span class="fa fa-user"></span> My Profile</a></li>
                     <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                     <li role="separator" class="divider"></li>
                     <li class="more">
                      <ul style="float: right;">
                        <li><a href=""><span class="fa fa-power-off "></span></a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      <!-- end: Header -->

      <div class="container-fluid mimin-wrapper">
  
          <!-- start:Left Menu -->
            <div id="left-menu">
              <div class="sub-left-menu scroll">
                <ul class="nav nav-list">
                    <li><div class="left-bg"></div></li>
                    <li class="time">
                      <h1 class="animated fadeInLeft">21:00</h1>
                      <p class="animated fadeInRight">Sat,October 1st 2029</p>
                    </li>
                    <li class="active ripple animated fadeInLeft">
                    	<a class="nav-header" href="book">
                    		<span class="fa fa-book"></span> Books  
                    		<span class="fa-angle-right fa right-arrow text-right"></span>
                    	</a>
                    </li>
                    <li class="ripple animated fadeInRight">
                    	<a class="tree-toggle nav-header">
                    		<span class="fa fa-money"></span> Rent History 
                    		<span class="fa-angle-right fa right-arrow text-right"></span>
                    	</a>
                    	<ul class="nav nav-list tree">
	                        <li><a href="rent_history">Book Rent List</a></li>
	                        <li><a href="handsontable.html">Borrow Book</a></li>
                      	</ul>
                    </li>
                    <li class="ripple"><a class="tree-toggle nav-header"><span class="fa fa-table"></span> Tables  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                      <ul class="nav nav-list tree">
                        <li><a href="datatables.html">Data Tables</a></li>
                        <li><a href="handsontable.html">handsontable</a></li>
                        <li><a href="tablestatic.html">Static</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
            </div>
          <!-- end: Left Menu -->


            <!-- start: Content -->
            <div id="content">
               <div class="panel box-shadow-none content-header">
                  <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">Book</h3>
                        <p class="animated fadeInDown">
                          Book <span class="fa-angle-right fa"></span> List
                        </p>
                    </div>
                  </div>
              </div>
              <div class="col-md-12 top-20 padding-0">
                <div class="col-md-12">
                  <div class="panel">
                    <div class="panel-body">
                      <div class="responsive-table">
                      
                      <button class="btn btn-success btn-md add-btn tree-toggle"><span class="fa-plus fa"></span> Add Book </button><br><br>
                      
                      <ul class="nav nav-list tree">
                        <li>
                        	<form action="book/save" method="POST">
								<div class="form-row">
								    <div class="form-group col-md-6">
									    <label>ISBN</label>
									    <input type="text" class="form-control" name="isbn">
									</div>
									<div class="form-group col-md-6">
								    	<label>Title</label>
								    	<input class="form-control" type="text" name="title"></td>
									</div>
									<div class="form-group col-md-6">
								    	<label>Author</label>
								    	<input type="text" class="form-control" name="author">
								  	</div>
								  	<div class="form-group col-md-6">
								    	<label>Released Year</label>
								    	<input type="text" class="form-control" name="releasedYear">
								  	</div>
								  	<div class="form-group col-md-6">
								    	<label>Publisher</label>
								    	<select class="form-control" name="publisher.id">
								    		<c:forEach var="publisher" items="${publishers }">
								    			<option value="${publisher.id }" label="${publisher.name }"/>
								    		</c:forEach>
								    	</select>
								  	</div>
								  	<div class="form-group col-md-6">
								    	<label>Category</label>
								    	<select class="form-control" name="shelf.id">
								    		<c:forEach var="shelf" items="${shelfs }">
								    			<option value="${shelf.id }" label="${shelf.category }"/>
								    		</c:forEach>
								    	</select>
								  	</div>
								  	<div class="form-group col-md-6">
								    	<label>Stock</label>
								    	<input type="text" class="form-control" name="bookStock.stock">
								  	</div>
								  	<div style="float: right;" class="form-group col-md-2">
								  		<br><br><br><br>
								  		<button type="submit" class="btn btn-primary form-control">Save</button><br><br><br>
								    </div>
								</div>
							</form>
                        </li>
                      </ul>
                      <table id="book-list" class="table table-striped table-bordered" width="100%" cellspacing="0">
	                      <thead>
	                        <tr>
								<th>Title</th>
								<th>Author</th>
								<th>Publisher</th>
								<th>Category</th>
								<th style="width: 20%;">Action</th>
							</tr>
	                      </thead>
	                      <tbody>
	                        <c:forEach var="book" items="${books }">
								<tr>
									<td>${book.title }</td>
									<td>${book.author }</td>
									<td>${book.publisher.name }</td>
									<td>${book.shelf.category }</td>
									<td>
										<button class="btn btn-success btn-sm detail-btn icon-box" data-id="${book.id}" title="Detail"><span class="icons icon-eye"></span></button>&nbsp;
										<button class="btn btn-warning btn-sm update-btn icon-box" data-id="${book.id}" title="Update"><span class="icons icon-note"></span></button>&nbsp;
										<button class="btn btn-danger btn-sm delete-btn icon-box" data-id="${book.id}" title="Delete"><span class="icons icon-trash"></span></button>
									</td>
								</tr>
							</c:forEach>
	                      </tbody>
                      </table>
                      </div>
                  </div>
                </div>
              </div>  
            </div>
          </div>
          <!-- end: content -->         
      </div>

	<!-- start: Javascript -->
	<script src="assets/asset/js/jquery.min.js"></script>
	<script src="assets/asset/js/jquery.ui.min.js"></script>
	<script src="assets/asset/js/popper.min.js"></script>
	<script src="assets/asset/js/bootstrap.min.js"></script>
	
	<!-- plugins -->
	<script src="assets/asset/js/plugins/moment.min.js"></script>
	<script src="assets/asset/js/plugins/jquery.datatables.min.js"></script>
	<script src="assets/asset/js/plugins/datatables.bootstrap.min.js"></script>
	<script src="assets/asset/js/plugins/jquery.nicescroll.js"></script>
	
	<!-- custom -->
	<script src="assets/asset/js/main.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
	    $('#book-list').DataTable();
	  });
	</script>
	<!-- end: Javascript -->
	
	<script type="text/javascript">
		
		var id = 0;
		
		//detail
		$(document).ready(function (){
			$('.detail-btn').on('click',function() {
				
				id = $(this).data('id');
				
				//ajax retrive data
				$.ajax({
					type: 'POST',
					url: '/book/edit/'+id,
					success: function(data) {		
						setField(data);
					},
					dataType: 'json'
				});
				
				$('#detail-modal').modal();
			});
			
			function setField(data) {
				$('#detail-isbn').val(data.isbn);
				$('#detail-title').val(data.title);
				$('#detail-author').val(data.author);
				$('#detail-releasedYear').val(data.releasedYear);
				$('#detail-publisher').val(data.publisher.name);
				$('#detail-bookStock').val(data.bookStock.stock);
				$('#detail-category').val(data.shelf.category);
			}
		});
		
		
		//update
		$(document).ready(function (){
			$('.update-btn').on('click',function() {
				
				id = $(this).data('id');
				
				//ajax retrive data
				$.ajax({
					type: 'POST',
					url: '/book/edit/'+id,
					success: function(data) {		
						setField(data);
					},
					dataType: 'json'
				});
				
				$('#update-modal').modal();
			});
			
			function setField(data) {
				$('#isbn').val(data.isbn);
				$('#title').val(data.title);
				$('#author').val(data.author);
				$('#releasedYear').val(data.releasedYear);
				$('#publisher').val(data.publisher.id);
				$('#bookStockId').val(data.bookStock.id);
				$('#bookStock').val(data.bookStock.stock);
				$('#category').val(data.shelf.id);
			}
			
			//submit update
			$('#submit-update').click(function(){
				var Book = {
					id : id,
					isbn : $('#isbn').val(),
					title : $('#title').val(),
					author : $('#author').val(),
					releasedYear : $('#releasedYear').val(),
					publisher : {
						id : $('#publisher').val()
					},
					bookStock : {
						id : $('#bookStockId').val(),
						stock : $('#bookStock').val()
					},
					shelf : {
						id : $('#category').val()
					}
				};
				
				// ajax update
				$.ajax({
					type: 'PUT',
					url: '/book/update',
					contentType: "application/json",
					data : JSON.stringify(Book),
					success: function(data) {		
						window.location = "/book";
					}
				});
			});
		});
		
		//delete
		$(document).ready(function (){
			
			$('.delete-btn').on('click',function() {
				
				id = $(this).data('id');
				$('#delete-modal').modal(id);
			});
			
			$('#ok-delete').click(function(){
				
				$.ajax({
					type: 'DELETE',
					url: '/book/delete/'+id,
					success: function(data) {		
						window.location = "/book";
					}
				});
			});
		});
	</script>
	
	<!-- Detail Update -->
	<div class="col-md-12">
		<div class="modal fade"  id="detail-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">Book Detail</h4>
		        </div>
		        <div class="modal-body">
		        	<form style="margin-top: 3%;">
						<div class="form-row">
						    <div class="form-group col-md-6">
							    <label>ISBN</label>
							    <input type="text" class="form-control" id="detail-isbn" disabled>
							</div>
							<div class="form-group col-md-6">
						    	<label>Author</label>
						    	<input type="text" class="form-control" id="detail-author" disabled>
						  	</div>
							<div class="form-group" style="margin-left:2.5%; margin-right: 2.5%;">
						    	<label>Title</label>
						    	<input class="form-control" type="text" id="detail-title" disabled>
							</div>
						  	<div class="form-group col-md-6">
						    	<label>Released Year</label>
						    	<input type="text" class="form-control" id="detail-releasedYear" disabled>
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Publisher</label>
						    	<input class="form-control" id="detail-publisher" disabled>
						    	<%-- <select class="form-control" id="detail-publisher" disabled>
						    		<c:forEach var="publisher" items="${publishers }">
						    			<option value="${publisher.id }" label="${publisher.name }"/>
						    		</c:forEach>
						    	</select> --%>
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Category</label>
						    	<input class="form-control" id="detail-category" disabled>
						    	<%-- <select class="form-control" id="detail-category" disabled>
						    		<c:forEach var="shelf" items="${shelfs }">
						    			<option value="${shelf.id }" label="${shelf.category }"/>
						    		</c:forEach>
						    	</select> --%>
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Stock</label>
						    	<input type="text" class="form-control" id="detail-bookStock" disabled>
						  	</div>
						  	<label> </label>
						</div>
					</form>
		        </div>
	        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
   	</div>
	
	<!-- Modal Update -->
	<div class="col-md-12">
		<div class="modal fade"  id="update-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">Update Book</h4>
		        </div>
		        <div class="modal-body">
		        	<form style="margin-top: 3%;">
						<div class="form-row">
						    <div class="form-group col-md-6">
							    <label>ISBN</label>
							    <input type="text" class="form-control" name="isbn" id="isbn">
							</div>
							<div class="form-group col-md-6">
						    	<label>Author</label>
						    	<input type="text" class="form-control" name="author" id="author">
						  	</div>
							<div class="form-group" style="margin-left:2.5%; margin-right: 2.5%;">
						    	<label>Title</label>
						    	<input class="form-control" type="text" name="title" id="title"></td>
							</div>
						  	<div class="form-group col-md-6">
						    	<label>Released Year</label>
						    	<input type="text" class="form-control" name="releasedYear" id="releasedYear">
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Publisher</label>
						    	<select class="form-control" name="publisher" id="publisher">
						    		<c:forEach var="publisher" items="${publishers }">
						    			<option value="${publisher.id }" label="${publisher.name }"/>
						    		</c:forEach>
						    	</select>
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Category</label>
						    	<select class="form-control" name="category" id="category">
						    		<c:forEach var="shelf" items="${shelfs }">
						    			<option value="${shelf.id }" label="${shelf.category }"/>
						    		</c:forEach>
						    	</select>
						  	</div>
						  	<div class="form-group col-md-6">
						    	<label>Stock</label>
						    	<input type="hidden" class="form-control" name="bookStockId" id="bookStockId">
						    	<input type="text" class="form-control" name="bookStock" id="bookStock">
						  	</div>
						  	<label> </label>
						</div>
					</form>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="submit-update">Save changes</button>
		        </div>
	        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
   	</div>
	
	<!-- Modal Delete -->
	<div class="col-md-12">
		<div class="modal fade"  id="delete-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">Delete Book</h4>
		        </div>
		        <div class="modal-body">
		        	<h4>Are you sure?</h4>
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
	        		<button type="button" class="btn btn-primary" id="ok-delete">Yes</button>
		        </div>
	        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
   	</div>
</body>
</html>