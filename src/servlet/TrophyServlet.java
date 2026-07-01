package servlet;

import util.DB;
import util.JsonUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class TrophyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json; charset=UTF-8");
        String id = req.getParameter("id");
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement("SELECT * FROM trophies WHERE id=?")) {
            ps.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    res.getWriter().write("{\"success\":true,\"name\":\"" + JsonUtil.esc(rs.getString("name")) + "\",\"count\":" + rs.getInt("count") + ",\"image\":\"" + JsonUtil.esc(rs.getString("image")) + "\",\"seasons\":\"" + JsonUtil.esc(rs.getString("seasons")) + "\"}");
                } else {
                    res.getWriter().write("{\"success\":false,\"message\":\"Trofej nije pronadjen.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"success\":false,\"message\":\"Greska baze.\"}");
        }
    }
}
