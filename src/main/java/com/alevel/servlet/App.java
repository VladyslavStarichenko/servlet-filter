package com.alevel.servlet;

import com.alevel.servlet.dao.TodoDao;
import com.alevel.servlet.dao.UserDao;
import com.alevel.servlet.models.Todo;
import com.alevel.servlet.models.User;

import static com.alevel.servlet.dao.UserDao.getAllUsers;

public class App {

    public static void main(String[] args) {


//        Todo newTodo = new Todo("TestFORVlad", "TestWIth USER");
//        Todo old = TodoDao.getTodo("VLad");
//        System.out.println(old.getId());
//        TodoDao.updateTodo(old,newTodo);
////
////        todo.setUserId(UserDao.getUser("goldsilver14"));
////TodoDao.createTodo(todo.getName(), todo.getCategory(), todo);
////User user = new User("vlad", "2111");
////
////UserDao.createUser(user.getName(),user);
////        System.out.println(UserDao.checkUserExisting("goldsilver13"));
//
////        System.out.println(UserDao.checkUserExisting("vlad"));
////        System.out.println(getAllUsers());
////
////        System.out.println(newTodo.getName());
////        System.out.println(newTodo.getCategory());
////       TodoDao.updateTodo(old,newTodo);
        System.out.println(TodoDao.checkTodoForUserExisting("testing2", "testing2", "alevel"));

    }
}
