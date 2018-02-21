<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Expenses List</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    
    <link rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
    </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <div class="panel-primary class">
        <div class="panel-heading">
            <h3 class="panel-title">
                <div align="left"><b>Expenses List</b> </div>
                <!--  
                <div align="right"><a href="createExpense">Add New Expenses</a></div>-->
               <div align="right"><a href="createExpense" class="btn btn-success" type="button">Add New Expenses</a>
				</div>
            </h3>
        </div>
        <div class="panel-body">
            <c:if test="${empty expenseList}">
                There are no expenses records
            </c:if>
            <c:if test="${not empty expenseList}">

                <form action="searchExpense">
                    <div class="row">
                      <div class="col-md-6"><div class="col-md-6">Search expenses by type:</div><div class="col-md-6"> <input type="text" name="searchExpenseType" id="searchExpenseType"> </div></div>
                      <div class="col-md-4"><input class="btn btn-info" type='submit' value='Search'/></div>
                    </div>
                </form>
					<br>
                <table class="table table-hover table-bordered" id="example">
               
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>Id</th>
                        <th>Category Type</th>
                        <th>Transaction Type</th>
                        <th>Purchase Date</th>
                        <th>Amount</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${expenseList}" var="exp">
                        <tr>
                            <th><c:out value="${exp.id}"/></th>
                            <th><c:out value="${exp.categoryType}"/></th>
                            <th><c:out value="${exp.transactionType}"/></th>
                            <th><c:out value="${exp.purchaseDate}"/></th>
                            <th><c:out value="${exp.amount}"/></th>
                           <!--   <th><a href="editExpense?id=<c:out value='${exp.id}'/>">Edit</a></th>
                            <th><a href="deleteExpense?id=<c:out value='${exp.id}'/>">Delete</a></th>-->
                            
                            <th>
                            <div class="col-md-4">
  							<a href="editExpense?id=<c:out value='${exp.id}'/>" class="btn btn-success" type="button">Edit</a>
							</div>
                            </th>
                            <th><div class="col-md-4">
 							<a href="deleteExpense?id=<c:out value='${exp.id}'/>" class="btn btn-danger" type="button">Delete</a>
							</div>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

    <%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
     --%>
     <script type="text/javascript">
     $(document).ready(function() {
    $('#example').DataTable();
} );
     </script>
     
</body>
</html>