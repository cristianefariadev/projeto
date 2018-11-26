package com.syshelp.bo;

import java.util.List;

import com.syshelp.entidade.Servico;
import com.syshelp.po.ServicoPO;

public class ServicoBO {
	
	private ServicoPO po;

	public ServicoBO() {
		po = new ServicoPO();
	}

	public boolean salvar(Servico objeto) {
		if (objeto.getId() == 0) {
			return po.adicionar(objeto);
		} else {
			return po.atualizar(objeto);
		}
	}

	public boolean deletar(int id) {
		return po.deletar(id);
	}

	public List<Servico> listar() {
		return po.listar();
	}

	public Servico consultar(int id) {
		return po.consultarPorId(id);
	}
}
