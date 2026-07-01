package servlet;

import util.DB;
import util.HashUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String hashed = HashUtil.sha256(password == null ? "" : password);
        System.out.println("DEBUG hash: " + hashed);
        System.out.println("DEBUG username: " + username);
        System.out.println("DEBUG password: " + password);
        System.out.println("DEBUG hash: " + HashUtil.sha256(password == null ? "" : password));
        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT username, role FROM users WHERE username=? AND password=?")) {
            ps.setString(1, username);
            ps.setString(2, hashed);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = req.getSession(true);
                    session.setAttribute("user", rs.getString("username"));
                    session.setAttribute("role", rs.getString("role"));
                    res.getWriter().write("{\"success\":true,\"role\":\"" + rs.getString("role") + "\"}");
                } else {
                    res.getWriter().write("{\"success\":false,\"message\":\"Pogresan username ili password.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"success\":false,\"message\":\"Greska konekcije s bazom.\"}");
        }
        
    }
}
