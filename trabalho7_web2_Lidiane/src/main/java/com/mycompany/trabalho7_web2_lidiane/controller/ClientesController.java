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
import com.mycompany.trabalho7_web2_lidiane.model.entity.Cliente;
import javax.validation.constraints.NotNull;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;

/**
 *
 * @author Lidiane
 */
@Controller
public class ClientesController {

    @Inject
    ClienteDao clienteDao;

    @Inject
    Result result;

    @Inject
    Validator validator;

    public void formCliente() {
    }

    public List<Cliente> listaClientes() {

        //Retorna uma lista de Clientes do BD, usando o ClienteDao.
        return clienteDao.buscarClientes();
    }

    public void salvar(@NotNull Cliente cliente) {
        validator.validate(cliente);
        //  validator.add(new SimpleMessage("cliente.nome", "Campo Obrigatório!", Severity.WARN));

        // Em caso de erros irá redirecionar para a página de formulário
        validator.onErrorRedirectTo(this).formCliente();

        //Gravar os dados no banco e depois chamar o metodo listaCliente para listar os objetos no banco
        if (cliente.getId() == null) {
            clienteDao.add(cliente);
        } else {
            clienteDao.update(cliente);
        }
        result.redirectTo(this).listaClientes();

    }

    public void editar(int id) {

        //Buscar o cliente no banco o registro para editar pelo id
        Cliente cliente = clienteDao.buscarCliente(id);
        //Incluir o objeto cliente no formCliente
        result.include(cliente);
        //Redirecionar para o formCliente.jsp
        result.of(this).formCliente();
    }

    public void excluir(Integer id) {

        clienteDao.deletar(id);
        result.redirectTo(this).listaClientes();
    }
}

