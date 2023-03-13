package com.miniprojet.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleDbCon {
    private Connection cn = null;
    private OracleDbCon odc = null;

    private OracleDbCon(){
        try {
            cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:res_ticket");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public Connection getOracleDbCn(){
        if (odc == null){
            odc = new OracleDbCon();
        }
        return odc.cn;
    }
}
