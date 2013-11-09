<%@page import="java.util.List"%>
<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="modelos.UsuarioRegistro"%>
<%@page import="modelos.UsuarioLogin"%>
<%@page import="modelos.MenuNav"%>

<%
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    Productos producto = new Productos();
    ProductosHelper productosHelper = new ProductosHelper();
    producto = productosHelper.getProducto(menuNav.getProducto());
    String observaciones = productosHelper.getObservaciones(menuNav.getProducto());
    String[] caracteristicas = observaciones.split(";");
    String marca = productosHelper.getMarca(menuNav.getProducto());
    String marcaymodelo = productosHelper.getMarcaymodelo(menuNav.getProducto());
    double precio = productosHelper.getPrecio(menuNav.getProducto());
    String precioStr = String.valueOf(precio);
%>

<div id="producto">
    <table class="detalleProducto">
        <tr>
            <td class="detalleProductoFoto">
                <a href="Imagenes/Productos/<%=producto.getIdproducto()%>.png" class="zoom" style="border: none">
                    <img src="Imagenes/Productos/<%=producto.getIdproducto()%>.png" height="490" width="498" style="border: none"/>
                </a>
            </td>
            <td class="detalleProductoEspecificaciones">                
                <div style="overflow: auto;">
                <br/>
                <div style="text-align: left;">
                    <img src="Imagenes/Marcas/<%=marca%>.png"/>
                </div>
                <div id="subtituloProducto" style="text-align: left; margin-left: 5px;">
                    <%=marcaymodelo%>
                </div>
                
                <br/>
<%
                for(int i = 0; i < caracteristicas.length; i++){
%>
                    <img src="Imagenes/flechita.gif"/><%=caracteristicas[i].toString()%>
                    <br/>
<%                
                }
%>            
                </div>
            </td>
            <td class="detalleProductoPrecio">
                <br/>
                <div id="subtituloProducto" style="vertical-align: text-top; text-align: center; border: solid 1px #ccc; margin-right: 10px; margin-left: 10px;">
                    <span style="color: #999999; font-size: 0.90em; font-weight: normal;">
                        Precio:
                    </span>
                    <%=precioStr%>&#8364
                </div>
                <div style="text-align: center;">
                    <form action="#" method="post">
                        <input type="hidden" name="accion" value="agregar"/>
                        <input type="image" src="Imagenes/cesta.jpg" alt="Enviar pedido" style="width:188px; height:32px; border:none; margin-top:15px;">
                    </form>
                </div>
            </td>
        </tr>
    </table>
</div>