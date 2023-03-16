package com.miniprojet.beans;

import java.sql.Date;


public class Matchs {

    private int id_match;
    private Date date;
    private String place;
    private String team1;
    private String team2;

    public Matchs(int id_match, Date date, String place, String team1, String team2) {
        this.id_match = id_match;
        this.date = date;
        this.place = place;
        this.team1 = team1;
        this.team2 = team2;
    }

    public int getId_match() {
        return id_match;
    }

    public void setId_match(int id_match) {
        this.id_match = id_match;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTeam1() {
        return team1;
    }

    public void setTeam1(String team1) {
        this.team1 = team1;
    }

    public String getTeam2() {
        return team2;
    }

    public void setTeam2(String team2) {
        this.team2 = team2;
    }
}
