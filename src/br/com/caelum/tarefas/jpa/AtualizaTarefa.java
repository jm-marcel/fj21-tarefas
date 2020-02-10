package br.com.caelum.tarefas.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.caelum.tarefas.modelo.Tarefa;

public class AtualizaTarefa {

	public static void main(String[] args) {
		
		Tarefa tarefa = new Tarefa();
        tarefa.setId((long) 2); //esse id já existe no banco
        tarefa.setDescricao("Estudar JPA e Hibernate");
        tarefa.setFinalizado(false);
        tarefa.setDataFinalizacao(null);
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
		EntityManager manager = factory.createEntityManager();
		
		try {
        	manager.getTransaction().begin();        
            manager.merge(tarefa);
            manager.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			manager.getTransaction().rollback();
			throw e;
		}
	}
}
