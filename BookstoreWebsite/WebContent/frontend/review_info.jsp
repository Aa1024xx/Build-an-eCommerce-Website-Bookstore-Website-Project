<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Write Review - Online Bookstore</title>
   <link rel="stylesheet" href="css/style.css" >
   <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
    <jsp:directive.include file="header.jsp"/>
     <div align="center">
         <form id="reviewForm">
            <table class="normal" width="60%">
               <tr>
                   <td><h3>You already wrote a review for this book</h3></td>
                   <td>&nbsp;</td>
                   <td><h2>${loggedCustomer.fullname}</h2></td>
               </tr>
               <tr>
                   <td colspan="3"><hr/></td>
               </tr>
               <tr>
                   <td>
                       <span id="book-title">${book.title}</span><br/>
                       <img class="book-large" src="data:image/jpg;base64, ${book.base64Image}" />
                   </td>
                   <td>
                       <div id="rateYo"></div>
                       <br/>
                       <input type="text" name="headline" size="60" readonly="readonly" value="${review.headline}"/>
                       <br/>
                       <br/>
                       <textarea name="comment" rows="70" cols="10" readonly="readonly" >${review.comment}</textarea>
                   </td>
               </tr>
            </table>
         </form>
     </div>
     <jsp:directive.include file="footer.jsp"/>
     <script type="text/javascript">

     $(document).ready(function(){
    	
	     $("#rateYo").rateYo({
		    starWidth: "40px",
		    fullStar: true,
		    rating: ${review.rating},
		    readOnly: true
		    
	     });
	
});

</script>
</body>
</html>