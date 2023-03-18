package com.miniprojet.dao;

import com.miniprojet.beans.Matchs;
import com.miniprojet.connection.MySqlDbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MatchsDao implements Dao<Matchs> {
    private Connection cn = null;

    public MatchsDao() {
        cn = MySqlDbCon.getMySqlDbCn();
    }


    @Override
    public Boolean save(Matchs matchs) {
        String qr = "Insert into Matchs values (null,?,?,?,?)";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setDate(1,matchs.getDate());
            pr.setString(2,matchs.getPlace());
            pr.setString(3,matchs.getTeam1());
            pr.setString(4,matchs.getTeam2());
            int res = pr.executeUpdate();
            return res > 0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean update(Matchs matchs) {
        String qr = "Update Matchs set date = ?,place = ?,team1 = ?,team2 = ? where id_match = ?";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setDate(1,matchs.getDate());
            pr.setString(2,matchs.getPlace());
            pr.setString(3,matchs.getTeam1());
            pr.setString(4,matchs.getTeam2());
            pr.setInt(5,matchs.getId_match());
            int res = pr.executeUpdate();
            return res > 0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean delete(Matchs matchs) {
        String qr = "Delete from Matchs where id_match = ?";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1,matchs.getId_match());
            int res = pr.executeUpdate();
            return  res > 0;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public ArrayList<Matchs> getAll() {
        String qr = "Select * from Matchs";
        ArrayList<Matchs> matchs = new ArrayList<>();
        Matchs match;
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                match = new Matchs(
                        rs.getInt(1),
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
                matchs.add(match);
            }
            return matchs;
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public Matchs getById(int id) {
        String qr = "select * from Matchs where id_match = ?";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1,id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                return new Matchs(
                        rs.getInt(1),
                        rs.getDate(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
            }
            return null;
        }catch(Exception ex){
            return null;
        }
    }
}
