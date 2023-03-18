package com.miniprojet.beans;

public class Ticket {
    private int id_ticket;
    private int match_id ;
    private int qte;
    private String type;

    public Ticket(int match_id, int qte, String type) {
        this.match_id = match_id;
        this.qte = qte;
        this.type = type;
    }

    public Ticket(int id_ticket, int match_id, int qte, String type) {
        this.id_ticket = id_ticket;
        this.match_id = match_id;
        this.qte = qte;
        this.type = type;
    }

    public int getId_ticket() {
        return id_ticket;
    }

    public void setId_ticket(int id_ticket) {
        this.id_ticket = id_ticket;
    }

    public int getMatch_id() {
        return match_id;
    }

    public void setMatch_id(int match_id) {
        this.match_id = match_id;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
