package com.bookdb.bookdb.ejb.books.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.books.entity.Book;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class BookService extends AbstractService<Book> implements BookServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public BookService() {
        super(Book.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }


    @Override
    public List<Book> findByContainsInTitle(String bookTitle) {
      List<Book> books = null;
        try {
            Query query = entityManager.createNamedQuery("Book.findContainInTitle");
            query.setParameter("bookTitle", bookTitle);
            return books;
        } catch (NonUniqueResultException | NoResultException e) {
            Logger.getLogger("BOOK TITLE QUERY").log(Level.INFO, e.getMessage());
        }
        return books;
    }

    @Override
    public Book findLastId() {
        Book book = null;
        try{
            Query query =entityManager.createNamedQuery("Book.findLast").setMaxResults(1);
            book = (Book) query.getSingleResult();
        }catch(NonUniqueResultException | NoResultException e){
            Logger.getLogger("LAST ID QUERY").log(Level.INFO,e.getMessage());

        }
        return book;
    }
}
