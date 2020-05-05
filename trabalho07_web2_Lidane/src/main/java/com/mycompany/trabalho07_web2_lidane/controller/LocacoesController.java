/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho07_web2_lidane.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import com.mycompany.trabalho07_web2_lidane.model.dao.LocacaoDao;
import com.mycompany.trabalho07_web2_lidane.model.entity.Locacao;
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
    
    public void formLocacao() {
    }

    public List<Locacao> listaLocacoes() {

        //Retorna uma lista de Locacoes do BD, usando o LocacaoDao.
        return locacaoDao.buscarLocacoes();
    }
    
    public void salvar(Locacao locacao, Result result) {
        //Gravar os dados no banco e depois chamar o metodo listaLocacoes para listar os objetos no banco.

        if (locacao.getId() == null) {
            locacaoDao.add(locacao);
        } else {
            locacaoDao.update(locacao);
        }
        result.redirectTo(this).listaLocacoes();
    }
    
    public void editar(int id, Result result) {

        //Buscar o locacao no banco o registro para editar pelo id
        Locacao locacao = locacaoDao.buscarLocacao(id);
        //Incluir o objeto locacao no formLocacao
        result.include(locacao);
        //Redirecionar para o formLocacao.jsp
        result.of(this).formLocacao();
    }
    
     public void excluir(Integer id, Result result) {

        locacaoDao.deletar(id);
        result.redirectTo(this).listaLocacoes();
    }
}
