<%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, Modelo.*, Controlador.*, DAO.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AgroSRL</title>
    </head>
    <body style="background-color:powderblue;">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <% DAOPostgres DAO = new DAOPostgres(); %>
        <% DAO.abrirSesion(); %>
        <% Controlador controlador = new Controlador(DAO); %>
        <% List<Campo> campos = controlador.getCampos(); %>
        <% request.setAttribute("campos", campos);%>
        <h4>Campos</h4>
        <form action="MenuLotes.jsp">
            <table id="tablaCampos" class="table table-bordered table-hover table-condensed" style="border:2px DodgerBlue;">
                <tr>
                    <th>Nº</th>
                    <th>Estado</th>
                    <th>Elegir</th>
                </tr>
                <c:forEach items="${campos}" var="campo">
                    <tr>
                        <td><c:out value="${campo.idcampo}"/></td>
                        <td><c:out value="${campo.estadocampo.nombre}"/></td>
                        <td><input type="radio" name="idCampoElegido" value="${campo.idcampo}"></td>
                    </tr>
                </c:forEach>
            </table>
            <button type="submit" class="btn btn-lg btn-primary">Ver campo</button>
        </form>
        <% DAO.cerrarSesion(); %>
    </body>
</html>
