/*
 *Crie um projeto web usando CDI, JPA e Vraptor para efetuar um controle 
 *de locação de veiculo conforme diagrama a seguir. 
 *Você pode utilizar o projeto base da "Tarefa aula 02/04/20 - 
 *Mapeamento JPA com associações entre classes".
 */
package com.mycompany.trabalho07_web2_lidane.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import com.mycompany.trabalho07_web2_lidane.model.dao.ClienteDao;
import com.mycompany.trabalho07_web2_lidane.model.entity.Cliente;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Lidiane
 */
@Controller
public class ClientesController {

    @Inject
    ClienteDao clienteDao;

    public void formCliente() {
    }

    public List<Cliente> listaClientes() {

        //Retorna uma lista de Clientes do BD, usando o ClienteDao.
        return clienteDao.buscarClientes();
    }

    public void salvar(Cliente cliente, Result result) {
        //Gravar os dados no banco e depois chamar o metodo listaCliente para listar os objetos no banco

        if (cliente.getId() == null) {
            clienteDao.add(cliente);
        } else {
            clienteDao.update(cliente);
        }
        result.redirectTo(this).listaClientes();
    }
    
    public void editar(int id, Result result) {

        //Buscar o cliente no banco o registro para editar pelo id
        Cliente cliente = clienteDao.buscarCliente(id);
        //Incluir o objeto cliente no formCliente
        result.include(cliente);
        //Redirecionar para o formCliente.jsp
        result.of(this).formCliente();
    }

     public void excluir(Integer id, Result result) {

        clienteDao.deletar(id);
        result.redirectTo(this).listaClientes();
    }
}
