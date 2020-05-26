package com.mycompany.trabalho7_web2_lidiane.model.entity;

import com.mycompany.trabalho7_web2_lidiane.model.entity.Locacao;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-05-26T02:22:39")
@StaticMetamodel(Veiculo.class)
public class Veiculo_ { 

    public static volatile SingularAttribute<Veiculo, String> marca;
    public static volatile SingularAttribute<Veiculo, String> tipo;
    public static volatile SingularAttribute<Veiculo, Integer> ano;
    public static volatile SingularAttribute<Veiculo, Double> valorDiaria;
    public static volatile SingularAttribute<Veiculo, Integer> id;
    public static volatile SingularAttribute<Veiculo, Locacao> locacao;
    public static volatile SingularAttribute<Veiculo, String> modelo;
    public static volatile SingularAttribute<Veiculo, String> placa;

}