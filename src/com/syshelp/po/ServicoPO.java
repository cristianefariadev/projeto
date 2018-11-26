package com.syshelp.po;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.syshelp.entidade.Servico;
import com.syshelp.util.ConexaoUtil;

public class ServicoPO {
	private Connection connection;

	public boolean adicionar(Servico objeto) {
		
		try {
			connection = ConexaoUtil.getConnection();
			PreparedStatement ps = connection
					.prepareStatement("insert into servico(titulo, descricao) values (?, ?)");
			
			ps.setString(1, objeto.getTitulo());
			ps.setString(2, objeto.getDescricao());
			ps.executeUpdate();
			
			ps.close();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deletar(int id) {
		try {
			connection = ConexaoUtil.getConnection();
			PreparedStatement ps = connection
					.prepareStatement("delete from servico where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();

			ps.close();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean atualizar(Servico objeto) {
		
		try {
			connection = ConexaoUtil.getConnection();
			PreparedStatement ps = connection
					.prepareStatement("update servico set titulo=?, descricao=? where id=?");
			
			ps.setString(1, objeto.getTitulo());
			ps.setString(2, objeto.getDescricao());
			ps.setInt(3, objeto.getId());
			ps.executeUpdate();
			
			ps.close();
			
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Servico> listar() {
		List<Servico> lista = new ArrayList<Servico>();
		try {
			connection = ConexaoUtil.getConnection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("select * from servico");
			
			while (rs.next()) {
				Servico objeto = new Servico();
				objeto.setId(rs.getInt("id"));
				objeto.setTitulo(rs.getString("titulo"));
				objeto.setDescricao(rs.getString("descricao"));
				lista.add(objeto);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public Servico consultarPorId(int id) {
		Servico objeto = new Servico();
		try {
			connection = ConexaoUtil.getConnection();
			PreparedStatement ps = connection.
					prepareStatement("select * from servico where id=?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				objeto.setId(rs.getInt("id"));
				objeto.setTitulo(rs.getString("titulo"));
				objeto.setDescricao(rs.getString("descricao"));
			}
			
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return new Servico();
		}
		return objeto;
	}
	
	public Servico pesquisarPorTitulo(String termoPesquisado) {
		Servico objeto = new Servico();
		try {
			connection = ConexaoUtil.getConnection();
			PreparedStatement ps = connection.
					prepareStatement("select * from servico where titulo=?");
			ps.setString(1, termoPesquisado);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				objeto.setId(rs.getInt("id"));
				objeto.setTitulo(rs.getString("titulo"));
				objeto.setDescricao(rs.getString("descricao"));
			}
			
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return new Servico();
		}
		return objeto;
	}
}
