
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="${pageContext.request.contextPath}/css/signandlogin.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="form" >
<div class="title">Welcome back</div>
    <form action="LogInServlet" method="post" class="login">
<div class="input-container ic1">
    <input name="username" id="username" class="input" type="text" placeholder=" " />
    <div class="cut"></div>
    <label for="username" class="placeholder">Username</label>
</div>
<div class="input-container ic2">
    <input name="password" id="password" class="input" type="password" placeholder=" " />
    <div class="cut"></div>
    <label for="password" class="placeholder" >Password</label>
</div>


<button type="text" class="submit">Log In</button>
    </form>
    <p class="paragraph" >Not a member? <a class="paragraph" href="${pageContext.request.contextPath}/ToSignUpServlet">Join us.</a></p>
    <p class="paragraph"> Back to <a class="paragraph" href="${pageContext.request.contextPath}/HomeDispatcherServlet">Home</a></p>

</div>





</body>
</html>
