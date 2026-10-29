package com.eat.filter;

import com.eat.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/profile", "/orders", "/order-details", "/admin/*"})
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user");
        }
        
        if (user == null) {
            session = httpRequest.getSession(true);
            session.setAttribute("redirectAfterLogin", requestURI);
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }
        
        if (requestURI.startsWith(httpRequest.getContextPath() + "/admin")) {
            if (!user.isAdmin()) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/home?error=unauthorized");
                return;
            }
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
