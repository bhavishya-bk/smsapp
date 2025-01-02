<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="d-flex justify-content-center align-center">
<div class="w-50 align-middle border border-info border-3 mt-2"
style="height: 500px">

<h6 class="p-3 text-primary ">
<u>Instalment Details :-</u>
</h6>
<div class="border border-secondary m-3 p-2">
 <table class="table table-hover border border-secondary ">
 <tbody>
 <tr class="table-primary fs-6">
 <th>Student Id</th>
 <td>${st.studentId}</td>
 </tr>
 <tr class="table-primary fs-6">
 <th>Student Name</th>
 <td>${st.studentFullName}</td>
 
 <tr class="table-primary fs-6">
 <th>Course Name</th>
 <td>${st.studentCourse}</td>
 </tr>
 
 <tr class="table-primary fs-6">
 <th>Batch Number</th>
 <td>${st.batchNumber}</td>
 </tr>
 </tr>
 <tr class="table-danger fs-6">
 <th>Fees Paid</th>
 <td>${st.feesPaid}</td>
 </tr>
 
 </tbody>
 </table>
 <form action="payfees">
 <input type="text" name="studentid" value="${st.studentId}" hidden="true">
 <div class="bg-dark p-2 d-flex justify-content-between">
 <label for="amount" class="text-info"><b>Enter Installment<br>
Amount</b></label>
 <input type="number" name="ammount" max="30000" >
 </div>
 <div class="d-flex justify-content-center pt-5">
 <button class="btn btn-success btn-sm ">Add Installment</button>
 </div>
 </form>
 </div>
</div>
</div>

</body>
</html>