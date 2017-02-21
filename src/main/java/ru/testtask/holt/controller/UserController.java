package ru.testtask.holt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.testtask.holt.model.User;
import ru.testtask.holt.service.UserService;



import java.util.ArrayList;


import java.util.List;


@Controller
public class UserController {
    private static final int MAX_COUNT_USERS_PER_PAGE = 5;
    @Autowired
    private UserService service;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getPageAllUsers(@RequestParam(required = false) Integer page) {
        List<User> users = new ArrayList<User>(service.allUsers());
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(MAX_COUNT_USERS_PER_PAGE);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("UsersView");
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
            pagedListHolder.setPage(0);
        } else {
            pagedListHolder.setPage(page - 1);
        }
        modelAndView.addObject("page", page);
        modelAndView.addObject("users", pagedListHolder.getPageList());

        return modelAndView;
    }



    @RequestMapping(value = "/findUsers")
    public ModelAndView findUsers(@RequestParam(value = "name", required = false) String name) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("FindUsers");
        modelAndView.addObject("page", 1);
        if (name == null) {
            modelAndView.addObject("findUsers", new ArrayList<>());
            return modelAndView; }

        modelAndView.addObject("findUsers", service.findUser(name));
        return modelAndView;
    }

    @RequestMapping(value = "/CreateUser")
    public ModelAndView createUser() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("CreateUser");
        return modelAndView;
    }

    @RequestMapping(value = "/SaveUser")
    public ModelAndView saveUser(@RequestParam("id") int id, @RequestParam("name")
    String name, @RequestParam("age") int age, @RequestParam("isAdmin") boolean isAdmin, @RequestParam("page") int page) {
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(id);
        if (id == 0) {
            service.addUser(new User(name, age, isAdmin));
        } else {
            User user = service.getUserById(id);
            user.setName(name);
            user.setAge(age);
            user.setIsAdmin(isAdmin);
            service.editUser(user);
        }
        modelAndView.addObject("page", page);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @RequestMapping(value = "/EditUser")
    public ModelAndView editUser(@RequestParam("id") int id, @RequestParam("page") int page) {
        ModelAndView modelAndView = new ModelAndView();
        User user = service.getUserById(id);
        modelAndView.addObject("user", user);
        modelAndView.addObject("page", page);
        modelAndView.setViewName("EditUser");
        return modelAndView;
    }

    @RequestMapping(value = "/DeleteUser")
    public ModelAndView deleteUser(@RequestParam("id") int id, @RequestParam("page") int page) {
        ModelAndView modelAndView = new ModelAndView();
        service.deleteUser(id);
        modelAndView.addObject("page", page);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

}
