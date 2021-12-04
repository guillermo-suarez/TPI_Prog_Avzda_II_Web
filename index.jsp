<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, Modelo.*, Controlador.*, DAO.*" %>
<!DOCTYPE html>
<html>
    <%
    DAOPostgres DAO = new DAOPostgres();
    DAO.abrirSesion();
    Controlador controlador = new Controlador(DAO);
    request.getSession().setAttribute("controlador", controlador);
    %>
    <jsp:include page="MenuCampos.jsp"/>
</html>
