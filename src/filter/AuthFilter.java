package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getRequestURI().substring(req.getContextPath().length());

        boolean adminPath = path.equals("/admin.html")
                || path.equals("/admin.jsp")
                || path.equals("/adminUpdate")
                || path.equals("/adminUpdateStats")
                || path.startsWith("/admin/");

        if (!adminPath) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        String role = session == null ? null : String.valueOf(session.getAttribute("role"));

        if ("admin".equalsIgnoreCase(role)) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/index.html?access=denied");
        }
    }

    public void destroy() {}
}
