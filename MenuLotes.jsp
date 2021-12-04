<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.*, java.util.*, Modelo.*, Controlador.*, DAO.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campo - AgroSRL</title>
    </head>
    <body style="background-color:powderblue;">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <%
        Controlador controlador = (Controlador) request.getSession().getAttribute("controlador");
        int id = Integer.parseInt(request.getParameter("idCampoElegido"));
        Campo campoElegido = (Campo) controlador.recuperarUno(Campo.class, id);
        %>
        <h4>Información del campo</h4>
        <b>Número de campo:</b> <%= campoElegido.getIdcampo() %><br>
        <b>Estado del campo:</b> <%= campoElegido.getEstadocampo().getNombre() %><br><br>
        <h4>Lotes del campo</h4>
        <% request.setAttribute("lotes", campoElegido.getLotes()); %>
        <c:choose>
            <c:when test="${lotes.size() > 0}">
                <form action="MenuProyectos.jsp">
                    <table id="tablaLotes" class="table table-bordered table-hover table-condensed" style="border:2px DodgerBlue;">
                        <tr>
                            <th>Nº</th>
                            <th>Tipo de suelo</th>
                            <th>Superficie</th>
                            <th>Activo</th>
                            <th>Elegir</th>
                        </tr>
                        <c:forEach items="${lotes}" var="lote" varStatus="contador">
                            <tr>
                                <td><c:out value="${lote.idlote}"/></td>
                                <td><c:out value="${lote.tiposuelo.nombre}"/></td>
                                <td><c:out value="${lote.superficie}"/></td>
                                <td><c:choose>
                                    <c:when test="${lote.activo == true}">
                                        <c:out value="Si"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="No"/>
                                    </c:otherwise>
                                </c:choose></td>
                                <td><input type="radio" name="idLoteElegido" value="${lote.idlote}"
                                           onclick="habilitarBoton()"></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <button id="btnVerLote" type="submit" class="btn btn-lg btn-primary" disabled='diabled'>Ver lote</button>
                </form>
                <script>
                    function habilitarBoton() {
                        document.getElementById("btnVerLote").disabled = false;
                    }
                </script>
            </c:when>
            <c:otherwise>
                El campo no tiene lotes cargados.
            </c:otherwise>
        </c:choose>
    </body>
</html>
