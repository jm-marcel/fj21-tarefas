<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<script type="text/javascript" src="resources/js/jquery.js"></script>
	</head>
	<body>
		<script type="text/javascript">
			function finalizar(id) {
				$.post("finalizaTarefa", {'id' : id}, function(resposta) {
					// selecionando o elemento html através da 
		            // ID e alterando o HTML dele 
		            // $("#tarefa_" + id).html("Finalizado");
		            $("#tarefa_" + id).html(resposta);
					// alert(resposta);
				});
			}
		</script>
		<table border="1">
			<tr>
				<th>Id</th>
                <th>Descrição</th>
                <th>Finalizado</th>
                <th>Data de Finalização</th>
                <th>Alterar Tarefa</th>
                <th>Remover Tarefa</th>
			</tr>
			<c:forEach items="${tarefas}" var="tarefa" varStatus="id">
				<tr id="tarefa_${tarefa.id}" bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					<c:choose>
						<c:when test="${tarefa.finalizado eq false}">
							<td>
								<a href="#" onclick="finalizar(${tarefa.id})">Finalizar</a>
							</td>
						</c:when>
						<c:otherwise>
							<td>Finalizado</td>
						</c:otherwise>
					</c:choose>
					<td>
						<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
					</td>
					<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
					<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				</tr>
			</c:forEach>
		</table><br /><a href="novaTarefa">Criar nova tarefa</a><br />
	</body>
</html>