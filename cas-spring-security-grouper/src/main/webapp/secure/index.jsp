<html>
<body>
<h1>Secure Page</h1>
<p>This is a protected page. You can get to me if you've been authenticated

<%if (request.isUserInRole("ss-app:supervisor")) { %>
    <p>You are a supervisor! You can therefore see the <a href="extreme/index.jsp">extremely secure page</a>.</p>
<% } %>

<p><a href="../">Home</a>
</body>
</html>