<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" />
</head>
<body>
	<div class="jumbotron">
		<h3 class="text-left">
			<i class="fa fa-cogs"></i> SERVIÇO
			<hr>
		</h3>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-3">

				<div class="nav flex-column nav-pills" id="v-pills-tab"
					role="tablist" aria-orientation="vertical">

					<a class="nav-link active" id="v-pills-register-tab"
						data-toggle="pill" href="#v-pills-register" role="tab"
						aria-controls="v-pills-register" aria-selected="true"><i
						class="fa fa-trash"></i> Cadastrar Serviço</a> <a class="nav-link"
						id="v-pills-search-tab" data-toggle="pill" href="#v-pills-search"
						role="tab" aria-controls="v-pills-search" aria-selected="false"><i
						class="fa fa-search"></i> Pesquisar Serviços</a>
				</div>
			</div>
			<div class="col-9">
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-register"
						role="tabpanel" aria-labelledby="v-pills-register-tab">

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
												<label for="titulo">Título:</label> <input
													class="form-control" type="text" id="titulo" name="titulo"
													required value="<c:out value="${inserir.titulo}"/>"
													required />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="descricao ">Descrição:</label>
												<textarea id="summernote" name="descricao" required>
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
					</div>

					<div class="tab-pane fade" id="v-pills-search" role="tabpanel"
						aria-labelledby="v-pills-search-tab">

						<div class="row my-3">
							<div class="col-md-6">
								<form class="form-inline my-2 my-lg-0 " method="GET"
									action="ServicoController" name="consultarServico">
									<input class="form-control mr-sm-2" type="search"
										placeholder="Pesquisar por..." aria-label="Search">
									<button class="btn btn-primary my-2 my-sm-0" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</div>
							<div class="col-md-6 text-right">
								<a class="btn btn-info" href="ServicoController?action=listar"><i
									class="fa fa-list"></i> Mostrar Todos</a>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 scroll">
								<table class="table table-striped table-bordered" id="tabela">
									<thead class="thead-inverse">
										<tr id="titulo">
											<th>#</th>
											<th>Título:</th>
											<th>Descrição:</th>
											<th>Ação</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${lista}" var="listagem">
											<tr>
												<th scope="row"><c:out value="${listagem.id}" /></th>
												<td><c:out value="${listagem.titulo}" /></td>
												<td><c:out value="${listagem.descricao}" /></td>
												<td class="text-right"><a
													class="btn btn-success icones" title="Apagar" href="#"><i
														class="fa fa-eye"></i></a> <a class="btn btn-warning icones"
													title="Editar"
													href="ServicoController?action=editar&id=<c:out value="${listagem.id}"/>"><i
														class="fa fa-edit"></i></a> <a class="btn btn-danger icones"
													title="Apagar"
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