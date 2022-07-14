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

    @Override
    public List<Note> findByUserId(User user) {
       List<Note> notes = null;

       try{
           Query query = entityManager.createNamedQuery("Notes.findByUserId")
                   .setParameter("userId", user);
           notes = (List<Note>) query.getResultList();
           return notes;

       }catch (NonUniqueResultException | NoResultException e){
           Logger.getLogger("NOTES BY USERID QUERY").log(Level.INFO,e.getMessage());
       }
        return notes;
    }

    @Override
    public Note findByTitle(String noteTitle) {
        Note note = null;

        try{
            Query query = entityManager.createNamedQuery("Notes.findByTitle")
                    .setParameter("noteTitle",noteTitle);
            note = (Note) query.getSingleResult();
            return note;
        }catch (NonUniqueResultException | NoResultException e){
            Logger.getLogger("NOTE FIND BY TITLE QUERY").log(Level.INFO,e.getMessage());
        }
        return note;
    }


}

