<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.*, java.util.*, Modelo.*, Controlador.*, DAO.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto - AgroSRL</title>
    </head>
    <body style="background-color:powderblue;">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <% DAOPostgres DAO = new DAOPostgres(); %>
        <% DAO.abrirSesion(); %>
        <% Controlador controlador = new Controlador(DAO); %>
        <% int id = Integer.parseInt(request.getParameter("idProyectoElegido")); %>
        <% Proyecto proyectoElegido = (Proyecto) controlador.recuperarUno(Proyecto.class, id); %>
        <h4>Información del proyecto</h4>
        <b>Número de proyecto:</b> <%= proyectoElegido.getIdproyecto() %><br>
        <b>Número del lote del proyecto:</b> <%= proyectoElegido.getLote().getIdlote() %><br>
        <b>Número del campo del lote:</b> <%= proyectoElegido.getLote().getCampo().getIdcampo() %><br>
        <b>Cultivo que se plantó:</b> <%= proyectoElegido.getCultivo().getNombre() %><br>
        <b>Estado del proyecto:</b> <%= proyectoElegido.getEstadoproyecto().getNombre() %><br><br>
        <h4>Laboreos del proyecto</h4>
        <table id="tablaLaboreosProyecto" class="table table-bordered table-hover table-condensed" style="border:2px DodgerBlue;">
            <tr>
                <th>Orden</th>
                <th>Laboreo</th>
                <th>Comenzó</th>
                <th>Terminó</th>
            </tr>
            <% request.setAttribute("laboreos", proyectoElegido.getProyectoxlaboreos()); %>
            <c:forEach items="${laboreos}" var="laboreo">
                <tr>
                    <td><c:out value="${laboreo.orden}"/></td>
                    <td><c:out value="${laboreo.laboreo.nombre}"/></td>
                    <td><c:out value="${laboreo.fechainicio}"/></td>
                    <td><c:out value="${laboreo.fechafin}"/></td>
                </tr>
            </c:forEach>
        </table>
        <% DAO.cerrarSesion(); %>
    </body>
</html>
