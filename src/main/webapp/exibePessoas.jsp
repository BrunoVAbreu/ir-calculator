<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./css/css.css">
        <link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
        <title>Lista de Pessoas</title>
    </head>
    <body>
        <div id="div1">
            <div id="div2">
                <h3 id="titulo">Lista de Pessoas</h3>

                <c:if test="${not empty erro}">
                    <p class="erro">${erro}</p>
                </c:if>

                <table id="tabela">
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>Idade</th>
                        <th>Renda</th>
                        <th>Dependentes</th>
                        <th>Dedução</th>
                        <th>Imposto Anterior</th>
                        <th>Ações</th>
                    </tr>

                    <c:forEach var="pessoa" items="${pessoasBanco}">
                        <tr>
                            <td>${pessoa.CPF}</td>
                            <td>${pessoa.nome}</td>
                            <td>${pessoa.idade}</td>
                            <td>${pessoa.renda}</td>
                            <td>${pessoa.dependente}</td>
                            <td>${pessoa.deducao}</td>
                            <td>${pessoa.imposto}</td>
                            <td>
                                <a href="pessoaController?operacao=remover&cpf=${pessoa.CPF}">
                                    <img src="icons/lixeira.png" height="30px" alt="Remover">
                                </a>
                                <a href="pessoaController?operacao=buscar&cpf=${pessoa.CPF}">
                                    <img src="icons/editar.png" height="30px" alt="Editar">
                                </a>
                                <a href="pessoaController?operacao=metodos&cpf=${pessoa.CPF}">
                                    <img src="icons/wallet.png" height="30px" alt="Métodos">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <p><a href="indexPessoa.jsp" class="link">Voltar para o menu principal</a></p>
            </div>
        </div>
    </body>
</html>
