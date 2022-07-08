package com.bookdb.bookdb.ejb.user.notes.status.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.user.notes.status.entity.Status;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class StatusService extends AbstractService<Status> implements StatusServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public StatusService() {
        super(Status.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }
}
