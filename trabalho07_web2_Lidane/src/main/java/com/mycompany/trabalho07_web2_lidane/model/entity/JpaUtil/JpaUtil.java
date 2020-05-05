/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho07_web2_lidane.model.entity.JpaUtil;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Lidiane
 */
/**
 * @Dependent: escopo dependente, ou seja, uma instância será criada para cada
 * objeto que precisar dessa dependência.
 */
@Dependent
public class JpaUtil {
    
    /**
     * Atributo EntityManagerFactory para criar o EntityManager
     *
     * Método para criar um EntityManagerFactory
     *
     * @return um EntityManagerFactory quando for necessário uma instância do de
     * EntityManagerFactory.
     */
    @ApplicationScoped
    @Produces
    public EntityManagerFactory factory() {
        return Persistence.createEntityManagerFactory("trabalho07_web2_Lidiane");
    }
     /* Método que cria um EntityManager: responsável por gerenciar entidades no
     * contexto de persistência. Através dos métodos do EntityManager é possível
     * persistir, pesquisar e excluir objetos do banco de dados
     *
     * @return EntityManager
     *
     * Método para criar um EntityManager
     * @param factory o CDI já sabe que, se tiver que executar esse método,
     * precisa passar os parâmetros
     * @return EntityManager quando for necessário uma instância do de
     * EntityManager na anotação @Inject.
     */
    @Produces
    public  EntityManager manager(EntityManagerFactory factory) {
        return factory.createEntityManager();
    }
    
    /**
     * Fecha a conexão
     *
     * Como o EntityManagerFactory é @ApplicationScoped, será fechado apenas uma
     * vez, quando o servidor estiver sendo parado. Já o EntityManager será
     * fechado várias vezes, sempre que alguém terminar de usá-lo.
     *
     * @param factory
     */
    public  void close(@Disposes EntityManagerFactory factory) {
        factory.close();
    }

    /**
     * O método deve será chamado quando acabarmos de usar o manager, ou seja,
     * quando a instância do manager puder ser jogada fora.Conseguimos fazer
     * isso com o callback @Disposes do CDI.
     * @param manager
     */
    public void close(@Disposes EntityManager manager) {
        manager.close();
    }
    
}
