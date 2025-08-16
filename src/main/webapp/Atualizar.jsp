<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="CssCad.css" />
        <link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
        <title>Atualizar Dados</title>
    </head>
    <body>
        <div class="container">
            <header>Informações da Pessoa</header>
            <form action="pessoaController" method="POST">
                <div class="campos">
                    <div class="entrada">
                        <label for="PessoaCPF">CPF: </label>
                        <input type="text" value="${pessoa.CPF}" id="PessoaCPF" name="cpf" readonly required><br>
                    </div>
                    <div class="entrada">
                        <label for="nome">Nome: </label>
                        <input type="text" id="NomeID" value="${pessoa.nome}" name="nome" required><br><br>
                    </div>
                    <div class="entrada">
                        <label for="Idade">Idade: </label>
                        <input type="number" step="1" value="${pessoa.idade}" id="IdadeID" name="Idade" required><br><br>
                    </div>
                    <div class="entrada">
                        <label for="RendaBruta">Renda: </label>
                        <input type="number" value="${pessoa.renda}" id="RendaID" name="RendaBruta" required><br><br>
                    </div>
                    <div class="entrada">
                        <label for="Dependentes">Dependentes: </label>
                        <input type="number" step="1" value="${pessoa.dependente}" id="DependentesID" name="Dependentes" required><br><br>
                    </div>
                    <div class="entrada">
                        <label for="Deducao">Dedução: </label>
                        <input type="number" value="${pessoa.deducao}" id="DeducaoID" name="Deducao" required><br><br>
                    </div>
                    <div class="entrada">
                        <label for="IRanterior">Imposto: </label>
                        <input type="number" value="${pessoa.imposto}" id="ImpostoID" name="IRanterior" required><br><br>
                    </div>
                    <div class="botaoContainer">
                        <input type="submit" class="botao" value="Atualizar" name="operacao">
                    </div>
                </div>
            </form>
            <p><a href="indexPessoa.jsp" class="link">Voltar para o menu principal</a></p>
        </div>
    </body>
</html>
