package br.com.caelum.tarefas.controller;

// import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefasController {
	
	// @Autowired
	private JdbcTarefaDao dao;
	
	@Autowired // @Inject
	public TarefasController(JdbcTarefaDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		if(result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}
		// JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		// JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.remove(tarefa);
		// return "redirect:listaTarefas"; // redirecionamento no lado do cliente
		return "forward:listaTarefas"; // redirecionamento no lado do servidor
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		// JdbcTarefaDao dao = new JdbcTarefaDao();
		model.addAttribute("tarefas", dao.lista());
		return "tarefa/lista";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
		// JdbcTarefaDao dao = new JdbcTarefaDao();
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {
		// JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.altera(tarefa);
		// return "redirect:listaTarefas"; // redirecionamento no lado do cliente
		return "forward:listaTarefas"; // redirecionamento no lado do servidor
	}
	
	@ResponseBody
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
		// JdbcTarefaDao dao = new JdbcTarefaDao();
	    dao.finaliza(id);
	    model.addAttribute("tarefa", dao.buscaPorId(id));
	    return "tarefa/finalizada";
	}
}
