package servlet;

import util.DB;
import util.HashUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (username == null || username.trim().length() < 3 || password == null || password.length() < 4) {
            res.getWriter().write("{\"success\":false,\"message\":\"Username min. 3 znaka, password min. 4 znaka.\"}");
            return;
        }
        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO users(username,password,role) VALUES(?,?, 'user')")) {
            ps.setString(1, username.trim());
            ps.setString(2, HashUtil.sha256(password));
            ps.executeUpdate();
            res.getWriter().write("{\"success\":true,\"message\":\"Registracija uspjesna. Sada se prijavi.\"}");
        } catch (SQLIntegrityConstraintViolationException ex) {
            res.getWriter().write("{\"success\":false,\"message\":\"Username vec postoji.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"success\":false,\"message\":\"Greska pri registraciji.\"}");
        }
    }
}
