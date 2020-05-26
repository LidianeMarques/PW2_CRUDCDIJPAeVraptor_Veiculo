/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho7_web2_lidiane.model.dao;

import com.mycompany.trabalho7_web2_lidiane.model.entity.Veiculo;
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
public class VeiculoDao {
    
    @Inject
    EntityManager manager;
    
    /**
     * Método para adicionar veiculo
     * @param veiculo
     * @return 
     */
    public boolean add(Veiculo veiculo) {

        try {
            manager.getTransaction().begin();
            manager.persist(veiculo);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para retornar um Veiculo pelo ID.
     * @param id
     * @return 
     */
    public Veiculo buscarVeiculo(int id) {
        try {
            Veiculo veiculo = manager.find(Veiculo.class, id);
            return veiculo;

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     * Método para retornar uma lista de Veiculos.
     * @return 
     */
    public List<Veiculo> buscarVeiculos() {
        Query query = manager.createQuery("from Veiculo");
        List<Veiculo> veiculos = query.getResultList();

        //Retorna a lista de Veiculos
        return veiculos;
    }
    
    /**
     * Método para update dados veiculo
     * @param veiculo
     * @return
     */
    public boolean update(Veiculo veiculo) {
        try {
            manager.getTransaction().begin();
            manager.merge(veiculo);
            manager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    /**
     * Método para excluir um veiculo pelo ID.
     * @param id
     * @return 
     */
    public boolean deletar(int id) {
        try {
            manager.getTransaction().begin();
            Veiculo veiculo = manager.find(Veiculo.class, id);
            manager.remove(veiculo);
            manager.getTransaction().commit();
            return false;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}

