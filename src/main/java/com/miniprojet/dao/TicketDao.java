package com.miniprojet.dao;

import com.miniprojet.beans.Ticket;
import com.miniprojet.connection.MySqlDbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TicketDao implements Dao<Ticket> {
    private Connection cn = null;

    public TicketDao() {
        cn = MySqlDbCon.getMySqlDbCn();
    }
    @Override
    public Boolean save(Ticket ticket) {
        String qr = "Insert into Ticket values (null,?,?,?)";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1, ticket.getMatch_id());
            pr.setInt(2, ticket.getQte());
            pr.setString(3, ticket.getType());
            int res = pr.executeUpdate();
            return res > 0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean update(Ticket ticket) {
        String qr = "update Ticket set match_id = ? , qte = ? , type = ? where id_ticket = ? ";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1, ticket.getMatch_id());
            pr.setInt(2, ticket.getQte());
            pr.setString(3, ticket.getType());
            pr.setInt(4,ticket.getId_ticket());
            int res = pr.executeUpdate();
            return res > 0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public Boolean delete(Ticket ticket) {
        String qr = "Delete from Ticket where id_ticket = ? ";
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            pr.setInt(1,ticket.getId_ticket());
            int res = pr.executeUpdate();
            return res > 0;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public ArrayList<Ticket> getAll() {
        String qr = "Select * from Ticket";
        ArrayList<Ticket> tickets = new ArrayList<>();
        Ticket ticket;
        try{
            PreparedStatement pr = cn.prepareStatement(qr);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                ticket = new Ticket(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)
                );
                tickets.add(ticket);
            }
            return tickets;
        }catch (Exception ex){
            return null;
        }
    }
}
