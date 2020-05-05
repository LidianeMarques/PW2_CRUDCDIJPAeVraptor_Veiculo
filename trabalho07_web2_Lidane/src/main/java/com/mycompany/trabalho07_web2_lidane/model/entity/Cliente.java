/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho07_web2_lidane.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Lidiane
 */
@Entity
@Table(name = "tb_cliente")
public class Cliente implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private String telefone;

    @OneToMany(mappedBy = "cliente")
    private List<Locacao> locacoes;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the locacoes
     */
    public List<Locacao> getLocacoes() {
        return locacoes;
    }

    /**
     * @param locacoes the locacoes to set
     */
    public void setLocacoes(List<Locacao> locacoes) {
        this.locacoes = locacoes;
    }

    
}
