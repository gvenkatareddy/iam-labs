<h1>Authenticated User</h1>
<br />

<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	Subject subject = SecurityUtils.getSubject();
%>

Authenticated Subject: <b><%=subject.getPrincipal()%></b><br />
Does user have this role? (Shiro Role: shiro-app:admin | Grouper group: shiro-app:admin): <b><%=subject.hasRole("shiro-app:admin")%></b><br />
