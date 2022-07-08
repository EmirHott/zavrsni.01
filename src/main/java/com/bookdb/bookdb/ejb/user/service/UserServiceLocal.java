package com.bookdb.bookdb.ejb.user.service;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.user.login.model.LogInModel;
import com.bookdb.bookdb.user.signup.model.SignUpModel;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface UserServiceLocal {

    void create(User user);

    void edit(User user);

    void remove(User user);

    User find(Object id);

    List<User> findAll();

    User signUp(SignUpModel signUpModel);

    User login(LogInModel logInModel);

    public User findByUsername(String username);

    public User findLastId();


}
