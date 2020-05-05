/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho07_web2_lidane.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import com.mycompany.trabalho07_web2_lidane.model.dao.VeiculoDao;
import com.mycompany.trabalho07_web2_lidane.model.entity.Veiculo;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Lidiane
 */
@Controller
public class VeiculoController {
    
    @Inject
    VeiculoDao veiculoDao;
    
     public void formVeiculo() {
    }

    public List<Veiculo> listaVeiculos() {

        //Retorna uma lista de Veiculos do BD, usando o VeiculoDao.
        return veiculoDao.buscarVeiculos();
    }
    
     public void salvar(Veiculo veiculo, Result result) {
        //Gravar os dados no banco e depois chamar o metodo listaVeiculos para listar os objetos no banco.

        if (veiculo.getId() == null) {
            veiculoDao.add(veiculo);
        } else {
            veiculoDao.update(veiculo);
        }
        result.redirectTo(this).listaVeiculos();
    }
     
     public void editar(int id, Result result) {

        //Buscar o veiculo no banco o registro para editar pelo id
        Veiculo veiculo = veiculoDao.buscarVeiculo(id);
        //Incluir o objeto veiculo no formVeiculo
        result.include(veiculo);
        //Redirecionar para o formVeiculo.jsp
        result.of(this).formVeiculo();
    }
     
     public void excluir(Integer id, Result result) {

        veiculoDao.deletar(id);
        result.redirectTo(this).listaVeiculos();
    }
}
