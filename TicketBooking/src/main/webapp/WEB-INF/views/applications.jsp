<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$.ajax({
    url: "http://localhost:8080/application",
    type: 'GET',
    async: false,
    success: function(response) {
    	
    	<c:forEach items="${application}" var="u">
    	 $('#table').append('<tr> <td>${u.block.stadium.id}</td> <td>${u.id}</td> <td>${u.user.fname} &nbsp; ${u.user.lname }</td> <td>${u.matches_id}</td> <td>${u.created_at}</td> <td>${u.status}</td>  <td>${u.block.stadium.stdname}</td> <td>${u.getBuyers().size()}</td></tr>');
		 </c:forEach>
    }
});

/* $("#myselector").change(function() {
	  if ($(this).data('options') === undefined) {
	    /*Taking an array of all options-2 and kind of embedding it on the select1
	    $(this).data('options', $('#myselector2 option').clone());
	  }
	  var id = $(this).val();
	  var options = $(this).data('options').filter('[value="' + id + '"]');
	  //$select2.html($options.filter('[value="' + this.value + '"]'));
	  $('#myselector2').html(options);
	  
	  var table = $('#table').DataTable();
	  table.columns().every( function () {
		    var that = this;
	  
	  }
	  $("#table tr").filter(function() {
		  	console.log($(this).text());
		  	console.log($(this).val()===id);
			$(this).toggle($(this).val()==id);
		});
	  
	});

}); */
$(document).ready(function($) {
	  //$('table').hide();
	  var selection1;
	  $('#myselector').change(function() {
	    $('table').show();
	    selection1 = $(this).val();
	    var dataset = $('#table tbody').find('tr');
	    // show all rows first
	    dataset.show();
	    // filter the rows that should be hidden
	    dataset.filter(function(index, item) {
	    	//console.log($(item).find('td:first-child').text().indexOf(selection1));
	    	//console.log("selection"+selection1)
	      return $(item).find('td:first-child').text().indexOf(selection1) === -1;
	    }).hide();
	    
	    if ($(this).data('options') === undefined) {
		    
		    $(this).data('options', $('#myselector2 option').clone());
		  }
	    	var options = $(this).data('options').filter('[value=' + selection1 + ']');
		  //$select2.html($options.filter('[value="' + this.value + '"]'));
		  $('#myselector2').html(options);
		  $('#myselector2').trigger('change'); 

		   console.log($("#myselector2 option:selected").text());
		   console.log($("#myselector2 option:selected").text());
			  $('#input').val($("#myselector2 option:selected").text());
			  });
		  $('#myselector2').change(function() {
		      $('table').show();
		      var selection = $("#myselector2 option:selected").text();
		      var dataset = $('#table tbody').find('tr');
		      // show all rows first
		      dataset.show();
		      // filter the rows that should be hidden
		      console.log($("#myselector2 option:selected").text());
		     
		      //console.log($('#myselector2 option'));
		      dataset.filter(function(index, item) {
		      	//console.log($(item).find('td:nth-child(4)').text().indexOf(selection));
		      	
		        return $(item).find('td:nth-child(4)').text().indexOf(selection) === -1;
		      }).hide();
	
		     
		    });
		  
		    
		  });
	 
	  
	  
	

  
/* var id = $(this).val();
var options = $(this).data('options').filter('[value="' + id + '"]');
//$select2.html($options.filter('[value="' + this.value + '"]'));
$('#myselector2').html(options);
 */
});

</script>
<h5 class="p-2" style="border-bottom: 2px solid green;">Applications</h5>

<div class="row">
	<div class="col-sm-12">
	
	<center>
			<form action="/application" method="post">
				<div class="form-group">
					<label>CHOOSE FROM AVAILABLE STADIUMS  </label><select
						name="stadium" class="form-control" required="required"
						id="myselector" style="width: 50%">
						<option value="">Select Stadium</option>
						<c:forEach items="${stadium}" var="stadium">
							<option value="${stadium.id}">${stadium.stdname}</option>
							<!--<option value="${stadium.id}">${stadium.id}</option>-->
						</c:forEach>
					</select> <label>CHOOSE FROM AVAILABLE MATCHES </label><select
						name="stadi" class="form-control" required="required"
						id="myselector2" style="width: 50%">
						<option value="">Select Match</option>
						<c:forEach items="${matches}" var="u">
							<option value="${u.stadium.id}">${u.id}</option>

						</c:forEach>
					</select>
				</div>
				<input type="text" name="match" id="input" style="display: none;"></input>
				<!-- <a href="/application" class="btn btn-danger btn-sm" type="submit">START
					SELLING</a> -->
				<input type="submit" value="SELL" class="btn btn-primary">
				
				</td>
			</form>
			<br>
		</center>
		<table class="table table-bordered" id="table">
			<thead>
				<tr>
					<th>Stadium ID</th>
					<th>Application Id</th>
					<th>User</th>
					<th>Match</th>
					<th>Submission Date</th>
					<th>Status</th>
					<th>Stadium Name</th>
					<th>Quantity</th>
				</tr>
			</thead>
			<tbody>
				<!--  
				<c:forEach items="${application}" var="u">
					<tr>
						<td>${u.id}</td>
						<td>${u.user.fname}${u.user.lname }</td>
						<td>${u.matches_id}</td>
						<td>${u.created_at}</td>
						<td>${u.status}</td>
						<td>${u.block.stadium.stdname}</td>
						<td>${u.getBuyers().size()}</td>
					</tr>
				</c:forEach>
				-->
			</tbody>
		</table>
		
	</div>
</div>
