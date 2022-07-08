package com.bookdb.bookdb.ejb;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaQuery;

import java.util.List;

public abstract class AbstractService<E> {

    private Class<E> entityClass;
    protected abstract EntityManager getEntityManager();

    public AbstractService(Class<E> entityClass){
        this.entityClass = entityClass;
    }

    public void create(E entity){
        getEntityManager().persist(entity);
    }

    public void edit(E entity){
        getEntityManager().merge(entity);
    }

    public void remove(E entity){
        getEntityManager().remove(entity);
    }

    public E find(Object id){
        return getEntityManager().find(entityClass, id);
    }

    public List<E> findAll(){
        CriteriaQuery criteriaQuery = getEntityManager().getCriteriaBuilder().createQuery();
        criteriaQuery.select(criteriaQuery.from(entityClass));
        return getEntityManager().createQuery(criteriaQuery).getResultList();
    }

}
