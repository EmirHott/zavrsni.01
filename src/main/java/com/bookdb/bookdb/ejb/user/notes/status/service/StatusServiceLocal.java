package com.bookdb.bookdb.ejb.user.notes.status.service;

import com.bookdb.bookdb.ejb.user.notes.status.entity.Status;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface StatusServiceLocal {

    void create(Status status);

    void edit(Status status);

    void remove(Status status);

    Status find(Object id);

    List<Status> findAll();
}
