<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet" />
	</head>
	<body>
		<h3>Adicionar Tarefas</h3>
		<form:errors path="tarefa.descricao" cssStyle="color:red"></form:errors><br />
		<form action="adicionaTarefa" method="post">
			Descrição: <br />
			<textarea name="descricao" rows="5" cols="100"></textarea><br />
			<input type="submit" value="Adicionar">
		</form>
	</body>
</html>