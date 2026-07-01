package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import util.JsonUtil;

public class AuthStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json; charset=UTF-8");
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            res.getWriter().write("{\"logged\":false,\"role\":\"\",\"user\":\"\"}");
            return;
        }
        String user = String.valueOf(s.getAttribute("user"));
        String role = String.valueOf(s.getAttribute("role"));
        res.getWriter().write("{\"logged\":true,\"role\":\"" + JsonUtil.esc(role) + "\",\"user\":\"" + JsonUtil.esc(user) + "\"}");
    }
}
