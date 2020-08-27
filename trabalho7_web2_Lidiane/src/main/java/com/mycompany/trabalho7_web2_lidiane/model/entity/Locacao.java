/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho7_web2_lidiane.model.entity;

import ValidacaoVraptor.validacaoData;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Lidiane
 */
@Entity
@Table(name = "tb_locacao")
public class Locacao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @validacaoData
    @NotNull(message = "{obrigatorio}")
    private Date dataInicio;

    @validacaoData
    @NotNull(message = "{obrigatorio}")
    private Date dataFim;

    private int quantDiarias;

    @ManyToOne
    @JoinColumn(name = "id_cliente")
    @NotNull(message = "{obrigatorio}")
    private Cliente cliente;

    @OneToOne
    @JoinColumn(name = "id_veiculo")
    @NotNull(message = "{obrigatorio}")
    private Veiculo veiculo;

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
     * @return the dataInicio
     */
    public Date getDataInicio() {
        return dataInicio;
    }

    /**
     * @param dataInicio the dataInicio to set
     */
    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    /**
     * @return the dataFim
     */
    public Date getDataFim() {
        return dataFim;
    }

    /**
     * @param dataFim the dataFim to set
     */
    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    /**
     * @return the quantDiarias
     */
    public int getQuantDiarias() {

        if (this.dataInicio != null && this.dataFim != null && quantDiarias <= 0) {
            //Aqui estou convertendo um objeto date em LocalDate
            LocalDate data1 = this.dataInicio.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate data2 = this.dataFim.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            
            //Preciso de um objeto LocalDate para calcular os dias entre as datas.
            this.quantDiarias = (int) this.diasEntreDatas(data1, data2);
        } else {
            return 0;
        }
        return this.quantDiarias;
    }

    /**
     * @param quantDiarias the quantDiarias to set
     */
    public void setQuantDiarias(int quantDiarias) {

        if (this.dataInicio != null && this.dataFim != null && quantDiarias <= 0) {
            LocalDate data1 = this.dataInicio.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate data2 = this.dataFim.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            this.quantDiarias = (int) this.diasEntreDatas(data1, data2);
            
        } else {
            this.quantDiarias = quantDiarias;
        }

    }
    
    public long diasEntreDatas(LocalDate data1, LocalDate data2) {
        long intervalo = ChronoUnit.DAYS.between(data1, data2);
        return intervalo;
    }

    /**
     * @return the cliente
     */
    public Cliente getCliente() {
        return cliente;
    }

    /**
     * @param cliente the cliente to set
     */
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    /**
     * @return the veiculo
     */
    public Veiculo getVeiculo() {
        return veiculo;
    }

    /**
     * @param veiculo the veiculo to set
     */
    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    
}
