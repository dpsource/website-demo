<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<h2>Prijava</h2>

<form action="LoginServlet" method="post">
    <label>Korisničko ime:</label><br>
    <input type="text" name="username" required><br><br>

    <label>Lozinka:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Prijavi se</button>
</form>

<%
    String error = request.getParameter("error");
    if (error != null) {
%>
    <p style="color:red;">Pogrešno korisničko ime ili lozinka.</p>
<%
    }
%>

<p>Nemaš račun? <a href="register.jsp">Registruj se</a></p>

</body>
</html>