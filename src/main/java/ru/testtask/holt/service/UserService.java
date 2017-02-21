package ru.testtask.holt.service;

import ru.testtask.holt.model.User;

import java.util.Collection;


public interface UserService {
    Collection<User> allUsers();
    Collection<User> findUser(String name);
    void addUser(User user);
    User getUserById(int id);
    void editUser(User user);
    void deleteUser(int id);
}
