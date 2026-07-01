package servlet;

import util.DB;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class AdminUpdateStatsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json; charset=UTF-8");
        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equalsIgnoreCase(String.valueOf(session.getAttribute("role")))) {
            res.getWriter().write("{\"success\":false,\"message\":\"Samo admin moze mijenjati statistiku.\"}");
            return;
        }
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(
                "UPDATE stats SET matches=?, goals=?, assists=?, yellow_cards=?, red_cards=? WHERE player_id=?")) {
            ps.setInt(1, Integer.parseInt(req.getParameter("matches")));
            ps.setInt(2, Integer.parseInt(req.getParameter("goals")));
            ps.setInt(3, Integer.parseInt(req.getParameter("assists")));
            ps.setInt(4, Integer.parseInt(req.getParameter("yellow_cards")));
            ps.setInt(5, Integer.parseInt(req.getParameter("red_cards")));
            ps.setInt(6, Integer.parseInt(req.getParameter("player_id")));
            int rows = ps.executeUpdate();
            res.getWriter().write("{\"success\":" + (rows > 0) + ",\"message\":\"Statistika sacuvana.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"success\":false,\"message\":\"Greska pri spremanju.\"}");
        }
    }
}
