<%-- 
    Document   : formVeiculo
    Created on : 25/05/2020, 21:58:32
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Veículo</title>
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

                <legend style="width: 230px">Cadastro de Veículos</legend>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert alert-danger" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form class="needs-validation" novalidate action="${linkTo[VeiculosController].salvar}">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <input type="hidden" name="veiculo.id" value="${veiculo.id}"/>
                            <label for="validationCustom01">Marca</label>
                            <input  type="text" class="form-control" id="validationCustom01" 
                                    name="veiculo.marca" value="${veiculo.marca}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Modelo</label>
                            <input type="text" class="form-control" id="validationCustom02" 
                                   name="veiculo.modelo" value="${veiculo.modelo}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom03">Tipo</label>
                            <input type="text" class="form-control" id="validationCustom03" 
                                   name="veiculo.tipo" value="${veiculo.tipo}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom04">Ano</label>
                            <input type="text" class="form-control" id="validationCustom04" 
                                   name="veiculo.ano" value="${veiculo.ano}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom05">Placa</label>
                            <input type="text" class="form-control" id="validationCustom05" 
                                   name="veiculo.placa" value="${veiculo.placa}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                Não pode ficar em branco!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom06">Valor da Diária</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupPrepend">R$</span>
                                </div>
                                <input type="text" class="form-control" id="validationCustom06" 
                                       name="veiculo.valorDiaria" value="${veiculo.valorDiaria}" required>
                                <div class="valid-feedback">
                                    Muito bom!
                                </div>
                                <div class="invalid-feedback">
                                    Não pode ficar em branco!
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="btn btn-success btn-block" type="submit">Salvar</button>
                    <a href="/trabalho7_web2_Lidiane/index.html"  class="btn btn-primary btn-block" 
                       role="button">Página Inicial
                    </a>

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
        </script>-->
    <!--Scripts do Bootstrap-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>
