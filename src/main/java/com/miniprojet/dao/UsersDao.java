package com.miniprojet.dao;

import com.miniprojet.beans.Users;
import com.miniprojet.connection.MySqlDbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsersDao implements Dao<Users> {

    private Connection cn = null;

    public UsersDao() {
        cn = MySqlDbCon.getMySqlDbCn();
    }

    @Override
    public Boolean save(Users user) {
        String qr = "Insert into Users values (null,?,?,?)";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setString(1, user.getName());
            pr.setString(2, user.getEmail());
            pr.setString(3, user.getPassword());
            int res = pr.executeUpdate();
            return res > 0;

        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Boolean update(Users user) {
        String qr = "Update Users set name = ? , email = ? , password = ? where id_user = ?";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setString(1, user.getName());
            pr.setString(2, user.getEmail());
            pr.setString(3, user.getPassword());
            pr.setInt(4, user.getId_user());
            int res = pr.executeUpdate();
            return res > 0;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Boolean delete(Users user) {
        String qr = "delete from Users where id_user = ?";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1, user.getId_user());
            int res = pr.executeUpdate();
            return res > 0;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public ArrayList<Users> getAll() {
        String qr = "select * from Users";
        ArrayList<Users> usersList = new ArrayList<>();
        Users u;
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                u = new Users(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
                usersList.add(u);
            }
            return usersList;
        } catch (Exception ex) {
            return null;
        }
    }
}
