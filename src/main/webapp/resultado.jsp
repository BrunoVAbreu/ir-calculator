<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Resultado imposto de renda</title>
    <link rel="stylesheet" href="CssCad.css">
    <link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
</head>
<body>
    <div class="container">
        <div id="div1">
            <header>Veja o cálculo completo do seu imposto de renda</header> 
            <h3 id="titulo">Informações da pessoa</h3>

            <div id="div2">
                <c:if test="${not empty erro}">
                    <p>${erro}</p>
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
                    </tr>
                    <c:if test="${not empty pessoa}">
                        <tr>
                            <td>${pessoa.CPF}</td>
                            <td>${pessoa.nome}</td>
                            <td>${pessoa.idade}</td>
                            <td>
                                <fmt:formatNumber value="${pessoa.renda}" type="currency" currencySymbol="R$" />
                            </td>
                            <td>${pessoa.dependente}</td>
                            <td>
                                <fmt:formatNumber value="${pessoa.deducao}" type="currency" currencySymbol="R$" />
                            </td>
                            <td>
                                <fmt:formatNumber value="${pessoa.imposto}" type="currency" currencySymbol="R$" />
                            </td>
                        </tr>
                    </c:if>
                </table>
            </div>

            <div class="card">
                <br>
                <h2>Operação selecionada:</h2>
                <c:choose>
                    <c:when test="${metodo == 'verfIsencao'}">
                        <p>Verificar Isenção</p>
                    </c:when>
                    <c:when test="${metodo == 'calcImposto'}">
                        <p>Calcular imposto de renda</p>
                    </c:when>
                    <c:when test="${metodo == 'calcRestituicao'}">
                        <p>Calcular restituição de imposto</p>
                    </c:when>
                    <c:otherwise>
                        <p>Nenhuma operação selecionada</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <br>
            <h1>Resultado</h1>
            <c:choose>
                <c:when test="${metodo == 'verfIsencao'}">
                    <p>${isento}</p>
                </c:when>
                <c:when test="${metodo == 'calcImposto'}">
                    <p>Seu imposto a ser pago é: 
                        <fmt:formatNumber value="${imposto}" type="currency" currencySymbol="R$" />
                    </p>
                </c:when>
                <c:when test="${metodo == 'calcRestituicao'}">
                    <p>O valor da sua restituição é: 
                        <fmt:formatNumber value="${restituicao}" type="currency" currencySymbol="R$" />
                    </p>
                </c:when>
                <c:otherwise>
                    <p>${resultN}</p>
                </c:otherwise>
            </c:choose>

            <br><br>
            <p><a href="indexPessoa.jsp" class="link">Voltar para o menu principal</a></p>
        </div>
    </div>
</body>
</html>
