<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Status do Cancelamento</title>
    <link rel="stylesheet" href="./css/css.css">
    <link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
</head>
<body>
    <div id="div1">
        <div id="div2">
            <h3 id="titulo">Status da operação</h3>

            <c:choose>
                <c:when test="${status}">
                    <p><i><span style="color: green">${msgConta}</span></i></p>
                </c:when>
                <c:otherwise>
                    <p><i><span style="color: red">ERRO! - ${msgConta}</span></i></p>
                </c:otherwise>
            </c:choose>

            <p><a href="./index.jsp" class="link">Voltar para o menu principal</a></p>
        </div>
    </div>
</body>
</html>
