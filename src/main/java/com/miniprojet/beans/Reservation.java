package com.miniprojet.beans;

public class Reservation {
    private int id_res;
    private String name;
    private String phone;
    private String Email;
    private int age;
    private String details;
    private int ticket_id;

    public Reservation(int id_res, String name, String phone, String email, int age, String details, int ticket_id) {
        this.id_res = id_res;
        this.name = name;
        this.phone = phone;
        Email = email;
        this.age = age;
        this.details = details;
        this.ticket_id = ticket_id;
    }

    public int getId_res() {
        return id_res;
    }

    public void setId_res(int id_res) {
        this.id_res = id_res;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }
}
