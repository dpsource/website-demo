package servlet;

import javax.servlet.http.*;
import java.io.IOException;

public class SessionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            resp.getWriter().write("{\"loggedIn\":false}");
            return;
        }
        String user = String.valueOf(s.getAttribute("user"));
        String role = String.valueOf(s.getAttribute("role"));
        resp.getWriter().write("{\"loggedIn\":true,\"username\":\"" + user + "\",\"role\":\"" + role + "\"}");
    }
}
