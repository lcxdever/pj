package com.blackbread.utils;

import java.io.*;
import java.sql.*;
import java.util.*;

public class LoginUtil {

	private String fileName = "/properties/login.properties";// 这里是指放在classes下，如果有包的话，前面加包名即可。例：/com/web/db.properties
	private String driver = "";
	private String jdbcurl = "";
	private String username = "";
	private String password = "";
	private String url = "";
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String registUrl=null;

	public void readProperties() throws IOException {
		Properties p = new Properties();
		InputStream in = getClass().getResourceAsStream(fileName);// 这里有人用new
		p.load(in);
		in.close();
		if (p.containsKey("driverClass")) {
			this.driver = p.getProperty("driverClass");
		}
		if (p.containsKey("jdbcUrl")) {
			this.jdbcurl = p.getProperty("jdbcUrl");
		}
		if (p.containsKey("dbUser")) {
			this.username = p.getProperty("dbUser");
		}
		if (p.containsKey("dbPassword")) {
			this.password = p.getProperty("dbPassword");
		}
		if (p.containsKey("Url")) {
			this.url = p.getProperty("Url");
		}
		if (p.containsKey("registUrl")) {
			this.registUrl = p.getProperty("registUrl");
		}
	}
	
	public Connection getConn() throws Exception {
		try {
			readProperties();
			Class.forName(this.driver);
			conn = DriverManager.getConnection(this.jdbcurl, this.username,
					this.password);
		} catch (SQLException ex) {
			System.out.print("获取连接异常");
			throw ex;
		} catch (ClassNotFoundException ex) {
			System.out.print("加载驱动出错");
			throw ex;
		} catch (IOException ex) {
			 System.out.print("文件未找到");  
			throw ex;
		}
		return conn;
	}

	public String getResult(String userName, String password) {
		try {
			conn = getConn();
			stmt = conn.createStatement();
			String sql = "select fnd_web_sec.validate_login('" + userName
					+ "', '" + password + "')  from dual";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return rs.getString(1);
			} else {
				return "N";
			}
//			return "Y";
		} catch (Exception e) {
			e.printStackTrace();
			return "N";
		} finally {
			if (this.conn != null) {
				try {
					this.conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (this.stmt != null) {
				try {
					this.stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (this.rs != null) {
				try {
					this.rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public String getUrl(String langCode, String username, String password) {
		String result = "error";
		try {
			readProperties();
			if ("Y".equals(getResult(username, password))) {
				result = this.url + "?langCode=" + langCode + "&username="
						+ username + "&password=" + password;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	public String getRegistUrl() throws IOException{
		if(this.registUrl==null){
			readProperties();
		}
		return this.registUrl;
	}
	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		LoginUtil util = new LoginUtil();
//		System.out.println(util.getUrl("EN", "S1723", "1111"));
		System.out.println("为适应风电市场的快速增长及满足客户多元化的需求，金风科技根据不同的地理气候条件，进行差异化设计，形成了".length());
	}

}
