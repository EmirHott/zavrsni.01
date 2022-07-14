package com.bookdb.bookdb.ejb.books.genre.service;


import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface GenreServiceLocal {

    void create(Genre genre);

    void edit(Genre genre);

    void remove(Genre genre);

    Genre find(Object id);

    List<Genre> findAll();

    Genre findLastId();

    Genre findByGenreName(String genreName);
}
