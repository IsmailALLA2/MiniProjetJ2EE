package com.miniprojet.dao;

import com.miniprojet.beans.Matchs;
import com.miniprojet.beans.Reservation;
import com.miniprojet.connection.MySqlDbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReservationDao implements Dao<Reservation>{

    private Connection cn = null;

    public ReservationDao() {
        cn = MySqlDbCon.getMySqlDbCn();
    }
    @Override
    public Boolean save(Reservation rsv) {
        String qr = "Insert into Reservation values (null,?,?,?,?,?,?)";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setString(1,rsv.getName());
            pr.setString(2,rsv.getPhone());
            pr.setString(3,rsv.getEmail());
            pr.setInt(4,rsv.getAge());
            pr.setString(5,rsv.getDetails());
            pr.setInt(6,rsv.getTicket_id());
            int res = pr.executeUpdate();
            return res >0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean update(Reservation rsv) {
        String qr = "Update Reservation set name = ?,phone = ?,email = ?,age = ?,detais = ?,ticket_id = ? where id_res = ?";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setString(1,rsv.getName());
            pr.setString(2,rsv.getPhone());
            pr.setString(3,rsv.getEmail());
            pr.setInt(4,rsv.getAge());
            pr.setString(5,rsv.getDetails());
            pr.setInt(6,rsv.getTicket_id());
            pr.setInt(7,rsv.getId_res());
            int res = pr.executeUpdate();
            return res >0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean delete(Reservation rsv) {
        String qr = "Delete from Reservation where id_res = ?";
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1,rsv.getId_res());
            int res = pr.executeUpdate();
            return res >0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public ArrayList<Reservation> getAll() {
        String qr = "select * from ";
        ArrayList<Reservation> reservations = new ArrayList<>();
        Reservation rsv;
        try {
            PreparedStatement pr = cn.prepareStatement(qr);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                rsv = new Reservation(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
                reservations.add(rsv);
            }
            return reservations;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Reservation getById(int id) {
        String qr = "select * from Reservation where id_res = ?";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1,id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                return new Reservation(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)
                );
            }
            return null;
        }catch(Exception ex){
            return null;
        }
    }
}
