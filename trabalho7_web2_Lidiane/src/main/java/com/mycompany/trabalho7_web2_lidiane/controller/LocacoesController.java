/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho7_web2_lidiane.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import com.mycompany.trabalho7_web2_lidiane.model.dao.ClienteDao;
import com.mycompany.trabalho7_web2_lidiane.model.dao.LocacaoDao;
import com.mycompany.trabalho7_web2_lidiane.model.dao.VeiculoDao;
import com.mycompany.trabalho7_web2_lidiane.model.entity.Locacao;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Lidiane
 */
@Controller
public class LocacoesController {

    @Inject
    LocacaoDao locacaoDao;
    @Inject
    ClienteDao daoCliente;
    @Inject
    VeiculoDao daoVeiculo;
    @Inject
    Result result;
    @Inject
    Validator validator;
    
    public void formLocacao() {
        List listaClientes = daoCliente.buscarClientes();
        this.result.include("listaCliente", listaClientes);

        List listaVeiculos = daoVeiculo.buscarVeiculos();
        this.result.include("listaVeiculo", listaVeiculos);
    }

    public List<Locacao> listaLocacoes() {

        //Retorna uma lista de Locacoes do BD, usando o LocacaoDao.
        return locacaoDao.buscarLocacoes();
    }

    public void salvar(Locacao locacao) {
        
        validator.validate(locacao);
        
        // Em caso de erros irá redirecionar para a página de formulário
        validator.onErrorRedirectTo(this).formLocacao();
        
//Gravar os dados no banco e depois chamar o metodo listaLocacoes para listar os objetos no banco.
        if (locacao.getId() == null) {
            locacaoDao.add(locacao);
        } else {
            locacaoDao.update(locacao);
        }
        result.redirectTo(this).listaLocacoes();
    }

    public void editar(int id) {
        List listaClientes = daoCliente.buscarClientes();
        result.include("listaCliente", listaClientes);

        List listaVeiculos = daoVeiculo.buscarVeiculos();
        result.include("listaVeiculo", listaVeiculos);
        
        //Buscar o locacao no banco o registro para editar pelo id
        Locacao locacao = locacaoDao.buscarLocacao(id);
        //Incluir o objeto locacao no formLocacao
        result.include(locacao);
        //Redirecionar para o formLocacao.jsp
        result.of(this).formLocacao();
    }

    public void excluir(Integer id) {

        locacaoDao.deletar(id);
        result.redirectTo(this).listaLocacoes();
    }
}

