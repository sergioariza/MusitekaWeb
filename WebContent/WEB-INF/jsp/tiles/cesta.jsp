<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="java.util.Map"%>
<%@page import="modelos.UsuarioNav"%>
<%
    UsuarioNav usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");   
    String accion = (String) request.getParameter("accion");
    Map<Integer, Integer> listaCompra = usuarioNav.getListaCompra();
    
    if((accion != null)&&(accion.compareTo("cambiarCantidad") == 0)){
        int idProducto = Integer.valueOf((String) request.getParameter("idProducto"));
        int cantidad = (int) Integer.parseInt((String)request.getParameter("cantidad"));
        if(cantidad > 0){
            listaCompra.put(idProducto, cantidad);
        }else{
%>
            <script type="text/javascript">errorModificar();</script>
<%
        }
    }
    
    if((accion != null)&&(accion.compareTo("borrar") == 0)){
        int idProducto = Integer.valueOf((String) request.getParameter("idProducto"));
        listaCompra.remove(idProducto);
    }
    
    ProductosHelper productosHelper = new ProductosHelper();
    double total = 0.00;     
%>
<div style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; width: 1250px; height: auto;">
<table border="1" style="border-collapse: collapse; width: 1250px; background-color: #EEEEE9; background: linear-gradient(#EEEEE9,#BBBBBB); border:1px solid white; padding: 10px;">
    <col width="100">
    <col width="600">
    <col width="150">
    <col width="150">
    <tr style="border:1px solid white;">
        <td rowspan="1000" style=" width: 20%; background-color: white; border:1px solid white; vertical-align: top;">
            <img src="Imagenes/Compra/step1.jpg" width="188" height="200" style="border:none;">
        </td>
        <td colspan="3" style="background-color: white; border:1px solid white;">
            <div style="float: left; background: url('Imagenes/fondopasos.jpg') left center repeat-x; width: 20px; height: 20px; color: white; text-align: center; vertical-align: central;">
                1
            </div>
            <h3>&nbsp&nbspSu cesta de compra</h3>
        </td>
    </tr>
    <tr style="background-color: #ddd; background: linear-gradient(#ddd,#AAAAAA); padding: 5px; color: #333; font-size: .82em; font-weight: bold; text-align: left; border:1px solid white;">
        <td style="padding-left: 10px; border:1px solid white;">
            Artículo
        </td>
        <td style="padding-left: 10px; border:1px solid white;">
            Cantidad
        </td>
        <td style="padding-left: 10px; border:1px solid white;">
            Precio
        </td>
    </tr>
<%
    double gastosEnvio = 15.0;
    for(Map.Entry<Integer, Integer> entry : listaCompra.entrySet()){        
        Productos producto = productosHelper.getProducto(entry.getKey());
        int cantidad = entry.getValue();
        total = total + (producto.getPrecio().doubleValue() * cantidad);
        if(total > 299.0){
            gastosEnvio = 0.0;
        }
%>
        <tr style="border:1px solid white;">
            <td align="left" valign="top" style="padding:10px;">
                <div style="background-color:#FFFFFF; width:70px; height:70px; margin-right:10px; line-height:70px; padding:5px; border:1px solid #DDDDDD; float:left; text-align:center; vertical-align:middle;"><a href="?"><img src="Imagenes/Productos/<%=(int)producto.getIdproducto()%>.jpg" width="60" height="60" alt="" style="border:none; margin-top:5px;"></a></div>
                <div style="color: #333; font-size: .82em; text-align: left;"><a href="?" style="color: #333; text-decoration: none;"><%=producto.getMarca()%></a></div>
                <div style="margin-top:5px; color: #333; font-size: .82em; text-align: left;"><a href="?" style="color: #333; text-decoration: none;"><%=producto.getModelo()%></a></div>
                <div style="margin-top:4px;"><div style="float:left;"></div></div>
                <div style="margin-top:20px;">
                    <a href="cesta.html?accion=borrar&idProducto=<%=(int)producto.getIdproducto()%>" style="font-size: .82em; color: #36c; text-decoration: none;">Borrar</a>
                </div>
            </td>
            <td style="color: #333; font-size: .82em; text-align: center; border:1px solid white;">
                <div id="numeroItems<%=(int)producto.getIdproducto()%>" style="display:block;">
                <div><%=cantidad%></div>
                <div style="margin-top:5px;"><a href="javascript:change_quantity('numeroItems<%=(int)producto.getIdproducto()%>', 'numeroItemsEdit<%=(int)producto.getIdproducto()%>');" style="color: #36c; text-decoration: none;">Cambiar</a></div>
                </div>
                <div id="numeroItemsEdit<%=(int)producto.getIdproducto()%>" style="display: none;">
                    <form action="" method="post">
                        <input type="hidden" name="accion" value="cambiarCantidad">
                        <input type="hidden" name="idProducto" value="<%=(int)producto.getIdproducto()%>">
                        <input type="text" size="2" maxlength="5" name="cantidad" value="<%=cantidad%>">&nbsp;&nbsp;<input type="submit" value="OK">
                    </form>
                </div>
            </td>
            <td style="color: #333; font-size: .82em; text-align: right; border:1px solid white;">
                <%=String.valueOf(producto.getPrecio().doubleValue() * cantidad)%> &euro;
            </td>
        </tr>
<%
    }
%>
    <tr style="border:1px solid white;">
        <td colspan="2" style="color: #333; font-size: .82em; text-align: right; border:1px solid white;">
            Gastos de envío:
        </td>
        <td style="color: #333; font-size: .82em; text-align: right; border:1px solid white;">            
            <%=String.valueOf(gastosEnvio)%> &euro;
        </td>
    </tr>
    <tr style="border:1px solid white;">
        <td style="color: #333; font-size: .82em; text-align: right; border:1px solid white; padding: 10px;">            
            <div class="fliess12" style="background-color:#FFFFFF; height:60px; border:1px solid #DDDDDD; padding-top:10px;width: auto;">
                <img src="Imagenes/afirmativoNegro.gif" width="44" height="44" alt="" style="border:none; float:left;margin:5px 0px 5px 5px;">
                <div style="width:250px; height:20px; float:left;text-align: left;"><img src="Imagenes/afirmativoVerde.gif" width="9" height="9" alt="" style="border:none; float:left; margin:1px 4px 0px 0px;">30 días derechos de devolución</div>
                <div style="width:200px; height:20px; float:left;text-align: left;"><img src="Imagenes/afirmativoVerde.gif" width="9" height="9" alt="" style="border:none; float:left; margin:1px 4px 0px 0px;">Protección de datos</div>
                <div style="width:400px; height:20px; float:left;text-align: left;"><img src="Imagenes/afirmativoVerde.gif" width="9" height="9" alt="" style="border:none; float:left; margin:1px 4px 0px 0px;">Envíos asegurado</div>
                <div style="width:400px; height:20px; float:left;text-align: left;"><img src="Imagenes/afirmativoVerde.gif" width="9" height="9" alt="" style="border:none; float:left; margin:1px 4px 0px 0px;">Envío gratuito a partir de 299 EUR</div>
            </div>    
        </td>
        <td style="color: #333; font-size: 0.82em; text-align: right; border:1px solid white;">
            <div style="font: bold;">Total:</div>
        </td>
        <td style="color: #333; font-size: .82em; text-align: right; border:1px solid white;">
            <%=String.valueOf(total + gastosEnvio)%>&nbsp;&euro;
        </td>
    </tr>
</table>
<br/>
<table border="0" align="center">
    <col width="358">
    <col width="1100">
    <tr>
        <td style="text-align: right;">
            <form method="post" action="panel.html">
                <input type="submit" value="Volver">
            </form>
        </td>
        <td style="text-align: right;">
            <form method="post" action="paso2.html">
                <input type="submit" value="Siguiente">
            </form>
        </td>
    </tr>
</table>
</div>