package com.bookdb.bookdb.ejb.books.publisher.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class PublisherService extends AbstractService<Publisher> implements PublisherServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public PublisherService() {
        super(Publisher.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Publisher findByLastId() {
        Publisher publisher = null;
        try{
            Query query =entityManager.createNamedQuery("Publisher.findLast").setMaxResults(1);
            publisher = (Publisher) query.getSingleResult();
        }catch(NonUniqueResultException | NoResultException e){
            Logger.getLogger("LAST ID QUERY").log(Level.INFO,e.getMessage());

        }
        return publisher;
    }

}
