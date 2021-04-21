package com.alevel.servlet.filter.login;

import com.alevel.servlet.Hepler.Security;
import com.alevel.servlet.dao.UserDao;

public class LoginService {

    public boolean isUserValid(String userName, String password) {
        return UserDao.checkUserExisting(userName) &&
                UserDao.getUser(userName).getName().equals(userName) &&
                UserDao.getUser(userName).getPassword().equals(Security.hasher(password));
    }

}
