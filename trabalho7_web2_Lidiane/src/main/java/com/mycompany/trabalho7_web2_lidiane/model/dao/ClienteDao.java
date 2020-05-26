/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho7_web2_lidiane.model.dao;

import com.mycompany.trabalho7_web2_lidiane.model.entity.Cliente;
import java.util.List;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Lidiane
 */
@Dependent
public class ClienteDao {

    @Inject
    EntityManager manager;
    
    /**
     * Método para adicionar cliente
     * @param cliente
     * @return 
     */
    public boolean add(Cliente cliente) {

        try {
            manager.getTransaction().begin();
            manager.persist(cliente);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para retornar um cliente pelo ID.
     * @param id
     * @return 
     */
    public Cliente buscarCliente(int id) {
        try {
            Cliente cliente = manager.find(Cliente.class, id);
            return cliente;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     * Método para retornar uma lista de clientes.
     * @return 
     */
    public List<Cliente> buscarClientes() {
        Query query = manager.createQuery("from Cliente");
        List<Cliente> clientes = query.getResultList();

        //Retorna a lista de Clientes
        return clientes;
    }
         
    /**
     * Método para update dados cliente
     * @param cliente
     * @return
     */
    public boolean update(Cliente cliente) {
        try {
            manager.getTransaction().begin();
            manager.merge(cliente);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para excluir um cliente pelo ID.
     * @param id
     * @return 
     */
    public boolean deletar(int id) {
        try {
            manager.getTransaction().begin();
            Cliente cliente = manager.find(Cliente.class, id);
            manager.remove(cliente);
            manager.getTransaction().commit();
            return false;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
