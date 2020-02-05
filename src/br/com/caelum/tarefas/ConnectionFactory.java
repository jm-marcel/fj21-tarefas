package br.com.caelum.tarefas;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver()); // Essa linha foi a diferença
			// Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/fj21?serverTimezone=UTC", "admin", "admin");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}