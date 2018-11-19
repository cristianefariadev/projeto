<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Sistema de ajuda</h1>
	</div>
	<div class="container">
		<div class=" text-center cont">
			<div class="row">
				<div class="col-md-6">
					<img alt="logo" src="img/img.png">
				</div>
				<div class="col-md-6">
					<h2>Seja bem vindo ao posso ajudar, cadastre serviços e
						consulte quando precisar!</h2>
					<a class="btn btn-info btn-block href="
						ServicoController?action=listar">CONSULTAR</a> <a
						class="btn btn-primary btn-block href="
						ServicoController?action=listar">CADASTRAR</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>