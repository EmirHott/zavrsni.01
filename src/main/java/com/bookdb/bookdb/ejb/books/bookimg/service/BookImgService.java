package com.bookdb.bookdb.ejb.books.bookimg.service;

import com.bookdb.bookdb.ejb.AbstractService;

import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

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
}
