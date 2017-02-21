package ru.testtask.holt.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;



@Repository
public class HibernateDAO implements DAO {
    @Autowired
    private SessionFactory factory;

    @SuppressWarnings("unchecked")
    public <T> List<T> getAllObject(Class<T> clazz) {
        Session session = factory.getCurrentSession();
        return session.createQuery(String.format("FROM %s", clazz.getName())).list();
    }

    public List getObjectBySQLQuery(String query) {
        Session session = factory.getCurrentSession();
        return session.createSQLQuery(query).list();
    }

    public <T> void create(T obj) {
        Session session = factory.getCurrentSession();
        session.save(obj);
    }

    public <T> void update(T obj) {
        Session session = factory.getCurrentSession();
        session.update(obj);
    }


    @SuppressWarnings("unchecked")
    public <T> T getObjectById(Serializable id, Class<T> clazz) {
        Session session = factory.getCurrentSession();
        return (T) session.get(clazz, id);
    }

    public <T> void delete(Serializable id, Class<T> clazz){
        Session session = factory.getCurrentSession();
        T obj = getObjectById(id, clazz);
        session.delete(obj);
    }
}
