<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.pessoaModel"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="CssCad.css" />
		<link rel="shortcut icon" type="image/x-icon" href="./icons/task.png">
		<title>Calculo de Imposto</title>
	</head>
	<body>
		<div class="container">
		
			<header>Calculo de imposto</header>
			<p>Selecione um método para realizar com a seguinte pessoa:</p>
			
			<form action="pessoaController" method="POST">
				<div class="campos">
					<div class="entrada">
						<label for="PessoaCPF">CPF: </label>
						<input type="text" value="${pessoaMetodos.CPF}" id="PessoaCPF" name="cpf" readonly required><br>
					</div>
					
					<div class="entrada">
						<label for="nome">Nome: </label>
						<input type="text" id="NomeID" value="${pessoaMetodos.nome}" name="nome" readonly required><br>
					</div>	
					
					<div class="entrada">	
							<label for="Idade">Idade: </label>
							<input type="number" step="1" value="${pessoaMetodos.idade}" id="IdadeID" readonly name="Idade" required><br>
					</div>	
					
					<div class="entrada">
						<label for="RendaBruta">Renda: </label>
						<input type="number" value="${pessoaMetodos.renda}" id="RendaID" name="RendaBruta" readonly required><br>
					</div>
						
					<div class="entrada">
						<label for="Dependentes">Dependentes: </label>
						<input type="number" step="1" value="${pessoaMetodos.dependente}" id="DependentesID" name="Dependentes" readonly required><br>
					</div>
					
					<div class="entrada">
						<label for="Deducao">Deducao: </label>
						<input type="number" value="${pessoaMetodos.deducao}" id="DeducaoID" name="Deducao" readonly required><br>
					</div>
					
					<div class="entrada">
						<label for="IRanterior">Imposto: </label>
						<input type="number" value="${pessoaMetodos.imposto}" id="ImpostoID" name="IRanterior" readonly required><br>
					</div>
					
					<div class="entrada">
						<label>Selecione a operação</label>
						<select id="metodo" name="metodo">
							<option value="selecione">Selecione</option>
							<option value="verfIsencao">Verificar isenção</option>
							<option value="calcImposto">Calcular imposto de renda</option>
							<option value="calcRestituicao">Calcular restituição</option>
						</select>
						<br><br>
					</div>	
					
					<div class="botaoContainer">
						<input type="submit" class="botao" value="Calcular" name="operacao">
					</div>
				</form>
				
				<p><a href="indexPessoa.jsp" class="link">Voltar para o menu principal</a></p>
			</div>		
	</body>
</html>
