package com.fxb.breakfast.util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DbResourceManager {
   private static final String JDBC_URL="jdbc:mysql://lefteye.cn:3306/breakfast?characterEncoding=utf8";
   private static final String JDBC_DRV="com.mysql.jdbc.Driver";
   private static final String JDBC_USER="admin";
   private static final String JDBC_PWD="yadong";
   private DbResourceManager() {
		throw new AssertionError();
	}
   private static Driver driver = null;
   private static Properties info = new Properties();
  
   public static Connection getConnection(){    
       Connection conn = null;    
       try {     
			Class.forName(JDBC_DRV);
           //2.取得连接数据库    
           conn = DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PWD);    
       } catch (SQLException e) {    
           e.printStackTrace();    
       } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}     
       return conn;    
    }    

}
