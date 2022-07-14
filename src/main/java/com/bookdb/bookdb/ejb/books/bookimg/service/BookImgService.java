package com.bookdb.bookdb.ejb.books.bookimg.service;

import com.bookdb.bookdb.ejb.AbstractService;

import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class BookImgService extends AbstractService<BookImg> implements BookImgServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public BookImgService() {
        super(BookImg.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public BookImg finByName(String bookImgName) {
        BookImg bookImg =null;

        try{
            Query query = entityManager.createNamedQuery("BookImg.findByName")
                    .setParameter("bookImgName", bookImgName);
            bookImg = (BookImg) query.getSingleResult();
            return bookImg;
        }catch (NonUniqueResultException | NoResultException e){
            Logger.getLogger("BOOKIMG FIND BY NAME QUERY").log(Level.INFO,e.getMessage());
        }
        return bookImg;
    }
}
