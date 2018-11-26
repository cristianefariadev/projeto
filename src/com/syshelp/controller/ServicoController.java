package com.syshelp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.syshelp.po.ServicoPO;
import com.syshelp.entidade.Servico;
import com.syshelp.bo.ServicoBO;

@WebServlet("/ServicoController")
public class ServicoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String SERVICO = "/servico.jsp";

	private ServicoPO po;
	private ServicoBO bo;


	public ServicoController() {
		po = new ServicoPO();
		bo = new ServicoBO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String caminho = "";
		String botao = request.getParameter("action");

		if (botao.equalsIgnoreCase("deletar")) {
			int id = Integer.parseInt(request.getParameter("id"));
			po.deletar(id);
			caminho = SERVICO;
			request.setAttribute("lista", po.listar());

		} else if (botao.equalsIgnoreCase("editar")) {
			caminho = SERVICO;
			int id = Integer.parseInt(request.getParameter("id"));
			Servico objeto = po.consultarPorId(id);
			request.setAttribute("inserir", objeto);
//			request.setAttribute("lista", po.listar());

		} else if (botao.equalsIgnoreCase("listar")) {
			caminho = SERVICO;
			request.setAttribute("lista", po.listar());
			
		} else if (botao.equalsIgnoreCase("consultar")) {
			caminho = SERVICO;
			String termoPesquisado = request.getParameter("termoPesquisado");
			request.setAttribute("lista", po.pesquisarPorTitulo(termoPesquisado));

		} else {
			caminho = SERVICO;
		}

		RequestDispatcher view = request.getRequestDispatcher(caminho);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Servico objeto = new Servico();
		objeto.setTitulo(request.getParameter("titulo"));
		objeto.setDescricao(request.getParameter("descricao"));

		String id = request.getParameter("id");
		if (id == null || id.isEmpty()) {
			bo.salvar(objeto);
		} else {
			objeto.setId(Integer.parseInt(id));
			bo.salvar(objeto);
		}

		RequestDispatcher view = request.getRequestDispatcher(SERVICO);
		request.setAttribute("lista", po.listar());
		view.forward(request, response);
	}
}
