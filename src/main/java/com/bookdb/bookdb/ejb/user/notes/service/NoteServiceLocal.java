package com.bookdb.bookdb.ejb.user.notes.service;


import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import jakarta.ejb.Local;

import java.util.List;

@Local
public interface NoteServiceLocal {
    void create(Note note);

    void edit(Note note);

    void remove(Note note);

    Note find(Object id);

    List<Note> findAll();

    Note findLastId();

    List<Note> findByUserId(Integer id);
}
