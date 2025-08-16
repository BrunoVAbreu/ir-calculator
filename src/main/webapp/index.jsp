<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="CssCad.css" />
    <title>Login</title>
</head>
<body>
    <div class="container">
        <header>Aplicação Imposto de Renda</header>
        
        <form method="POST" action="usuarioController">
            <div class="campos">
                <div class="entrada">
                    <label for="loginId">Login: </label>
                    <input type="text" id="loginId" name="login" required><br>
                </div>
                
                <div class="entrada">
                    <label for="senhaId">Senha: </label>
                    <input type="password" id="senhaId" name="senha" required><br>
                </div>

                <div class="botaoContainer">
                    <input type="submit" class="botao" value="Entrar" name="operacao">
                </div>
            </div>
        </form>

        <c:if test="${not empty erro and erro}">
            <p>Usuário e/ou senha incorretos</p>
        </c:if>
        
        <p><a href="infoUsuario.html">Cadastre-se</a></p>
    </div>
</body>
</html>
