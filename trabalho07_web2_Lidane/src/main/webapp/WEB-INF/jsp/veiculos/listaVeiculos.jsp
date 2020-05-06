<%-- 
    Document   : listaVeiculos
    Created on : 05/05/2020, 14:08:13
    Author     : Lidiane
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Veículos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body style="text-align: center; font-family: sans-serif">
        <table class="table table-striped table-dark">
            <thead>
                <tr><th colspan="9" style=" font-size: 20px">Lista de Veículos</th></tr>
            </thead>

            <thead>
                <tr>
                    <th scope="col">Marca</th>
                    <th scope="col">Modelo</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Ano</th>
                    <th scope="col">Placa</th>
                    <th scope="col">Valor da Diária</th>
                    <th scope="col" colspan="2">Opções</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${veiculoList}" var="veiculo">
                    <tr>
                        <td>${veiculo.marca}</td>
                        <td>${veiculo.modelo}</td>
                        <td>${veiculo.tipo}</td>
                        <td>${veiculo.ano}</td>
                        <td>${veiculo.placa}</td>
                        <td>${veiculo.valorDiaria}</td>
                        <td> 
                            <a onclick="confirmacao('${veiculo.id}')" href="javascript:func()"  
                               class="btn btn-danger btn-block" role="button">Excluir
                            </a> 
                        </td>
                        <td> 
                            <a href="${linkTo[VeiculosController].editar}?id=${veiculo.id}"  
                               class="btn btn-primary btn-block" role="button">Editar
                            </a> 
                        </td> 
                    </tr>
                </c:forEach>

                <tr>
                    <td colspan="8" style="text-align: center"> 
                        <a href="formVeiculo" class="btn btn-success btn-block" role="button" >Adicionar</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center">
                        <a href="/trabalho07_web2_Lidane/index.html"  
                           class="btn btn-primary btn-block" role="button">Página Inicial
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        <script language="Javascript">
            function confirmacao(id) {
                var resposta = confirm("Deseja remover este registro?");
                if (resposta == true) {
                    window.location.href = "${linkTo[VeiculosController].excluir}?id=" + id;
                }
            }
        </script>
    </body>
</html>
