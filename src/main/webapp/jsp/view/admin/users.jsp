<%@ page import="com.bookdb.bookdb.ejb.user.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<jsp:include page="adminnav.jsp"></jsp:include>

<div  class="table-responsive" style="margin: 30px">
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Username</th>
        <th scope="col">Email</th>
        <th scope="col">Privilege</th>
    </tr>
    </thead>
    <%
        List<User> lista = (List<User>) request.getAttribute("lista");

        for(User user : lista){
    %>
    <tbody>

    <tr>
        <td><%=user.getUserId()%></td>
        <td><%=user.getUsername()%></td>
        <td><%=user.getUserEmail()%></td>
        <td><%=user.getPrivilegeId().getPrivilegeName()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
</div>

</body>
</html>
