package ru.testtask.holt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.testtask.holt.DAO.DAO;
import ru.testtask.holt.DAO.HibernateDAO;
import ru.testtask.holt.model.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;



@Service
@Transactional
public class UserServiceImpl implements UserService {

    public UserServiceImpl() {
    }

    @Autowired
    private DAO dao;


    public Collection<User> allUsers(){
       return dao.getAllObject(User.class);
    }

    public Collection<User> findUser(String name){
        List<User> users = new ArrayList<User>();
        String query = String.format("SELECT * FROM test.user WHERE NAME =\'%s\'", name);
        for (Object object : dao.getObjectBySQLQuery(query)){
            Object[] objects = (Object[]) object;
            int id = (Integer) objects[0];
            String realName = (String) objects[1];
            int age = (Integer) objects[2];
            boolean isAdmin = (Boolean) objects[3];
            Date createDate = (Date) objects[4];
            users.add(new User(id, realName, age, isAdmin, createDate));
        }
        return users;
    }

    public void addUser(User user){
        dao.create(user);
    }

    public User getUserById(int id){
        return dao.getObjectById(id, User.class);
    }

    public void editUser(User user){
        dao.update(user);
    }

    public void deleteUser(int id){
        dao.delete(id, User.class);
    }
}
