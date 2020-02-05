<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	</head>
	<body>
		<a href="novaTarefa">Criar nova tarefa</a><br /><br />
		<table>
			<tr>
				<th>Id</th>
                <th>Descrição</th>
                <th>Finalizado?</th>
                <th>Data de finalização</th>
			</tr>
			<c:forEach items="${tarefas}" var="tarefa">
				<tr>
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					<c:choose>
						<c:when test="${tarefa.finalizado eq false}">
							<td>Não finalizado</td>
						</c:when>
						<c:otherwise>
							<td>Finalizado</td>
						</c:otherwise>
					</c:choose>
					<td>
						<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>