<%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

  <title></title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background: lightblue">
  <div class="container-fluid">
    <a class="navbar-brand">BookDB</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/ToViewServlet">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#aboutus">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#contacts">Contacts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/BookServlet">Books</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="${pageContext.request.contextPath}/NoteServlet">Notes</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-link">
          <a href="${pageContext.request.contextPath}/LogOutServlet" style="margin-right: 20px">Logout</a>
        </li>
      </ul>
      </span>
      <form class="d-flex" method="post" action="SearchServlet" name="search">
       <div>
        <input name="search" class="form-control me-2 w-40" type="search" placeholder="<%=request.getAttribute("message")==null?"Search":request.getAttribute("message")%>" aria-label="Search">
       </div>
         <button class="btn btn-outline-primary" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

</body>
</html>
