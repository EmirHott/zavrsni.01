package com.bookdb.bookdb.ejb.books.publisher.service;

import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface PublisherServiceLocal {

    void create(Publisher publisher);

    void edit(Publisher publisher);

    void remove(Publisher publisher);

    Publisher find(Object id);

    List<Publisher> findAll();

    Publisher findByLastId ();
}
