<%@ page import="com.bookdb.bookdb.ejb.user.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.user.privilege.entity.Privilege" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<div style="margin: 20px">

    <h4>Find username :</h4>
<form class="d-flex w-50" method="post" action="UserServlet">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="finduser">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
</div>

<%
    User user = (User) request.getAttribute("findeduser");
%>
<div style="margin: 20px">
<form method="post" action="">
    <div class="row mb-3">
        <label  class="col-sm-2 col-form-label">User Id</label>
        <div class="col-sm-2">
            <input name="userid" type="text" class="form-control" value="<%= user != null ?user.getUserId():""%>" readonly>
        </div>
    </div>
    <div class="row mb-3">
        <label  class="col-sm-2 col-form-label">Username</label>
        <div class="col-sm-2">
            <input name="username" type="text" class="form-control" value="<%= user != null ?user.getUsername(): ""%>">
        </div>
    </div>
    <div class="row mb-3">
        <label  class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-2">
            <input name="email" type="text" class="form-control" value="<%=user != null?user.getUserEmail():""%>" >
        </div>
    </div>
    <fieldset class="row mb-3">

        <legend class="col-form-label col-sm-2 pt-0">Privilege</legend>

        <div class="col-sm-2">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="privilegeradio"  value="2" checked>
                <label class="form-check-label" > User </label>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="privilegeradio"  value="1" >
                <label class="form-check-label" > Admin </label>
            </div>
        </div>
    </fieldset>

            <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditUserServlet';">Edit</button>
            <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveUserServlet';">Remove</button>
</form>
</div>
</body>
</html>
