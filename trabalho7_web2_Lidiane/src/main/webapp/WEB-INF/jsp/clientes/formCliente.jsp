<%-- 
    Document   : formCliente
    Created on : 25/05/2020, 21:53:11
    Author     : Lidiane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulário de Clientes</title>
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


                <legend style="width: 220px">Cadastro de Clientes</legend>

                <!--Validação do Vraptor com Bootstrap-->
                <c:forEach var="error" items="${errors}">
                    <div class="alert alert-danger" role="alert">
                        ${error.category} - ${error.message}<br />
                    </div>
                </c:forEach>

                <form class="needs-validation" novalidate action="${linkTo[ClientesController].salvar}">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <input type="hidden" name="cliente.id" value="${cliente.id}"/>
                            <label for="validationCustom01">Nome</label>
                            <input  type="text" class="form-control" id="validationCustom01" 
                                    name="cliente.nome" value="${cliente.nome}" required>
                            <div class="valid-feedback">
                                Muito bom!
                            </div>
                            <div class="invalid-feedback">
                                O campo nome não poder ser nulo!!
                            </div>

                        </div>

                        <div class="form-group">
                            <label>Telefone </label>
                            <input type="text" class="form-control" id="telefone"  
                                   maxlength="15" name="cliente.telefone"  value="${cliente.telefone}" 
                                   placeholder="(99) 9999-9999"  required="required" 
                                   pattern="\([0-9]{2}\) [0-9]{4,6}-[0-9]{3,4}$" />
                            <div class="invalid-feedback">
                                Digite o número corretamente!
                            </div>
                        </div>
                    </div>

                    <button class="btn btn-success btn-block" type="submit">Salvar</button>
                </form>
                <a href="/trabalho7_web2_Lidiane/index.html"  class="btn btn-primary btn-block"
                   role="button">Página Inicial</a>
            </fieldset>
        </div>
    </body>

            <script>
                // Bootstrap Example starter JavaScript for disabling form submissions if there are invalid fields
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
    
    
                /* Máscaras ER */
                function mascara(o, f) {
                    v_obj = o
                    v_fun = f
                    setTimeout("execmascara()", 1)
                }
                function execmascara() {
                    v_obj.value = v_fun(v_obj.value)
                }
                function mtel(v) {
                    v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
                    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
                    v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
                    return v;
                }
                function id(el) {
                    return document.getElementById(el);
                }
                window.onload = function () {
                    id('telefone').onkeyup = function () {
                        mascara(this, mtel);
                    }
                }
            </script>
    <!--Scripts do Bootstrap-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>
