package com.bookdb.bookdb.ejb.books.bookimg.service;


import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface BookImgServiceLocal {

    void create(BookImg bookImg);

    void edit(BookImg bookImg);

    void remove(BookImg bookImg);

    BookImg find(Object id);

    List<BookImg> findAll();
}
