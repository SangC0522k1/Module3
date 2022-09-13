package com.example.simple_login;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginSevlet", value = "/login")
public class loginSevlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username =  request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        if ("admin".equals(username) && "admin".equals(password)) {
            writer.println("<h1>Welcome " + username + " to website</h1>");
        } else {
            writer.println("<h1>Login Error</h1>");
        }

        writer.println("</html>");
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}