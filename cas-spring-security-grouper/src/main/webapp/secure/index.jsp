<html>
<body>
<h1>Authenticated User</h1>
<br />

<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>

<%
    UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
%>

Authenticated Principal: <b><%=user.getUsername()%></b><br />
Granted Authorities: <b><%=SecurityContextHolder.getContext().getAuthentication().getAuthorities()%></b><br />

<%if (request.isUserInRole("ss-app:supervisor")) { %>
    <p>You are a supervisor! You can therefore see the <a href="extreme/index.jsp">extremely secure page</a>.</p>
<% } %>

<p><a href="../">Home</a>
</body>
</html>