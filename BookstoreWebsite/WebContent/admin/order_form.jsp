<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <title>Edit Order - SUAH Bookstore Administration</title>
     <link rel="stylesheet" href="../css/style.css" >
     <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
     <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Edit Order ID: ${order.orderId}</h2>
	</div>
	
	<c:if test="${message != null}">
	<div align="center">
	    <h4 class="message">${message}</h4>
	</div>
	</c:if>
    
    <form action="update_order" method="post" id="orderForm">
	<div align="center">
		<table>
		    <h2>Order Overview:</h2>
		    <tr>
		        <td><b>Ordered By: </b></td>
		        <td>${order.customer.fullname}</td>
		    </tr>
		    <tr>
		        <td><b>Order Date: </b></td>
		        <td>${order.orderDate}</td>
		    </tr>
		     <tr>
		        <td><b>Payment Method: </b></td>
		        <td>
		            <select name="paymentMethod">
		               <option value="Cash On Delivery"<c:if test="${order.paymentMethod eq 'Cash On Delivery'}">selected='selected'</c:if>>Cash On Delivery</option>
		               <option value="paypal"<c:if test="${order.paymentMethod eq 'paypal'}">selected='selected'</c:if>>PayPal or Credit card</option>
		            </select>
		        </td>
		    </tr>
		     <tr>
		        <td><b>Order Status: </b></td>
		        <td>
		           <select name="orderStatus">
		               <option value="Processing" <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if>>Processing</option>
		               <option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if>>Shipping</option>
		               <option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>>Delivered</option>
		               <option value="Completed" <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>>Completed</option>
		               <option value="Cancelled" <c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>>Cancelled</option>
		           </select>
		        </td>
		    </tr>
		 </table>
		 <h2>Recipient Information</h2>
		 <table>
		    <tr>
		        <td><b>First Name: </b></td>
		        <td><input type="text" name="firstname" id="firstname" value="${order.firstname}" size="45"/></td>
		    </tr>
		    <tr>
		        <td><b>Last Name: </b></td>
		        <td><input type="text" name="lastname" id="lastname" value="${order.lastname}" size="45"/></td>
		    </tr>
		     <tr>
		        <td><b>Recipient Phone: </b></td>
		        <td><input type="text" name="phone" id="phone" value="${order.phone}" size="45"/></td>
		    </tr>
		     <tr>
		        <td><b>Address Line 1: </b></td>
		        <td><input type="text" name="address1" id="address1" value="${order.addressLine1}" size="45"/></td>
		    </tr>
		    <tr>
		        <td><b>Address Line 2: </b></td>
		        <td><input type="text" name="address2" id="address2" value="${order.addressLine2}" size="45"/></td>
		    </tr>
		    <tr>
		        <td><b>City: </b></td>
		        <td><input type="text" name="city" id="city" value="${order.city}" size="45"/></td>
		    </tr>
		    <tr>
		        <td><b>State: </b></td>
		        <td><input type="text" name="state" id="state" value="${order.state}" size="45"/></td>
		    </tr>
		    <tr>
		        <td><b>Zipcode: </b></td>
		        <td><input type="text" name="zipcode" id="zipcode" value="${order.zipcode}" size="45"/></td>
		    </tr>
		   <tr>
		        <td><b>Country: </b></td>
		        <td>
		           <select name="country" id="country">
				    <c:forEach items="${mapCountries}" var="country">
				       <option value="${country.value}"<c:if test="${order.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
				    </c:forEach>
		            </select>
		        </td>
		    </tr>
		</table>
	</div>
	<div align="center">
	   <h2>Ordered Books</h2>
	   <table border="1">
	       <tr>
	           <th>Index</th>
	           <th>Book Title</th>
	           <th>Author</th>
	           <th>Price</th>
	           <th>Quantity</th>
	           <th>Subtotal</th>
	           <th></th>
	       </tr>
	       <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
	       <tr>
	           <td>${status.index + 1}</td>
	           <td>${orderDetail.book.title}</td>
	           <td>${orderDetail.book.author}</td>
	           <td>
	              <input type="hidden" name="price" value="${orderDetail.book.price}"/>
	              <fmt:formatNumber value="${orderDetail.book.price}" type="currency"/>
	           </td>
	           <td>
	               <input type="hidden" name="bookId" value="${orderDetail.book.bookId}"/>
	               <input type="text" name="quantity${status.index + 1}" value="${orderDetail.quantity}" size="5" />
	           </td>
	           <td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>
	           <td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
	       </tr>
	       </c:forEach>
	       <tr>
	           <td colspan="7" align="right">
	              <p>Subtotal: <fmt:formatNumber value="${order.subtotal}" type="currency"/></p>
	              <p>Tax: <input type="text" size="5" name="tax" id="tax" value="${order.tax}" /></p>
	              <p>Shipping Fee: <input type="text" size="5" name="shippingFee" id="shippingFee" value="${order.shippingFee}"/></p>
	              <p>TOTAL:<fmt:formatNumber value="${order.total}" type="currency"/></p>
	           </td>
	       </tr>
	   </table>
	</div>
	<div align="center">
	    <br/>
	    <a href="javascript:showAddBookPopup()"><b>Add Books</b></a>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="submit" value="Save" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="Cancel" onclick="javascript:window.location.href='list_order';"/>
	</div>
</form>
	<jsp:directive.include file="footer.jsp" />
	
	<script>
	     
	   function showAddBookPopup() {
		   var width = 600;
		   var height = 250;
		   var left = (screen.width - width) / 2;
		   var top = (screen.height - height) / 2;
		   
		   window.open('add_book_form', '_blank', 
				   'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
	   }
	   
	   $(document).ready(function(){
			$("#orderForm").validate({
				rules: {
					firstname: "required",
					lastname: "required",
					phone: "required",
					address1: "required",
					address2: "required",
					city: "required",
					state: "required",
					zipcode: "required",
					country: "required"
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
			           quantity${status.index + 1}: {
			    	        required: true, number: true, min: 1
			    	   },
			       </c:forEach>
			    	   
			       shippingFee: {required: true, number: true, min: 0},
			       tax: {required: true, number: true, min: 0}
				},
				messages: {
					firstname: "Please enter firstname",
					lastname: "Please enter lastname",
					phone: "Please enter phone",
					address1: "Please enter address line 1",
					address2: "Please enter address line 2",
					city: "Please enter city",
					state: "Please enter state",
					zipcode: "Please enter zipcode",
					country: "Please select country"
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
			             quantity${status.index + 1}: {
			    	        required: "Please enter quantity",
			    	        number: "Quantity must be a number",
			    	        min: "Quantity must be greater than 0"
			    	   },
			        </c:forEach>
			    	   
			    	shippingFee: {
			    		required: "Please enter shipping fee",
			    		number: "Shipping fee must be a number",
			    		min: "Shipping fee must be equal or greater than 0"
			    	},
			    	tax: {
			    		required: "Please enter tax",
			    		number: "Tax must be a number",
			    		min: "Tax must be equal or greater than 0"
			    	}
				}
			});
			
		});
	
	</script>
</body>
</html>