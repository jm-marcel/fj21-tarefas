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
				<!-- $.get("finalizaTarefa?id=" + id, function(dadosDeResposta) {
					alert("Tarefa Finalizada!")
				}); -->
				$.post("finalizaTarefa", {'id' : id}, function(resposta) {
					// selecionando o elemento html atrav�s da 
		            // ID e alterando o HTML dele 
		            $("#tarefa_" + id).html(resposta);
					alert(resposta);
				});
			}
		</script>
		<!--<script type="text/javascript">
			function remover(id) {
				
			}
		</script>-->
		<a href="novaTarefa">Criar nova tarefa</a><br /><br />
		<table border="1">
			<tr>
				<th>Id</th>
                <th>Descri��o</th>
                <th>Finalizado</th>
                <th>Data de Finaliza��o</th>
                <th>Alterar Tarefa</th>
                <th>Remover Tarefa</th>
			</tr>
			<c:forEach items="${tarefas}" var="tarefa" varStatus="id">
				<tr id="tarefa_${tarefa.id}" bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					<c:choose>
						<c:when test="${tarefa.finalizado eq false}">
							<td id="tarefa_${tarefa.id}">
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
		</table>
	</body>
</html>