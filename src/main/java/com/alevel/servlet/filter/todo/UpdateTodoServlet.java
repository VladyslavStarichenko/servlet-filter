package com.alevel.servlet.filter.todo;

import com.alevel.servlet.dao.TodoDao;
import com.alevel.servlet.models.Todo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/update-todo.do")
public class UpdateTodoServlet extends HttpServlet {
    private TodoDao todoDao = new TodoDao();
    private Todo oldTodo;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        String todo = request.getParameter("todo");
        String category = request.getParameter("category");
        request.getSession().setAttribute("todo", todo);
        request.getSession().setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/views/update-todo.jsp").forward(
                request, response);

    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        Todo newTodo = new Todo(request.getParameter("newTodo"), request.getParameter("newCategory"));
        String oldTodoName = (String) request.getSession().getAttribute("todo");
        oldTodo = TodoDao.getTodo(oldTodoName);
        todoDao.updateTodo(oldTodo, newTodo);
        request.getSession().removeAttribute("todo");
        response.sendRedirect("/list-todos.do");
    }

}
