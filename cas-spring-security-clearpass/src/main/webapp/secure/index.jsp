<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<body>
<h1>Authenticated User: <span style="color:green;"><sec:authentication property="principal.username" /></span></h1>
<h1>User's password retrieved from CAS' clearpass endpoint: <span style="color:red;"><sec:authentication property="principal.password" /></span></h1>
<br />

<p><a href="../">Home</a>
</body>
</html>