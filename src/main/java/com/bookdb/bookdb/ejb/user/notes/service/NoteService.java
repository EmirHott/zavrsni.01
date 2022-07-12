package com.bookdb.bookdb.ejb.user.notes.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class NoteService extends AbstractService<Note> implements NoteServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public NoteService() {
        super(Note.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Note findLastId() {
        Note note = null;

        try {
            Query query = entityManager.createNamedQuery("Notes.findLast").setMaxResults(1);
            note = (Note) query.getSingleResult();
        } catch (NonUniqueResultException | NoResultException e) {
            Logger.getLogger("LAST ID QUERY").log(Level.INFO, e.getMessage());
        }
        return note;
    }


}

