package servlet;

import util.DB;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class AdminUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");
        HttpSession s = req.getSession(false);
        if (s == null || !"admin".equalsIgnoreCase(String.valueOf(s.getAttribute("role")))) {
            resp.getWriter().write("{\"success\":false,\"message\":\"Nemas admin ovlasti.\"}");
            return;
        }
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "UPDATE stats SET matches=?, goals=?, assists=?, yellow_cards=?, red_cards=? WHERE player_id=?")) {
            ps.setInt(1, Integer.parseInt(req.getParameter("matches")));
            ps.setInt(2, Integer.parseInt(req.getParameter("goals")));
            ps.setInt(3, Integer.parseInt(req.getParameter("assists")));
            ps.setInt(4, Integer.parseInt(req.getParameter("yellow_cards")));
            ps.setInt(5, Integer.parseInt(req.getParameter("red_cards")));
            ps.setInt(6, Integer.parseInt(req.getParameter("player_id")));
            int updated = ps.executeUpdate();
            if (updated == 0)
                resp.getWriter().write("{\"success\":false,\"message\":\"Igrac ne postoji.\"}");
            else
                resp.getWriter().write("{\"success\":true,\"message\":\"Statistika je sacuvana u SQL bazi.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("{\"success\":false,\"message\":\"Greska u podacima ili bazi.\"}");
        }
    }
}
