package com.alevel.servlet.filter.todo;

import com.alevel.servlet.dao.UserDao;
import com.alevel.servlet.models.Todo;
import com.alevel.servlet.models.User;
import com.alevel.servlet.services.TodoService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/add-todo.do")
public class AddTodoServlet extends HttpServlet {

	private TodoService todoService = new TodoService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/add-todo.jsp").forward(
				request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String newTodo = request.getParameter("todo");
		String category = request.getParameter("category");
		String username = (String) request.getSession().getAttribute("name");
		User user = UserDao.getUser(username);
		todoService.addTodo(new Todo(newTodo, category,user));
		response.sendRedirect("/list-todos.do");
	}
}
