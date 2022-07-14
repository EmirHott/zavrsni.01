package com.bookdb.bookdb.ejb.books.author.service;

import com.bookdb.bookdb.ejb.books.author.entity.Author;


import jakarta.ejb.Local;

import java.util.List;

@Local
public interface AuthorServiceLocal {
    void create(Author author);

    void edit(Author author);

    void remove(Author author);

    Author find(Object id);

    List<Author> findAll();

    Author findLastId();
    Author findByName(String authorName);
}
