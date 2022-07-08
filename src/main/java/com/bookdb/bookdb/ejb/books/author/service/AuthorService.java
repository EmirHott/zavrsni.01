package com.bookdb.bookdb.ejb.books.author.service;
import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.books.author.entity.Author;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless

public class AuthorService extends AbstractService<Author> implements AuthorServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public AuthorService() {
        super(Author.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Author findLastId() {
        Author author = null;
        try{
            Query query =entityManager.createNamedQuery("Author.findLast").setMaxResults(1);
            author = (Author) query.getSingleResult();
        }catch(NonUniqueResultException | NoResultException e){
            Logger.getLogger("LAST ID QUERY").log(Level.INFO,e.getMessage());

        }
        return author;
    }

}
