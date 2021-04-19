package com.alevel.servlet.filter.todo;

import com.alevel.servlet.dao.UserDao;
import com.alevel.servlet.models.User;
import com.alevel.servlet.services.TodoService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/list-todos.do")
public class GetAllTodoServlet extends HttpServlet {

	private TodoService todoService = new TodoService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("name");
		User user = UserDao.getUser(username);
		request.setAttribute("todos", todoService.retrieveTodos(user));
		request.getRequestDispatcher("/WEB-INF/views/list-todos.jsp").forward(
				request, response);
	}
}
