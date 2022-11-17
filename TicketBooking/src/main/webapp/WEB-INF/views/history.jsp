<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="uheader.jsp"></jsp:include>

<div class="container">
    <div class="card shadow my-2">
        <div class="card-body">           
            <h4 class="p-2 text-center border border-dark mt-2">Application Status</h4>
            <table class="table table-bordered table-striped table-sm">
                <thead class="table-dark">
                    <tr>
                        <th>Application ID</th>
                        <th>Application Submission Date</th>       
                        <th>Status</th>
                        <th>Show Details</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders }" var="o">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.orderdate}</td>   
                    <td>${o.status}</td>  
                    <td>
                        <a href="/orderdetails/${o.id}" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i>  Details</a>                        
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>