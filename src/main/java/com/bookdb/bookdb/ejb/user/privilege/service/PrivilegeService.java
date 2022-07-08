package com.bookdb.bookdb.ejb.user.privilege.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.user.privilege.entity.Privilege;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class PrivilegeService extends AbstractService<Privilege> implements PrivilegeServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;


    public PrivilegeService() {
        super(Privilege.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }
}
