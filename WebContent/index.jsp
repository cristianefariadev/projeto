<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SYSHELP | Projeto Integrador</title>

<link rel="shortcut icon" href="imagem/favicon.png" type="image/png">

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Font Awesome -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">

<!-- CSS Próprio-->
<link href="css/style.css" rel="stylesheet" type="text/css">

<!-- JQuery -->
<script src="js/jquery-3.2.1.js"></script>

<!-- Bootstrap  -->
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="jumbotron text-center"><h1>Sistema de ajuda</h1></div>
	<div class="container">
		<div class=" text-center cont">
			<div class="row">
				<div class="col-md-6">
					<img alt="logo" src="img/img.png">
				</div>
				<div class="col-md-6">
					<h2>Seja bem vindo ao posso ajudar, cadastre serviços e consulte
						quando precisar!</h2>
						<a class="btn btn-info btn-block href="ServicoController?action=listar">CONSULTAR</a>
						<a class="btn btn-primary btn-block href="ServicoController?action=listar">CADASTRAR</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>