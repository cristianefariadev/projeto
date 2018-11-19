<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-left">
					<i class="fa fa-archive"></i> SERVIÇO
					<hr>
				</h3>
				<div class="panel-body">
					<form method="POST" action="ServicoController"
						name="adicionarServico">
						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<label for="id">Código:</label> <input type="number"
										readonly="readonly" class="form-control" id="id" name="id"
										value="<c:out value="${inserir.id}"/>" />
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<label for="titulo">Título:</label> <input class="form-control"
										type="text" id="titulo" name="titulo"
										value="<c:out value="${inserir.titulo}"/>" required />
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="descricao ">Descrição:</label>
									<textarea class="form-control" rows="5" id="descricao"
										name="descricao">
									<c:out value="${inserir.descricao}" />
									</textarea>
								</div>
							</div>
						</div>
						<div class="form-group">
							<button type="reset" class="btn btn-default">LIMPAR</button>
							<button type="submit" class="btn btn-primary">SALVAR</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="scroll">
				<table class="table table-striped  text-center" id="tabela">
					<thead>
						<tr id="titulo">
							<th>Id</th>
							<th>Título</th>
							<th>Descrição</th>
							<th colspan="2">Ação</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista}" var="listagem">
							<tr>
								<td><c:out value="${listagem.id}" /></td>
								<td><c:out value="${listagem.titulo}" /></td>
								<td><c:out value="${listagem.descricao}" /></td>
								<td><a class="btn btn-warning"
									href="ServicoController?action=editar&id=<c:out value="${listagem.id}"/>">Alterar</a></td>
								<td><a class="btn btn-danger"
									href="ServicoController?action=deletar&id=<c:out value="${listagem.id}"/>">Apagar</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>