<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String role = (String) session.getAttribute("role");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("noAccess.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin panel</title>
</head>
<body>

<h1>Admin panel</h1>

<p>Dobrodošao, <%= session.getAttribute("username") %></p>

<h3>Opcije admina:</h3>

<ul>
    <li>Mijenjanje statistike igrača</li>
    <li>Mijenjanje trofeja</li>
    <li>Dodavanje godina osvajanja trofeja</li>
</ul>

<a href="logout.jsp">Odjavi se</a>

</body>
</html>