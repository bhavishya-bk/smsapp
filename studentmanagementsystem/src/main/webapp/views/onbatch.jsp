<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Installment Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
</head>
<body>
    <div class="d-flex justify-content-center align-items-center">
        <div class="w-50 align-middle border border-info border-3 mt-2 min-vh-50">
            <h6 class="p-3 text-primary">
                <u>Student Detail</u>
            </h6>
            <div class="border border-secondary m-3 p-2">
                <table class="table table-hover border border-secondary">
                    <tbody>
                        <tr class="table-primary fs-6">
                            <th>Student Id</th>
                            <td>${st.studentId}</td>
                        </tr>
                        <tr class="table-primary fs-6">
                            <th>Student Name</th>
                            <td>${st.studentFullName}</td>
                        </tr>
                        <tr class="table-primary fs-6">
                            <th>Course Name</th>
                            <td>${st.studentCourse}</td>
                        </tr>
                        <tr class="table-primary fs-6">
                            <th>Batch Number</th>
                            <td>${st.batchNumber}</td>
                        </tr>
                        <tr class="table-danger fs-6">
                            <th>Fees Paid</th>
                            <td>${st.feesPaid}</td>
                        </tr>
                    </tbody>
                </table>
               <form action="changeBatch" method="get">
    <!-- Hidden Input for Student ID -->
    <input type="hidden" name="studentId" value="${st.studentId}" />

    <!-- Dropdown for Batch Number -->
    <div class="mb-3">
        <label for="batchNumber" class="form-label">Select Batch Number:</label>
        <select class="form-control form-control-sm border border-primary" name="batchNumber" id="batchNumber" required>
            <option value="" selected>Select Batch Number</option>
            <option value="FDJ-185">FDJ-185</option>
            <option value="REG-185">REG-185</option>
            <option value="FDJ-161">FDJ-161</option>
            <option value="REG-161">REG-161</option>
        </select>
    </div>
    <div class="col">
											<select class="select form-control-sm" name="batchMode">
												<option value="#" disabled>Select Batch Mode</option>
												<option value="Online">Online</option>
												<option value="Offline">Offline</option>

											</select> <label class="form-label select-label">Batch Mode</label>
										</div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary">Change Batch</button>
</form>
               
            </div>
        </div>
    </div>
</body>
</html>
