<%-- 
    Document   : formLocacao
    Created on : 25/05/2020, 22:02:52
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Locações</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>

    <body>
        <div style="display: flex; align-items: center; justify-content: center; height: 100vh;">
            <fieldset style="padding-block-start: 0.35em; padding-inline-start: 0.75em;
                      padding-inline-end: 0.75em;
                      padding-block-end: 0.625em;border-width: 2px;
                      border-style: groove;
                      border-color: threedface;
                      border-image: initial;">

                <legend style="width: 240px">Cadastro de Locações</legend>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert alert-danger" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form class="needs-validation" novalidate action="${linkTo[LocacoesController].salvar}">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <input type="hidden" name="locacao.id" value="${locacao.id}"/>
                            <label for="validationCustom01">Cliente</label>
                            <select class="custom-select" id="validationCustom01" required
                                    name="locacao.cliente.id" value="${locacao.cliente.id}">
                                <option selected disabled value="">Escolha...</option>
                                <c:forEach items="${listaCliente}" var="cliente">
                                    <option  
                                        <c:if test="${cliente.id == locacao.cliente.id}" >selected</c:if> 
                                        value="${cliente.id}" >${cliente.nome}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Escolha uma opção!
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Veículo</label>
                            <select class="custom-select" id="validationCustom02" 
                                    name="locacao.veiculo.id" value="${locacao.veiculo.id}" required>
                                <option  value="">Escolha...</option>
                                <c:forEach items="${listaVeiculo}" var="veiculo">
                                    <option 
                                        <c:if test="${veiculo.id == locacao.veiculo.id}">selected</c:if>  
                                        value="${veiculo.id}">  ${veiculo.modelo}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Escolha uma opção!
                            </div>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom04">Data de Início</label>
                            <fmt:formatDate var="dataInicio" value="${locacao.dataInicio}" dateStyle="medium" />
                            <input type="text" class="form-control" id="validationCustom04" 
                                   OnKeyUp="mascara_data(this)" maxlength="10" placeholder="dd/mm/aaaa"
                                   pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"
                                   name="locacao.dataInicio" value="${dataInicio}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>  
                            <div class="invalid-feedback">
                                Digite a data corretamente!
                            </div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationCustom05">Data de Fim</label> 
                            <fmt:formatDate var="dataFim" value="${locacao.dataFim}"  pattern="dd/MM/yyyy" /> 
                            <input type="text" class="form-control" id="validationCustom05"
                                   OnKeyUp="mascara_data(this)" maxlength="10" placeholder="dd/mm/aaaa"
                                   pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"
                                   name="locacao.dataFim" value="${dataFim}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Digite a data corretamente!
                            </div>
                        </div>
                            
<!--                        <div class="col-md-4 mb-3">
                            <label for="validationCustom03">Quantidade de Diárias</label>
                            <input type="text" class="form-control" id="validationCustom03"
                                   name="locacao.quantDiarias" value="${locacao.quantDiarias}" required="">

                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>-->

                        <button class="btn btn-success btn-block" type="submit">Salvar</button>
                        <a href="/trabalho7_web2_Lidiane/index.html"  
                           class="btn btn-primary btn-block" role="button">Página Inicial</a>
                    </div>
                </form>
            </fieldset>
        </div>
    </body>
    <!--    <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
    
    
    -->
    <script>
        function mascara_data(elemento) {
            var data = elemento.value;
            var mydata = '';
            mydata = mydata + data;
            if (mydata.length == 2) {
                mydata = mydata + '/';
                elemento.value = mydata;
            }
            if (mydata.length == 5) {
                mydata = mydata + '/';
                elemento.value = mydata;
            }
            if (mydata.length == 10) {
                verifica_data();
            }
        }

        function verifica_data() {

            dia = (elemento.value.substring(0, 2));
            mes = (elemento.value.substring(3, 5));
            ano = (elemento.value.substring(6, 10));

            situacao = "";
            // verifica o dia valido para cada mes 
            if ((dia < 01) || (dia < 01 || dia > 30) && (mes == 04 || mes == 06 || mes == 09 || mes == 11) || dia > 31) {
                situacao = "falsa";
            }

            // verifica se o mes e valido 
            if (mes < 01 || mes > 12) {
                situacao = "falsa";
            }

            // verifica se e ano bissexto 
            if (mes == 2 && (dia < 01 || dia > 29 || (dia > 28 && (parseInt(ano / 4) != ano / 4)))) {
                situacao = "falsa";
            }

            if (elemento.value == "") {
                situacao = "falsa";
            }

            if (situacao == "falsa") {
                alert("Data inválida!");
                elemento.focus();
            }
        }

    </script>
    <!--Scripts do Bootstrap-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>
