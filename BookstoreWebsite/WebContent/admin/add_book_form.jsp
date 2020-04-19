<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book to Order</title>
</head>
<body>
    <div align="center">
        <h2>Add Book to Order ID: ${order.orderId}</h2>
        <form action="add_book_to_order" method="post">
        <table>
             <tr>
                 <td>Select a book: </td>
                 <td>
                     <select name="bookId">
                         <c:forEach items="${listBook}" var="book" varStatus="status">
                               <option value="${book.bookId}">${book.title} - ${book.author}</option>
                         </c:forEach>
                     </select>
                 </td>
             </tr>
             <tr><td>&nbsp;</td></tr>
             <tr>
                 <td>Number of Copies</td>
                 <td>
                     <select name="quantity">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                     </select>
                 </td>
             </tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
                  <td colspan="2" align="center">
                      <input type="submit" value="Add" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="button" value="Cancel" onclick="javascript: self.close();"/>
                  </td>
              </tr>
        </table>
        </form>
    </div>
</body>
</html>