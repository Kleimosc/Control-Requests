<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="SHORTCUT ICON" href='<c:url value="/images/favicon.ico"/>' type="image/x-icon">
<script type="text/javascript" src='<c:url value="/js/jquery-1.12.0.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/list-acc.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'/>
<link rel="stylesheet" href='<c:url value="/css/table.css"/>'/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Control-Request</title>
</head>
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
							data-toggle="dropdown" role="button" aria-expanded="true">My account <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="<c:url value="all-list"/>"><span
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
									<form id="formout" name="formout" method="POST"
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
		<div class="col-md-3">	
			<p>Your id: ${id}</p>
			<p>Your department: ${departament}</p>
		</div>
	</div>
	<br>
	<form  method="POST" action="<c:url value="/settings/change"/>" >
	  	<div class="row">	
			<div class="col-md-3">	
		  		<select class="form-control" id="dep" name="id">
		  		<c:forEach items="${departaments}" var="departaments">
		  				<option value="${departaments.id}">${departaments}</option>
		  		</c:forEach>
		    	</select>
	    </div>
	    <button class="btn btn-success" type="submit">Change</button>
	    </div>
	    
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<p>Add department:</p>
	<form  method="POST" action="<c:url value="/settings/add-dep"/>" >
	  	<div class="row">	
			<div class="col-md-3">
	  			<input class="form-control " name="titleDep">
	    	</div>
	    	<button class="btn btn-success" type="submit">Add</button>
	    </div>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	<p>Delete department:</p>
	<form  method="POST" action="<c:url value="/settings/delete-dep"/>" >
	  	<div class="row">	
			<div class="col-md-3">	
		  		<select class="form-control" name="id">
		  		<c:forEach items="${departaments}" var="departaments">
		  				<option value="${departaments.id}">${departaments}</option>
		  		</c:forEach>
		    	</select>
	    </div>
	    <button class="btn btn-danger" type="submit">Delete</button>
	    </div>
	    
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	</form>
	<br>
	</sec:authorize>
	<p><a href="#"  data-toggle="modal" data-target="#deleteModal">Delete my account!</a></p><div id="information"></div>
	
	
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Closed">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Delete my account!</h4>
				</div>
				<div class="modal-body">
					<p>Enter your id:</p>
					<input id="enterId" type="text" class="form-control">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Closed</button>
					<button id="buttonDelete" type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			function funcBefore() {
				$("#information").text ("Wait..");
			}

			function funcSuccess(status) {
				console.log(status)
			
				if (status == "EXIT") {
					$('#formout').submit();
				} else {
					$("#information").html("<font color="+"red"+">"+"<b>Wrong</b>");
				}
			}

			$("#buttonDelete").bind("click", function() {
				var delAcc = $("#enterId").val();

				$.ajax({
					url : "<c:url value="/settings/deleteAcc"/>",
					contentType : 'application/json',
					data : delAcc,
					type : 'POST',
					beforeSend : funcBefore,
					success : funcSuccess,
					error : function(xhr, status, errorThrown) {
						alert('Delete request failed' + status + errorThrown);
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
	
	
	<script>
		$("select#dep").val("${departament.id}");
	</script>
	
</body>
</html>