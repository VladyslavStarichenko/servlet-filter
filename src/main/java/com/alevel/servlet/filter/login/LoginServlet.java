package com.alevel.servlet.filter.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alevel.servlet.services.TodoService;


@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {

    private final LoginService userValidationService = new LoginService();


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("name") == null ) {
            request
                    .getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(
                            request,
                            response
                    );
        } else {
            response.sendRedirect(request.getContextPath() + "/list-todos.do");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        boolean isUserValid = userValidationService.isUserValid(name, password);

        if (isUserValid) {
            request.getSession().setAttribute("name", name);
            response.sendRedirect("/list-todos.do");
        } else if (password.equals("") && name.equals("")) {
            request.setAttribute("errorMessage", "Fields can't be empty");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);
        }else if (!name.equals("") && password.equals("")) {
            request.setAttribute("name", name);
            request.setAttribute("errorMessage", "Fields can't be empty");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);

        }
    }

}
