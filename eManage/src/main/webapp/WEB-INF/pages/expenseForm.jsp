<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Sudip C">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Expenses Information</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <style type="text/css">
        .myrow-container{
            margin: 20px;
        }
    </style>
</head>
<br>
<br>
<br>
<br>
<br>
<body class=".container-fluid">
    <div class="container myrow-container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    Expense Details
                </h3>
            </div>
            <div class="panel-body">
                <form:form id="expenseForm" cssClass="form-horizontal" modelAttribute="expense" method="post" action="saveExpense">

                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="categoryType" >Expense Type</form:label> </div>
                        <div class="col-xs-6">
                            <form:hidden path="id" value="${expenseObject.id}"/>
                            <form:input cssClass="form-control" path="categoryType" value="${expenseObject.categoryType}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="transactionType" >Transaction Type</form:label> </div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="transactionType" value="${expenseObject.transactionType}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label placeholder="DD/MM/YYY" path="purchaseDate" >Purchase Date</form:label>  </div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="purchaseDate" value="${expenseObject.purchaseDate}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="control-label col-xs-3"> <form:label path="amount" >Amount</form:label> </div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="amount" value="${expenseObject.amount}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">
                            </div>
                            <div class="col-xs-4">
                                <input type="submit" id="saveExpense" class="btn btn-primary" value="Save" onclick="return submitExpenseForm();"/>
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

    <script type="text/javascript">
        function submitExpenseForm() {

            // getting the employee form values
            var categoryType = $('#categoryType').val().trim();
            var transactionType = $('#transactionType').val();
            var purchaseDate = $('#purchaseDate').val();
            var amount = $('#amount').val();
            if(categoryType.length ==0) {
                alert('Please enter Expenses Type');
                $('#categoryType').focus();
                return false;
            }
            if(transactionType <= 0) {
                alert('Please enter Transaction Type');
                $('#transactionType').focus();
                return false;
            }
            if(purchaseDate <= 0) {
                alert('Please enter Purchase Date');
                $('#purchaseDate').focus();
                return false;
            }
            if(amount <= 0) {
                alert('Please enter proper amount');
                $('#amount').focus();
                return false;
            }
            return true;
        };
    </script>
    
    <script>
	$(document).ready(function(){
		var date_input=$('input[name="purchaseDate"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'dd/mm/yyyy',
			orientation: 'botton right',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>
    
</body>
</html>