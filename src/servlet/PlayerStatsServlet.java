package servlet;

import util.DB;
import util.JsonUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class PlayerStatsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json; charset=UTF-8");
        String id = req.getParameter("id");
        String sql = "SELECT p.id,p.name,p.number,p.position,p.image,s.matches,s.goals,s.assists,s.yellow_cards,s.red_cards " +
                     "FROM players p LEFT JOIN stats s ON p.id=s.player_id WHERE p.id=?";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, Integer.parseInt(id));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String json = "{\"success\":true," +
                            "\"id\":" + rs.getInt("id") + "," +
                            "\"name\":\"" + JsonUtil.esc(rs.getString("name")) + "\"," +
                            "\"number\":" + rs.getInt("number") + "," +
                            "\"position\":\"" + JsonUtil.esc(rs.getString("position")) + "\"," +
                            "\"image\":\"" + JsonUtil.esc(rs.getString("image")) + "\"," +
                            "\"matches\":" + rs.getInt("matches") + "," +
                            "\"goals\":" + rs.getInt("goals") + "," +
                            "\"assists\":" + rs.getInt("assists") + "," +
                            "\"yellow_cards\":" + rs.getInt("yellow_cards") + "," +
                            "\"red_cards\":" + rs.getInt("red_cards") + "}";
                    res.getWriter().write(json);
                } else {
                    res.getWriter().write("{\"success\":false,\"message\":\"Igrac nije pronadjen.\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"success\":false,\"message\":\"Greska baze.\"}");
        }
    }
}
