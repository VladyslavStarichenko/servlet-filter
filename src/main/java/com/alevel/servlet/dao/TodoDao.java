package com.alevel.servlet.dao;
import com.alevel.servlet.models.Todo;
import com.alevel.servlet.models.User;
import com.alevel.servlet.utils.HibernateSessionFactoryUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;


public class TodoDao {

    private static final SessionFactory sessionFactory = HibernateSessionFactoryUtil.getSessionFactory();

    public static List<Todo> getAllTodos() {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Query<Todo> query = session.createNativeQuery(" SELECT * FROM  todo ", Todo.class);
            List<Todo> resultList = query.getResultList();
            session.getTransaction().commit();
            return resultList;
        }
    }

    public static List<Todo> getAllTodosWithID(User user) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Query<Todo> query = session.createNativeQuery(" SELECT * FROM  todo WHERE userid = ?", Todo.class);
            query.setParameter(1, user.getId());
            List<Todo> resultList = query.getResultList();
            session.getTransaction().commit();
            return resultList;
        }
    }
    public static Todo getTodo(String todoName) {
        try (Session session = sessionFactory.openSession()) {
            Query<Todo> query = session.createNativeQuery(" SELECT * FROM todo  WHERE name = ? ", Todo.class);
            query.setParameter(1, todoName);
            List<Todo> resultList = query.getResultList();
            return resultList.get(0);
        }
    }
    public static void deleteTodo(Todo todo){
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Query query = session.createQuery("DELETE FROM Todo WHERE name =: name AND category =: category");
            query.setParameter("name", todo.getName());
            query.setParameter("category", todo.getCategory());
            query.executeUpdate();
            session.getTransaction().commit();
        }
    }

    public static void updateTodo(Todo todoToUpdate, Todo newTodo) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Query query = session.createNativeQuery("UPDATE Todo SET name = ?, category = ?" +
                    " WHERE id= ?");
            query.setParameter(1, newTodo.getName());
            query.setParameter(2, newTodo.getCategory());
            query.setParameter(3, todoToUpdate.getId());
            query.executeUpdate();
            session.getTransaction().commit();
        }
    }

    public static void createTodo(String todoName,String categoryName, Todo todo) {
        if (!checkTodoExisting(todoName,categoryName)) {
            todoCreation(todo);
        }
    }

    public static void todoCreation(Todo todo) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(todo);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static boolean checkTodoExisting(String todoName, String todoCategory) {
        List<Todo> todos = getAllTodos();
        for (Todo todo : todos) {
            return todo.getName().equals(todoName) && todo.getCategory().equals(todoCategory);
        }
        return false;
    }


}
