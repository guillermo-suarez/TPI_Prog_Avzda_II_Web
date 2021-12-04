<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="java.io.*, java.util.*, Modelo.*, Controlador.*, DAO.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lote - AgroSRL</title>
    </head>
    <body style="background-color:powderblue;">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <%
        Controlador controlador = (Controlador) request.getSession().getAttribute("controlador");
        int id = Integer.parseInt(request.getParameter("idLoteElegido"));
        Lote loteElegido = (Lote) controlador.recuperarUno(Lote.class, id);
        %>
        <h4>Información del lote</h4>
        <b>Número del lote:</b> <%= loteElegido.getIdlote() %><br>
        <b>Número del campo al que pertenece:</b> <%= loteElegido.getCampo().getIdcampo() %><br>
        <b>Tipo de suelo del lote:</b> <%= loteElegido.getTiposuelo().getNombre() %><br>
        <b>Superficie del lote:</b> <%= loteElegido.getSuperficie() %><br><br>
        <h4>Proyectos del lote</h4>
        <% request.setAttribute("proyectos", loteElegido.getProyectos()); %>
        <c:choose>
            <c:when test="${proyectos.size() > 0}">
                <form action="MenuProyectoLaboreos.jsp">
                    <table id="tablaProyectos" class="table table-bordered table-hover table-condensed" style="border:2px DodgerBlue;">
                        <tr>
                            <th>Nº</th>
                            <th>Cultivo</th>
                            <th>Estado</th>
                            <th>Elegir</th>
                        </tr>
                        <c:forEach items="${proyectos}" var="proyecto">
                            <tr>
                                <td><c:out value="${proyecto.idproyecto}"/></td>
                                <td><c:out value="${proyecto.cultivo.nombre}"/></td>
                                <td><c:out value="${proyecto.estadoproyecto.nombre}"/></td>
                                <td><input type="radio" name="idProyectoElegido" value="${proyecto.idproyecto}"
                                           onclick="habilitarBoton()"></td>
                            </tr>
                        </c:forEach> 
                    </table>
                    <button id="btnVerProyecto" type="submit" class="btn btn-lg btn-primary" disabled='disabled'>Ver proyecto</button>
                </form>
                <script>
                    function habilitarBoton() {
                        document.getElementById("btnVerProyecto").disabled = false;
                    }
                </script>
            </c:when>
            <c:otherwise>
                El lote no tiene proyectos cargados.
            </c:otherwise>
        </c:choose>
    </body>
</html>
