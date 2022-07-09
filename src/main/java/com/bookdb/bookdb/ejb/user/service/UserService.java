package com.bookdb.bookdb.ejb.user.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.privilege.entity.Privilege;
import com.bookdb.bookdb.ejb.user.privilege.service.PrivilegeServiceLocal;
import com.bookdb.bookdb.user.login.model.LogInModel;
import com.bookdb.bookdb.user.signup.model.SignUpModel;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.*;
import jakarta.security.enterprise.identitystore.Pbkdf2PasswordHash;

import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class UserService extends AbstractService<User> implements UserServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;
    @Inject
    private Pbkdf2PasswordHash pbkdf2PasswordHash;

    @Inject
    private PrivilegeServiceLocal privilegeServiceLocal;

    public UserService() {
        super(User.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public User login(LogInModel logInModel) {
        User user = null;
        try{
            user = findByUsername(logInModel.getUsername());
            if(user == null){
                return null;
            }
            String plainPassword = logInModel.getPassword();
            String hashedPassword = user.getUserPassword();
            if (!pbkdf2PasswordHash.verify(plainPassword.toCharArray(), hashedPassword)) {
                user = null;
                throw new NoResultException("Wrong password");
            }
        }catch (NonUniqueResultException | NoResultException e){
            Logger.getLogger("USERNAME QUERY").log(Level.INFO, e.getMessage());
        }
        return user;
    }
    @Override
    public User findByUsername(String username) {
        User user = null;
        try {
            Query query = entityManager.createNamedQuery("User.findByUsername")
                    .setParameter("username", username);
            user = (User) query.getSingleResult();
            return user;
        } catch (NonUniqueResultException | NoResultException e) {
            Logger.getLogger("USERNAME QUERY").log(Level.INFO, e.getMessage());
        }
       return user;
    }

    @Override
    public User findLastId() {
        User user = null;
        try{
            Query query =entityManager.createNamedQuery("User.findLast").setMaxResults(1);
            user = (User) query.getSingleResult();
        }catch(NonUniqueResultException | NoResultException e){
            Logger.getLogger("LAST ID QUERY").log(Level.INFO,e.getMessage());

        }
        return user;
    }

    @Override
    public User signUp(SignUpModel signUpModel) {
        User user = findByUsername(signUpModel.getUsername());
        if(user == null){
            user = new User();
            Privilege privilege = privilegeServiceLocal.find(Privilege.USER_PRIVILEGE);
            user.setPrivilegeId(privilege);
            user.setUsername(signUpModel.getUsername());
            user.setUserEmail(signUpModel.getEmail());
            String hashedPassword = pbkdf2PasswordHash.generate(signUpModel.getPassword().toCharArray());
            user.setUserPassword(hashedPassword);
            create(user);
        }
        return user;
    }

}
