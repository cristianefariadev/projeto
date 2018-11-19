<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<h3 class="text-left">
					<i class="fa fa-cogs"></i> SERVIÇO
					<hr>
				</h3>
			</div>
		</div>

		<div class="row">
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
								<textarea id="summernote" name="descricao">
									<c:out value="${inserir.descricao}" />
									</textarea>
							</div>
						</div>
					</div>
					<div class="form-group text-right">
						<button type="reset" class="btn btn-default">
							<i class="fa fa-eraser"></i> LIMPAR
						</button>
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-save"></i> SALVAR
						</button>
					</div>
				</form>
			</div>
		</div>
<hr>
		<div class="row">
			<div class="col-md-6">
				<a class="btn btn-info" href="ServicoController?action=listar"><i
					class="fa fa-list"></i> Mostrar Todos</a>
			</div>
			<div class="col-md-6 text-right">
				<form class="form-inline">
					<div class="form-group mx-sm-3 mb-2">
						<label for="inputPassword2" class="sr-only">Consultar</label> <input
							type="text" class="form-control" id="consutlar"
							placeholder="Pesquisar por...">
					</div>
					<button type="submit" class="btn btn-primary mb-2">
						<i class="fa fa-search"></i> Pesquisar
					</button>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="panel-body">
				<div class="scroll">
					<table class="table table-striped  text-center" id="tabela">
						<thead>
							<tr id="titulo">
								<th>Cod:</th>
								<th>Título:</th>
								<th>Descrição:</th>
								<th colspan="2">Ação</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lista}" var="listagem">
								<tr>
									<td><c:out value="${listagem.id}" /></td>
									<td><c:out value="${listagem.titulo}" /></td>
									<td><c:out value="${listagem.descricao}" /></td>
									<td class="text-right"><a class="btn btn-success icones" title="Apagar"
										href="ServicoController?action=deletar&id=<c:out value="${listagem.id}"/>"><i
											class="fa fa-eye"></i></a> <a class="btn btn-warning icones" title="Editar"
										href="ServicoController?action=editar&id=<c:out value="${listagem.id}"/>"><i
											class="fa fa-edit"></i></a> <a class="btn btn-danger icones" title="Apagar"
										href="ServicoController?action=deletar&id=<c:out value="${listagem.id}"/>"><i
											class="fa fa-trash"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello stand alone ui',
			tabsize : 2,
			height : 300
		});
	</script>
</body>
</html>