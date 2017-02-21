package ru.testtask.holt.DAO;

import java.io.Serializable;
import java.util.List;


public interface DAO {
    <T> List<T> getAllObject(Class<T> clazz);
    List getObjectBySQLQuery(String query);
    <T> void create(T obj);
    <T> void update(T obj);
    <T> T getObjectById(Serializable id, Class<T> clazz);
    <T> void delete(Serializable id, Class<T> clazz);
}
