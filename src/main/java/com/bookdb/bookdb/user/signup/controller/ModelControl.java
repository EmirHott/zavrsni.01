package com.bookdb.bookdb.user.signup.controller;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.user.signup.model.SignUpModel;



public class ModelControl {

    private final UserServiceLocal userServiceLocal;
    private final SignUpModel signUpModel;

    public ModelControl(UserServiceLocal userServiceLocal, SignUpModel signUpModel) {

        this.userServiceLocal = userServiceLocal;

        this.signUpModel = signUpModel;
    }


    public boolean usernameOccupied() {
        User user = userServiceLocal.findByUsername(signUpModel.getUsername());
        return user != null;
    }

    public boolean isValidRegistrationModel() {
        return !signUpModel.getUsername().isEmpty()
                && !signUpModel.getEmail().isEmpty()
                && !signUpModel.getPassword().isEmpty();

    }

}