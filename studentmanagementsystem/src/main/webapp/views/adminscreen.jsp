<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminScreen</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style type="text/css">
.enroll {
	background-image: url("images/studentenrollment.png");
	background-size: cover;
	background-repeat: no-repeat;
}

.heading {
	font-family: cursive;
	text-align: center;
	margin-bottom: 20px;
}

form {
	width: 400px
}

.view {
	background-image: url("images/studentdetail.jpg");
	background-size: cover;
	 background-repeat:repeat-y;
}
</style>

<script type="text/javascript">
	function fees() {
		document.fn.action = "/fees"
		document.action.submit();
	}

	function batch() {
		document.fn.action = "/batch"
		document.action.submit();
	}
	function remove() {
		document.fn.action = "/remove"
		document.action.submit();
	}
</script>

</head>
<body>
	<div class="card">
		<nav class="d-flex justify-content-between p-2 border border-primary">
			<img src="images/cjclogo.jpeg" width="100px" height="50px">
			<div class="pt-2">
				<a href="#enroll">
					<button class="btn btn-outline-primary">Enroll Student</button>
				</a> <a href="#view">
					<button class="btn btn-outline-primary">View Student</button>
				</a> <a href="/">
					<button class="btn btn-outline-primary">Logout</button>
				</a>
			</div>
		</nav>
		<section class="vh-100 gradient-custom enroll mt-2" id="div">
			<div class="container h-100">
				<div class="row justify-content-center h-100 w-75">
					<div class="col-12 col-lg-9 col-xl-7">
						<div class="card shadow-2-strong card-registration mt-0"
							style="border-radius: 15px;">
							<div class="card-body mt-0">
								

								<form action="enroll_student" method="post" class="p-4 shadow rounded bg-light">
    <h4 class="text-center mb-4 text-primary">Student Enrollment Form</h4>
    <div class="row g-3">
        <div class="col-md-6">
            <label for="studentFullName" class="form-label fw-bold">Full Name</label>
            <input
                type="text"
                id="studentFullName"
                class="form-control"
                name="studentFullName"
                placeholder="Enter full name"
                required
            />
        </div>
        <div class="col-md-6">
            <label for="studentEmail" class="form-label fw-bold">Email</label>
            <input
                type="email"
                id="studentEmail"
                class="form-control"
                name="studentEmail"
                placeholder="Enter email address"
                required
            />
        </div>
    </div>
    <div class="row g-3 mt-3">
        <div class="col-md-6">
            <label for="studentAge" class="form-label fw-bold">Age</label>
            <input
                type="number"
                id="studentAge"
                class="form-control"
                name="studentAge"
                placeholder="Enter age"
                required
                min="10"
                max="100"
            />
        </div>
        <div class="col-md-6">
            <label for="studentCollegeName" class="form-label fw-bold">College Name</label>
            <input
                type="text"
                id="studentCollegeName"
                class="form-control"
                name="studentCollegeName"
                placeholder="Enter college name"
                required
            />
        </div>
    </div>
    <div class="row g-3 mt-3">
        <div class="col-md-6">
            <label for="feesPaid" class="form-label fw-bold">Fees Paid</label>
            <input
                type="number"
                id="feesPaid"
                class="form-control"
                name="feesPaid"
                placeholder="Enter fees paid"
                required
                min="0"
            />
        </div>
        <div class="col-md-6">
            <label class="form-label fw-bold">Course</label>
            <div class="d-flex align-items-center gap-3">
                <div class="form-check">
                    <input
                        class="form-check-input"
                        type="radio"
                        name="studentCourse"
                        id="java"
                        value="Java"
                        checked
                    />
                    <label class="form-check-label" for="java">Java</label>
                </div>
                <div class="form-check">
                    <input
                        class="form-check-input"
                        type="radio"
                        name="studentCourse"
                        id="python"
                        value="Python"
                    />
                    <label class="form-check-label" for="python">Python</label>
                </div>
                <div class="form-check">
                    <input
                        class="form-check-input"
                        type="radio"
                        name="studentCourse"
                        id="testing"
                        value="Testing"
                    />
                    <label class="form-check-label" for="testing">Testing</label>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-3 mt-3">
        <div class="col-md-6">
            <label for="batchMode" class="form-label fw-bold">Batch Mode</label>
            <select id="batchMode" class="form-select" name="batchMode" required>
                <option value="" disabled selected>Select Batch Mode</option>
                <option value="Online">Online</option>
                <option value="Offline">Offline</option>
            </select>
        </div>
        <div class="col-md-6">
            <label for="batchNumber" class="form-label fw-bold">Batch Number</label>
            <select id="batchNumber" class="form-select" name="batchNumber" required>
                <option value="" disabled selected>Select Batch Number</option>
                <option value="FDJ-185">FDJ-185</option>
                <option value="REG-185">REG-185</option>
                <option value="FDJ-161">FDJ-161</option>
                <option value="REG-161">REG-161</option>
            </select>
        </div>
    </div>
    <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary px-4 py-2">Submit</button>
    </div>
</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="view" style="height: 530px" id="view">
			<h1 class="text-center" style="color: blue">Student Details..!</h1>
			<div class="text-center w-100">
				<form action="search" class="w-100">
					<select class="select form-control-sm border border-primary"
						name="batchNumber">
						<option value="#" slected>Select Batch Number</option>
						<option value="FDJ-185">FDJ-185</option>
						<option value="REG-185">REG-185</option>
						<option value="FDJ-161">FDJ-161</option>
						<option value="REG-161">REG-161</option>


					</select> <select class="select form-control-sm" name="batchMode">
						<option value="#" disabled>Select Batch Mode</option>
						<option value="Online">Online</option>
						<option value="Offline">Offline</option>

					</select>

					<button class="btn btn-outline-primary mb-1">Search</button>
				</form>
				<marquee>
					<h1 style="color: red;">${message }</h1>
				</marquee>
			</div>

			<form name="fn">
				<table class="table table-hover" style="font-size: small">
					<thead>
						<tr>
							<th>ID</th>
							<th>Student Name</th>
							<th>Student Email</th>
							<th>Age</th>
							<th>Collage Name</th>
							<th>Course Name</th>
							<th>Bath No</th>
							<th>Mode</th>
							<th>Fess Recived</th>
							<th>Select</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${data}" var="s">
							<tr>
								<td>${s.studentId}</td>
								<td>${s.studentFullName}</td>
								<td>${s.studentEmail}</td>
								<td>${s.studentAge}</td>
								<td>${s.studentCollegeName}</td>
								<td>${s.studentCourse}</td>
								<td>${s.batchNumber}</td>
								<td>${s.batchMode}</td>
								<td>${s.feesPaid}</td>
								<td><input type="radio" name="id" value="${s.studentId}">
								</td>
								<td>
									<div class="btn-group btn-group-sm" role="group"
										aria-label="...">



										<button class="btn btn-outline-success" onclick="fees()">PayFees</button>
										<button class="btn btn-outline-primary" onclick="batch()">ShiftBatch</button>
										<button class="btn btn-outline-danger" onclick="remove()">Remove</button>

									</div>

								</td>

							</tr>
						</c:forEach>

					</tbody>

				</table>
			</form>
			<nav aria-label="...">
  <ul class="pagination pagination-lg">
    <li class="page-item">
      <a class="page-link" href="paging?pageNo=0" tabindex="-1">1</a>
    </li>
    <li class="page-item"><a class="page-link" href="paging?pageNo=1">2</a></li>
    <li class="page-item"><a class="page-link" href="paging?pageNo=2">3</a></li>
    <li class="page-item"><a class="page-link" href="paging?pageNo=3">4</a></li>
  </ul>
</nav>
		</section>
	</div>




</body>
</html>