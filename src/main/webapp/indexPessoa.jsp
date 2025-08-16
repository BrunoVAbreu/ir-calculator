<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="jakarta.servlet.http.Cookie" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/css.css">
    <link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
    <title>Calcular Imposto de Renda</title>
</head>
<body>
    <div id="div1">        
        <div id="div2">
            <h1>Bem-vindo, ${usuario.nome}!</h1>
            
            <div class="calcularImposto">
                <h3 class="tituloImposto">Calcular Imposto de Renda</h3>
                <p> <a href="cadastrar.html"> <input type="button" class="botao" value="Cadastrar pessoa"> </a> </p>
                <p> <a href="pessoaController?operacao=listar"> <input type="button" class="botao" value="Listar pessoa"> </a> </p>
            </div>

            <div class="atvRecenteDiv">
                <h2>Atividade Recente</h2>

                <%
                    Cookie[] cookies = request.getCookies();
                    String pessoaNome = null;
                    String pessoaCpf = null;
                    String pessoaRenda = null;

                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("pessoaNome")) {
                                pessoaNome = cookie.getValue();
                            } else if (cookie.getName().equals("pessoaCpf")) {
                                pessoaCpf = cookie.getValue();
                            } else if (cookie.getName().equals("pessoaRenda")) {
                                pessoaRenda = cookie.getValue();
                            }
                        }
                    }

                    request.setAttribute("pessoaNome", pessoaNome);
                    request.setAttribute("pessoaCpf", pessoaCpf);
                    request.setAttribute("pessoaRenda", pessoaRenda);
                %>

                <c:if test="${not empty pessoaNome and not empty pessoaCpf and not empty pessoaRenda}">
                    <p class="atvRecente">Nome: ${pessoaNome}</p>
                    <p class="atvRecente">CPF: ${pessoaCpf}</p>
                    <p class="atvRecente">Renda: ${pessoaRenda}</p>
                </c:if>

                <c:if test="${empty pessoaNome or empty pessoaCpf or empty pessoaRenda}">
                    <p>Nenhuma atividade recente encontrada.</p>
                </c:if>
            </div>

            <div class="acaoCancelar">
                <h2>Ações da Conta</h2>
                <p> 
                    <a href="usuarioController?operacao=Sair"> 
                        <input type="button" class="botao" value="Sair"> 
                    </a> 
                </p>
                <p> 
                    <a href="usuarioController?operacao=Cancelar&login=${usuario.login}"> 
                        <input type="button" class="botao" value="Cancelar conta"> 
                    </a> 
                </p>
            </div>
        </div>

    </div> 
</body>
</html>