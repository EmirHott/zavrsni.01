
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/signandlogin.css" rel="stylesheet" type="text/css">
    <title>Sign Up</title>
</head>
<body>
<div class="form">
    <div class="title">Welcome</div>
    <div class="subtitle">Let's create your account!</div>
    <form action="SignUpServlet" method="post" class="signup">
    <div class="input-container ic1">
        <input name="username" id="username" class="input" type="text" placeholder=" " />
        <div class="cut"></div>
        <label for="username" class="placeholder">Username</label>


    </div>
    <div class="input-container ic2">
        <input name="email" id="email" class="input" type="text" placeholder=" " />
        <div class="cut"></div>
        <label for="email" class="placeholder">Email</label>
    </div>
    <div class="input-container ic2">
        <input name="password" id="password" class="input" type="password" placeholder=" " />
        <div class="cut"></div>
        <label for="password" class="placeholder">Password</label>
        <p style="color: red"><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></p>
    </div>
    <button type="text" class="submit">Sign Up</button>
    </form>
    <p class="paragraph" >Already have an <a class="paragraph" href="${pageContext.request.contextPath}/ToLogInServlet">account?</a></p>
    <p class="paragraph"> Back to <a class="paragraph" href="${pageContext.request.contextPath}/HomeDispatcherServlet">Home</a></p>

</div>

</body>
</html>
