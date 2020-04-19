<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Review Payment - Online Bookstore</title>
   <link rel="stylesheet" href="css/style.css" >
</head>
<body>
    <jsp:directive.include file="header.jsp"/>
    
    <div align="center">
        <h3><i>Please carefully review the following information before making payment</i></h3>
        <h2>Payer Information</h2>
        <table>
            <tr>
                <td><b>First Name:</b></td>
                <td>${payer.firstName}</td>
            </tr>
            <tr>
                <td><b>Last Name:</b></td>
                <td>${payer.lastName}</td>
            </tr>
            <tr>
                <td><b>E-mail:</b></td>
                <td>${payer.email}</td>
            </tr>
        </table>
        <h2>Recipient Information:</h2>
        <table>
            <tr>
                <td><b>Recipient Name:</b></td>
                <td>${recipient.recipientName}</td>
            </tr>
            <tr>
                <td><b>Address Line 1:</b></td>
                <td>${recipient.line1}</td>
            </tr>
            <tr>
                <td><b>Address Line 2:</b></td>
                <td>${recipient.line2}</td>
            </tr>
            <tr>
                <td><b>City:</b></td>
                <td>${recipient.city}</td>
            </tr>
            <tr>
                <td><b>State:</b></td>
                <td>${recipient.state}</td>
            </tr>
            <tr>
                <td><b>Country Code:</b></td>
                <td>${recipient.countryCode}</td>
            </tr>
            <tr>
                <td><b>Postal Code:</b></td>
                <td>${recipient.postalCode}</td>
            </tr>
        </table>
        <h2>Transaction Details:</h2>
        <table>
            <tr>
                <td><b>Description:</b></td>
                <td>${transaction.description}</td>
            </tr>
            <tr>
                <td colspan="2"><b>Item List:</b></td>
            </tr>
            <tr>
                <td colspan="2">
                <table border="1">
                     <tr>
                         <th>No.</th>
                         <th>Name</th>
                         <th>Quantity</th>
                         <th>Price</th>
                         <th>Subtotal</th>
                     </tr>
                     <c:forEach items="${transaction.itemList.items}" var="item" varStatus="var">
                     <tr>
                         <td>${var.index + 1}</td>
                         <td>${item.name}</td>
                         <td>${item.quantity}</td>
                         <td><fmt:formatNumber value="${item.price}" type="currency" /></td>
                         <td><fmt:formatNumer value="${item.price * item.quantity}" type="currency" /></td>
                     </tr>
                     </c:forEach>
                     <tr>
                          <td colspan="5" align="right">
                              <p>Subtotal: <fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" /></p>
                              <p>Tax: <fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" /></p>
                              <p>Shipping Fee: <fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" /></p>
                              <p>TOTAL: <fmt:formatNumber value="${transaction.amount.total}" type="currency" /></p>
                          </td>
                     </tr>
                </table>
                </td>
            </tr>
        </table>
        <div>
           <br/>
           <form action="execute_payment" method="post">
               <input type="hidden" name="paymentId" value="${param.paymentId}"/>
               <input type="hidden" name="PayerID" value="${param.PayerID}"/>
               <input type="submit" value="Pay Now" />
           </form>
        </div>
    </div>
    <jsp:directive.include file="footer.jsp"/>
</body>
</html>