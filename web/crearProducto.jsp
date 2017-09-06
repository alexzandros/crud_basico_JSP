<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rojas.carlos.modelos.Producto,
        rojas.carlos.DAL.ProductosDAL,
        java.math.BigDecimal" %>
<% if (request.getMethod() == "POST") {
        Producto producto = new Producto();
        
        producto.setCodigo(request.getParameterValues("codigo")[0]);
        producto.setDescripcion(request.getParameterValues("descripcion")[0]);
        producto.setPrecio(BigDecimal.valueOf(Double.parseDouble(request.getParameterValues("precio")[0])));   
        producto.setCategoria(Short.parseShort(request.getParameterValues("categoria")[0]));
        ProductosDAL.crearProducto(producto);
        response.sendRedirect("listaProductos.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Producto</title>
    </head>
    <body>
        <h1>Crear Producto</h1>
        <form method="POST" action="#">
            <label for="txtCodigo">Código</label>
            <input type="text" name="codigo" id="txtCodigo"/>
            <label for="txtDescripcion">Descripción</label>
            <input type="text" name="descripcion" id="txtDescripcion"/>
            <label for="txtPrecio">Precio</label>
            <input type="number" name="precio" id="txtPrecio"/>
            <label for="txtCategoris">Código</label>
            <input type="text" name="categoria" id="txtCategoria"/>
            <br />
            <button type="submit">Enviar</button>
            <button type="reset">Limpiar</button>
        </form>
        <div>
            <a href="listaProductos.jsp">Volver a la lista</a>
        </div>
    </body>
</html>
