package com.miniprojet.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlDbCon {
    private Connection cn = null;
    private static MySqlDbCon mdc = null;

    private MySqlDbCon(){
        try {


            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket_reservation","root","");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public static Connection getMySqlDbCn(){
        if (mdc == null){
            mdc = new MySqlDbCon();
        }
        return mdc.cn;
    }
}
