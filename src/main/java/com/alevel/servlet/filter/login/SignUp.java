package com.alevel.servlet.filter.login;

import com.alevel.servlet.dao.UserDao;
import com.alevel.servlet.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/sign-up.do")
public class SignUp extends HttpServlet {


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/sign-up.jsp").forward(
                request, response);
    }

        protected void doPost(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            User user = new User(name, password);
            UserDao.createUser(name, user);
            response.sendRedirect("/login.do");
        }
    }

