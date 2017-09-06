<%-- 
    Document   : modificarProducto
    Created on : 06-sep-2017, 12:01:15
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rojas.carlos.DAL.ProductosDAL,
        rojas.carlos.modelos.Producto,
        java.math.BigDecimal" %>
<%
    Producto producto = new Producto("");
    String codigo = request.getParameter("codigo");
    if (codigo != null) {
        if (request.getMethod() == "POST") {
            producto.setDescripcion(request.getParameterValues("descripcion")[0]);
            producto.setPrecio(BigDecimal.valueOf(Double.parseDouble(request.getParameterValues("precio")[0])));
            producto.setCategoria(Short.parseShort(request.getParameterValues("categoria")[0]));
            ProductosDAL.modificarProducto(codigo, producto);
            response.sendRedirect("listaProductos.jsp");
        } else {
            producto = ProductosDAL.traerProducto(codigo);
        }
    } else {
        response.sendRedirect("listaProductos.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
        <style>
            input[readonly]{
                background-color: lightgray;
                font-family: monospace;
            }
        </style>
    </head>
    <body>
        <h1>Modificando <%= producto.getCodigo() + " - " + producto.getDescripcion()%></h1>
        <form method="POST" action="#">
            <label for="txtCodigo">Código</label>
            <input readonly="readonly" type="text" name="codigo" 
                   id="txtCodigo" value="<%= producto.getCodigo()%>"/>
            <label for="txtDescripcion">Descripción</label>
            <input type="text" name="descripcion" 
                   id="txtDescripcion" value="<%= producto.getDescripcion()%>"/>
            <label for="txtPrecio">Precio</label>
            <input type="number" name="precio" id="txtPrecio"
                   value="<%= producto.getPrecio()%>"/>
            <label for="txtCategoris">Código</label>
            <input type="text" name="categoria" id="txtCategoria"
                   value="<%= producto.getCategoria()%>"/>
            <br />
            <button type="submit">Modificar</button>
            <button type="reset">Limpiar</button>
        </form>
        <div>
            <a href="listaProductos.jsp">Volver a la lista</a>
        </div>
    </body>
</html>
