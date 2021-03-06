<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title></title>
</head>
<body>
<footer class="bg-primary text-white text-center text-lg-start mt-auto">

    <div class="container p-4">
        <div class="row">
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                <h5 id="aboutus" class="text-uppercase">About us</h5>
                <p>
                    The BookDB Library provides you with access to an amazing range of online resources to explore the subjects you are passionate about.
                    We will also help you to keep track of books u read.
                </p>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 id="contacts" class="text-uppercase">Contacts</h5>

                <ul class="list-unstyled mb-0">
                    <li>
                        <a class="text-white">bookdb@gmail.com</a>
                    </li>
                    <li>
                        <a class="text-white">033/123-321</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-0">Links</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="${pageContext.request.contextPath}/ToSignUpServlet" class="text-white">Signup</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/ToLogInServlet" class="text-white">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2022 Copyright:
        <a class="text-white">bookDB.com</a>
    </div>
</footer>

</body>
</html>
