<%@ page contentType="text/html" pageEncoding="UTF-8" import="rojas.carlos.DAL.ProductosDAL,rojas.carlos.modelos.Producto" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Listado de productos</h1>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Modificar</th>
            </tr>
            <% for (Producto producto : ProductosDAL.listarProductos()) {%>
            <tr>
                <td><%= producto.getCodigo()%></td>
                <td><%= producto.getDescripcion()%></td>
                <td><%= producto.getPrecio()%></td>
                <td><a href="modificarProducto.jsp?codigo=<%=producto.getCodigo()%>">Modificar</a></td>
            </tr>
            <% }%>
        </table>
        <div>
            <a href="crearProducto.jsp">Crear producto nuevo</a>
        </div>
    </body>
</html>
