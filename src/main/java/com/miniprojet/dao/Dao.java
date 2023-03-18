package com.miniprojet.dao;

import java.util.ArrayList;

public interface Dao<T> {

    Boolean save(T t);
    Boolean update(T t);
    Boolean delete(T t);
    ArrayList<T> getAll();

    T getById(int id);

}
