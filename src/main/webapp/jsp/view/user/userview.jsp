<%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>

<div>
    <h4 style="color: red"><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></h4>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
