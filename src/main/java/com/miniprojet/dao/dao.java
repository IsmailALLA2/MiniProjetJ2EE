package com.miniprojet.dao;

import java.util.ArrayList;

public interface dao <T> {

    Boolean save(T t);
    Boolean update(T t);
    Boolean delete(T t);
    ArrayList<T> getAll();

}
