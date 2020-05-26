<%-- 
    Document   : listaClientes
    Created on : 25/05/2020, 21:55:18
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>

    <body style="text-align: center; font-family: sans-serif">

        <table class="table table-striped table-dark">
            <thead>
                <tr><th colspan="4" style=" font-size: 20px">Lista de Clientes</th></tr>
            </thead>

            <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">Telefone</th>
                    <th scope="col" colspan="2">Opções</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${clienteList}" var="cli">
                    <tr>
                        <td>${cli.nome}</td>
                        <td>${cli.telefone}</td>
                        <td> 
                            <a onclick="confirmacao('${cli.id}')" href="javascript:func()"  
                               class="btn btn-danger btn-block" role="button">Excluir
                            </a> 
                        </td>
                        <td> 
                            <a href="${linkTo[ClientesController].editar}?id=${cli.id}"  
                               class="btn btn-primary btn-block" role="button">Editar
                            </a> 
                        </td> 
                    </tr>
                </c:forEach>

                <tr>
                    <td colspan="8" style="text-align: center"> 
                        <a href="formCliente" class="btn btn-success btn-block" role="button" >Adicionar
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center">
                        <a href="/trabalho7_web2_Lidiane/index.html"  
                           class="btn btn-primary btn-block" role="button">Página Inicial
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>        
    </body>
    <!--Alerta para quando for remover um registro-->
    <script language="Javascript">
        function confirmacao(id) {
            var resposta = confirm("Deseja remover este registro?");
            if (resposta == true) {
                window.location.href = "${linkTo[ClientesController].excluir}?id=" + id;
            }
        }
    </script>
    <!--Scripts do Bootstrap-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>
