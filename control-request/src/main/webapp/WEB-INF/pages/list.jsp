<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="SHORTCUT ICON" href='<c:url value="/images/favicon.ico"/>' type="image/x-icon">
<script type="text/javascript" src='<c:url value="/js/jquery-1.12.0.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/moment-with-locales.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/list-acc.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap-datepicker.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/table.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/autoresize.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/table.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/loginform.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/bootstrap-datepicker.css"/>'/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Control-Request</title>
</head>
<body>
	<!-- Edit button -->
	<script>
		$(document).ready(function() {
			function funcBefore() {
			}

			function funcSuccess() {
				location.reload();
			}

			$("#editClick").bind("click", function() {
				var edit = {
					id : $("#editId").text(),
					title : $("#editTitle").val(),
					description : $("#editDescription").val(),
					date : $("#editDate").val(),
					status : $("#editStatus").val()
				}
				
				

				var edit1 = JSON.stringify(edit);
				
				$.ajax({
					url : "<c:url value="/request/edit"/>",
					contentType : 'application/json',
					data : edit1,
					type : 'POST',
					beforeSend : funcBefore,
					success : funcSuccess,
					error : function(xhr, status, errorThrown) {
						alert('add request failed' + status + errorThrown);
					}
				});
			});

			$(function() {
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$(document).ajaxSend(function(e, xhr, options) {
					xhr.setRequestHeader(header, token);
				});
			});
		});
	</script>
	
	
	
	<!-- Adding row  /add-->
	<script>
		$(document).ready(function() {
			function funcBefore() {
			}

			function funcSuccess() {
				location.reload();
			}

			$("#addClick").bind("click", function() {
				var request = {
					title : $("#requestTitle").val(),
					description : $("#requestDescription").val(),
					date : $("#requestDate").val(),
					status : $("#requestStatus").val()
				}
				
				

				var request1 = JSON.stringify(request);

				$.ajax({
					url : "<c:url value="/request/add"/>",
					contentType : 'application/json',
					data : request1,
					type : 'POST',
					beforeSend : funcBefore,
					success : funcSuccess,
					error : function(xhr, status, errorThrown) {
						alert('add request failed' + status + errorThrown);
					}
				});
			});

			$(function() {
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				$(document).ajaxSend(function(e, xhr, options) {
					xhr.setRequestHeader(header, token);
				});
			});
		});
	</script>
<body>
    

	<div class="container">
		<div class="row">
			<h3>Hello, ${name}</h3>
			<div class="navbar navbar-inverse">
				<div class="collapse navbar-collapse js-navbar-collapse">
					<ul class="nav navbar-nav js-nav-add-active-class">
           				<li><a href="<c:url value="/"/>"><span class="glyphicon glyphicon-home"></span> </a></li>
           			</ul>
           			
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="true">My
								account <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="<c:url value="/request/all-list"/>"><span
										class="glyphicon glyphicon-file"></span> All requests</a></li>
								</sec:authorize>
								<li><a href="<c:url value="/settings"/>"> <span
										class="glyphicon glyphicon-cog"></span> Settings
								</a></li>
								<li class="divider"></li>
								<li>
								<a href="javascript:void(0)"
									onClick="document.forms['formout'].submit()"> <span
										class="glyphicon glyphicon-off"></span> Exit
								</a>
									<form name="formout" method="POST"
										action="<c:url value="/logouth"/>">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token }" />
									</form>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<hr>
		<div class="row">
			<div class="panel panel-primary filterable">
				<div class="panel-heading">
					<h3 class="panel-title">Register</h3>
					<div class="pull-right">
						<a href="#" data-toggle="modal" data-target="#addModal"
							data-backdrop class="btn btn-success btn-xs"><b>+</b> Add </a>
						<button class="btn btn-default btn-xs btn-filter">
							<span class="glyphicon glyphicon-filter"></span> Filter
						</button>
					</div>
				</div>
				<table class="table table-striped custab">
					<thead>
						<tr class="filters">
							<th><input type="text" class="form-control" placeholder="ID"
								disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Title" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Employee" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Department" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Time" disabled></th>
							<th><input type="text" class="form-control"
								placeholder="Status" disabled></th>
						</tr>
					</thead>
					<tbody>
						<!-- CREATE -->
						<c:forEach items="${requestCreate}" var="request">
							<tr>
								<td class="col-md-1">${request.id}</td>
								<td><a href="#" id="title" data-toggle="modal"
									data-target="#descripModal" data-des="${request.description}"
									data-title="${request.title}">${request.title}</a></td>
								<td>${request.lfName}</td>
								<td>${request.departament}</td>
								<td><fmt:formatDate value="${request.date}"
										pattern="dd/MM/yyyy" /></td>
								<td class="text-left col-xs-1"><c:choose>
										<c:when test="${request.status =='CREATE'}">
											<span class="label label-default"> ${request.status}</span>
										</c:when>
										<c:when test="${request.status =='PROCESSING'}">
											<span class="label label-primary"> ${request.status}</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success"> ${request.status}</span>
										</c:otherwise>
									</c:choose>
								<td class="text-center col-xs-2">
									<button id="editButton${request.id}"  class='btn btn-info btn-xs'><span class="glyphicon glyphicon-edit"></span> Edit</button> 
														
														
													<!-- Update row on Create list-->
													<script>
														$(document).ready(function() {
															function funcBefore() {
															}
													
															function funcSuccess(data) {
																$('#editModal').modal('show');
																
																   $("#editDescription").text(data.description);
																   $("#editDate").val(data.date);
																   $("#editTitle").val(data.title);
																   $("select#editStatus").val(data.status);
																   $("#editId").text(data.id);
															}
													
															$("#editButton${request.id}").bind("click", function() {
																
																
																var edit = ${request.id};
																var edit1 = JSON.stringify(edit);
																 
																
																$.ajax({
																	url : "<c:url value="/request/update"/>",
																	contentType : 'application/json',
																	data : edit1,
																	type : 'POST',
																	beforeSend : funcBefore,
																	success : funcSuccess,
																	error : function(xhr, status, errorThrown) {
																		alert('edit request failed ' + status + errorThrown);
																	}
																});
															});
													
															
															$(function() {
																var token = $("meta[name='_csrf']").attr("content");
																var header = $("meta[name='_csrf_header']").attr("content");
																$(document).ajaxSend(function(e, xhr, options) {
																	xhr.setRequestHeader(header, token);
																});
															});
														});
													</script>
														
														
									
									<a href="#" data-toggle="modal" data-target="#confimModal${request.id}"
									class="btn btn-danger btn-xs"><span
										class="glyphicon glyphicon-remove"></span> Del</a>
									<form name="form${request.id}" method="POST"
										action="<c:url value="/request/delete/${request.id}"/>">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
									</form>

									<div class="modal fade" id="confimModal${request.id}"
										tabindex="-1" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button class="close" type="button" data-dismiss="modal">x</button>
													<h4 class="modal-title" id="myModalLabel">Please
														Confirm</h4>
												</div>
												<div class="modal-body">
													<h3>Are you sure you want to delete?</h3>
												</div>
												<div class="modal-footer">
													<a href="javascript:void(0)"
														onClick="document.forms['form${request.id}'].submit()"
														class="btn btn-danger">Delete</a>
													<button class="btn btn-default" type="button"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					<!-- PROCENNIG -->
						<c:forEach items="${requestProcessing}" var="request">
							<tr>
								<td class="col-md-1">${request.id}</td>
								<td><a href="#" id="title" data-toggle="modal"
									data-target="#descripModal" data-des="${request.description}"
									data-title="${request.title}">${request.title}</a></td>
								<td>${request.lfName}</td>
								<td>${request.departament}</td>
								<td><fmt:formatDate value="${request.date}"
										pattern="dd/MM/yyyy" /></td>
								<td class="text-left col-xs-1"><c:choose>
										<c:when test="${request.status =='CREATE'}">
											<span class="label label-default"> ${request.status}</span>
										</c:when>
										<c:when test="${request.status =='PROCESSING'}">
											<span class="label label-primary"> ${request.status}</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success"> ${request.status}</span>
										</c:otherwise>
									</c:choose>
								<td class="text-center col-xs-2">
									<button id="editButton${request.id}"  class='btn btn-info btn-xs'><span class="glyphicon glyphicon-edit"></span> Edit</button> 
									<!-- Update row on Processing list-->
													<script>
														$(document).ready(function() {
															function funcBefore() {
															}
													
															function funcSuccess(data) {
																$('#editModal').modal('show');
																
																   $("#editDescription").text(data.description);
																   $("#editDate").val(data.date);
																   $("#editTitle").val(data.title);
																   $("select#editStatus").val(data.status);
																   $("#editId").text(data.id);
															}
													
															$("#editButton${request.id}").bind("click", function() {
																
																
																var edit = ${request.id};
																var edit1 = JSON.stringify(edit);
																 
																
																$.ajax({
																	url : "<c:url value="/request/update"/>",
																	contentType : 'application/json',
																	data : edit1,
																	type : 'POST',
																	beforeSend : funcBefore,
																	success : funcSuccess,
																	error : function(xhr, status, errorThrown) {
																		alert('edit request failed ' + status + errorThrown);
																	}
																});
															});
													
															
															$(function() {
																var token = $("meta[name='_csrf']").attr("content");
																var header = $("meta[name='_csrf_header']").attr("content");
																$(document).ajaxSend(function(e, xhr, options) {
																	xhr.setRequestHeader(header, token);
																});
															});
														});
													</script>
														
									
									<a href="#"	data-toggle="modal" data-target="#confimModal${request.id}"
									class="btn btn-danger btn-xs"><span
										class="glyphicon glyphicon-remove"></span> Del</a>
									<form name="form${request.id}" method="POST"
										action="<c:url value="/request/delete/${request.id}"/>">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token }" />
									</form>

									<div class="modal fade" id="confimModal${request.id}"
										tabindex="-1" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button class="close" type="button" data-dismiss="modal">x</button>
													<h4 class="modal-title" id="myModalLabel">Please
														Confirm</h4>
												</div>
												<div class="modal-body">
													<h3>Are you sure you want to delete?</h3>
												</div>
												<div class="modal-footer">
													<a href="javascript:void(0)"
														onClick="document.forms['form${request.id}'].submit()"
														class="btn btn-danger">Delete</a>
													<button class="btn btn-default" type="button"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					<!-- CLOSED -->
						<c:forEach items="${requestClosed}" var="request">
							<tr>
								<td class="col-md-1">${request.id}</td>
								<td><a href="#" id="title" data-toggle="modal"
									data-target="#descripModal" data-des="${request.description}"
									data-title="${request.title}">${request.title}</a></td>
								<td>${request.lfName}</td>
								<td>${request.departament}</td>
								<td><fmt:formatDate value="${request.date}"
										pattern="dd/MM/yyyy" /></td>
								<td class="text-left col-xs-1"><c:choose>
										<c:when test="${request.status =='CREATE'}">
											<span class="label label-default"> ${request.status}</span>
										</c:when>
										<c:when test="${request.status =='PROCESSING'}">
											<span class="label label-primary"> ${request.status}</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success"> ${request.status}</span>
										</c:otherwise>
									</c:choose>
								<td class="text-center col-xs-2">
										<button id="editButton${request.id}"  class='btn btn-info btn-xs'><span class="glyphicon glyphicon-edit"></span> Edit</button> 
										
										<!-- Update row on Closed list-->
													<script>
														$(document).ready(function() {
															function funcBefore() {
															}
													
															function funcSuccess(data) {
																$('#editModal').modal('show');
																
																   $("#editDescription").text(data.description);
																   $("#editDate").val(data.date);
																   $("#editTitle").val(data.title);
																   $("select#editStatus").val(data.status);
																   $("#editId").text(data.id);
															}
													
															$("#editButton${request.id}").bind("click", function() {
																
																
																var edit = ${request.id};
																var edit1 = JSON.stringify(edit);
																 
																
																$.ajax({
																	url : "<c:url value="/request/update"/>",
																	contentType : 'application/json',
																	data : edit1,
																	type : 'POST',
																	beforeSend : funcBefore,
																	success : funcSuccess,
																	error : function(xhr, status, errorThrown) {
																		alert('edit request failed ' + status + errorThrown);
																	}
																});
															});
													
															
															$(function() {
																var token = $("meta[name='_csrf']").attr("content");
																var header = $("meta[name='_csrf_header']").attr("content");
																$(document).ajaxSend(function(e, xhr, options) {
																	xhr.setRequestHeader(header, token);
																});
															});
														});
													</script>
									
									<a href="#" data-toggle="modal" data-target="#confimModal${request.id}"
									class="btn btn-danger btn-xs"><span
										class="glyphicon glyphicon-remove"></span> Del</a>
									<form name="form${request.id}" method="POST"
										action="<c:url value="/request/delete/${request.id}"/>">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token }" />
									</form>

									<div class="modal fade" id="confimModal${request.id}"
										tabindex="-1" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button class="close" type="button" data-dismiss="modal">x</button>
													<h4 class="modal-title" id="myModalLabel">Please
														Confirm</h4>
												</div>
												<div class="modal-body">
													<h3>Are you sure you want to delete?</h3>
												</div>
												<div class="modal-footer">
													<a href="javascript:void(0)"
														onClick="document.forms['form${request.id}'].submit()"
														class="btn btn-danger">Delete</a>
													<button class="btn btn-default" type="button"
														data-dismiss="modal">Close</button>
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
		</div>
	</div>
	<div class="modal fade" id="descripModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">x</button>
					<h4 class="modal-title" id="myModalLabel">
						<div id="descripTitle"></div>
					</h4>
				</div>
				<div id="descripDetails" class="modal-body"></div>

				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">x</button>
					<h4 class="modal-title" id="myModalLabel">Add</h4>
				</div>
				<div class="modal-body">
					<form name="addForm" method="POST" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
						<div class="row">
							<div class="col-xs-6">
								<p>Title:</p>
								<input id="requestTitle" type="text" class="form-control">
							</div>
							<div class="col-xs-12">
								<br>
								<p>Description:</p>
								<textarea id="requestDescription"  class="noresize form-control animated "></textarea>
							</div>
							<div class="col-xs-4">
								<br>
								<p>Date:</p>
								<div class="form-group">
									<div class='input-group date' id='datetimepicker1'>
										<input id="requestDate"  type='text' class="form-control" value="" readonly>
										<span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">

								<p>Status:</p>
								<select id='requestStatus' class="selectpicker form-control">
									<c:forEach items="${status}" var="status">
										<option>${status.title}</option>
									</c:forEach>

								</select> 
								
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="addClick" type="button"
						class="btn btn-primary" data-dismiss="modal"> <span
						class="glyphicon glyphicon-send"></span> Save
					</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Close
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Edit -->
	
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal">x</button>
				<h4 class="modal-title" ><div id="editId"></div></h4>
			</div>
			<div class="modal-body">
				<form name="editForm" method="POST" >
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
					<div class="row">
						<div class="col-xs-6">
							<p>Title:</p>
							<input id="editTitle" type="text" class="form-control">
						</div>
						<div class="col-xs-12">
							<br>
							<p>Description:</p>
							<textarea id="editDescription"  class="noresize form-control animated "></textarea>
						</div>
						<div class="col-xs-4">
							<br>
							<p>Date:</p>
							<div class="form-group">
								<div class='input-group date' id='datetimepicker2'>
									<input id="editDate"  type='text' class="form-control"  readonly>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<p>Status:</p>
							<select class="form-control" id='editStatus' >
								<c:forEach items="${status}" var="status">
									<option value="${status.title}">${status.title}</option>
								</c:forEach>
							</select> 
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="editClick" type="button"
					class="btn btn-primary" data-dismiss="modal"> <span
					class="glyphicon glyphicon-send"></span> Edit
				</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">
					<span class="glyphicon glyphicon-remove"></span> Close
				</button>
			</div>
		</div>
	</div>
</div>
	

</body>
</html>