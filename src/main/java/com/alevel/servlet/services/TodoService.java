package com.alevel.servlet.services;

import com.alevel.servlet.dao.TodoDao;
import com.alevel.servlet.models.Todo;
import com.alevel.servlet.models.User;

import java.util.ArrayList;
import java.util.List;

public class TodoService {
	private static List<Todo> todos = new ArrayList<Todo>();
	static {
		todos.add(new Todo("Learn Web Application Development", "Study"));
		todos.add(new Todo("Learn Spring MVC", "Study"));
		todos.add(new Todo("Learn Spring Rest Services", "Study"));
	}

	public List<Todo> retrieveTodos(User user) {
		return TodoDao.getAllTodosWithID(user);
	}

	public void addTodo(Todo todo) {
		TodoDao.createTodo(todo.getName(),todo.getCategory(),todo);;
	}

	public void deleteTodo(Todo todo) {

		TodoDao.deleteTodo(todo);
	}

}
