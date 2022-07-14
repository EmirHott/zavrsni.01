package com.bookdb.bookdb.ejb.books.genre.service;

import com.bookdb.bookdb.ejb.AbstractService;
import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless
public class GenreService extends AbstractService<Genre> implements GenreServiceLocal {

    @PersistenceContext(unitName = "bookshopPU")
    private EntityManager entityManager;

    public GenreService() {
        super(Genre.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return entityManager;
    }

    @Override
    public Genre findLastId() {
        Genre genre = null;
        try{
            Query query =entityManager.createNamedQuery("Genres.findLast").setMaxResults(1);
            genre = (Genre) query.getSingleResult();
        }catch(NonUniqueResultException | NoResultException e){
            Logger.getLogger("LAST ID QUERY").log(Level.INFO,e.getMessage());

        }
        return genre;
    }

    @Override
    public Genre findByGenreName(String genreName) {
       Genre genre = null;

       try{
           Query query = entityManager.createNamedQuery("Genres.findByName")
                   .setParameter("genreName",genreName);
                genre = (Genre) query.getSingleResult();
           return genre;

       }catch (NonUniqueResultException | NoResultException e) {
            Logger.getLogger("GENRE BY NAME QUERY").log(Level.INFO, e.getMessage());

       }
        return genre;
    }

}
