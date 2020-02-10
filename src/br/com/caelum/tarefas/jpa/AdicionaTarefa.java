package br.com.caelum.tarefas.jpa;

import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.caelum.tarefas.modelo.Tarefa;

public class AdicionaTarefa {

    public static void main(String[] args) {

        Tarefa tarefa = new Tarefa();
        tarefa.setDescricao("Estudar JPA e Hibernate");
        tarefa.setFinalizado(true);
        tarefa.setDataFinalizacao(Calendar.getInstance());

        EntityManagerFactory factory = Persistence.createEntityManagerFactory("tarefas");
        EntityManager manager = factory.createEntityManager();

        try {
        	manager.getTransaction().begin();        
            manager.persist(tarefa);
            manager.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			manager.getTransaction().rollback();
			throw e;
		}    

        System.out.println("ID da tarefa: " + tarefa.getId());

        manager.close();
    }
}
