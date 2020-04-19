<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUAH BOOKS - ONLINE BOOKSTORE</title>
<link rel="stylesheet" href="/css/style.css" >
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
    <div class='center'>
         <div >
         <h2>New Books:</h2>
         <c:forEach items="${listNewBooks}" var="book">
          <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
    </div>
      <div class="next-row">
        <h2>Best-Selling Books:</h2>
         <c:forEach items="${listBestSellingBooks}" var="book">
             <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
      </div>
      <div class="next-row">
        <h2>Most-favored Books:</h2>
        <c:forEach items="${listMostFavoredBooks}" var="book">
          <jsp:directive.include file="book_group.jsp" />
       </c:forEach>
      </div>
    </div>
    <jsp:directive.include file="footer.jsp"/>
</body>
</html>