package com.bookdb.bookdb.ejb.books.service;

import com.bookdb.bookdb.ejb.books.entity.Book;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface BookServiceLocal {
    void create(Book book);

    void edit(Book book);

    void remove(Book book);

    Book find(Object id);

    List<Book> findAll();

   List<Book> findByContainsInTitle(String title);

     Book findLastId();
}

