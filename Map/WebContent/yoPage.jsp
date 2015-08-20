<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%@ page import="java.sql.*"%>

	<%
		response.setContentType("text/plain");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:orcl", "hr",
					"password");
			PreparedStatement ps = con
					.prepareStatement("select equip_id,adress from address");
			ResultSet rs = ps.executeQuery();
			StringBuffer a = new StringBuffer();
			while (rs.next()) {
				a.append(rs.getString(2).trim() + ":");
			}
			System.out.println(a);
			out.println(a);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
