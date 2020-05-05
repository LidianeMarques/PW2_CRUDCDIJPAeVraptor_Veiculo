<%-- 
    Document   : formVeiculo
    Created on : 04/05/2020, 20:06:49
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Veiculo</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>
        <div style="display: flex; align-items: center; justify-content: center; height: 100vh;">
            <fieldset style="padding-block-start: 0.35em; padding-inline-start: 0.75em;
                      padding-inline-end: 0.75em;
                      padding-block-end: 0.625em;border-width: 2px;
                      border-style: groove;
                      border-color: threedface;
                      border-image: initial;">

                <legend style="width: 220px">Cadastro de Veículos</legend>

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
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom02">Modelo</label>
                            <input type="text" class="form-control" id="validationCustom02" 
                                   name="veiculo.modelo" value="${veiculo.modelo}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom03">Tipo</label>
                            <input type="text" class="form-control" id="validationCustom03" 
                                   name="veiculo.tipo" value="${veiculo.tipo}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom04">Ano</label>
                            <input type="text" class="form-control" id="validationCustom04" 
                                   name="veiculo.ano" value="${veiculo.ano}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom05">Placa</label>
                            <input type="text" class="form-control" id="validationCustom05" 
                                   name="veiculo.placa" value="${veiculo.placa}" required>
                            <div class="valid-feedback">
                                Muito bom!
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
                            </div>
                        </div>

                        <button class="btn btn-success btn-block" type="submit">Salvar</button>
                    </div>
                </form>
                <a href="/trabalho07_web2_Lidane/index.html"  class="btn btn-primary btn-block" role="button">Pagina Inicial</a>
            </fieldset>
        </div>

    </body>
</html>
