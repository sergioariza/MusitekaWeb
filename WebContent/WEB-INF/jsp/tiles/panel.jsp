<%@page import="ClasesMusiteka.Transacciones"%>
<%@page import="java.util.List"%>
<%@page import="ClasesMusiteka.TransaccionesHelper"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="ClasesMusiteka.DocumentosHelper"%>
<%@page import="ClasesMusiteka.Usuarios"%>
<%@page import="ClasesMusiteka.UsuariosHelper"%>
<%@page import="modelos.UsuarioNav"%>

<%
    UsuarioNav usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
    UsuariosHelper usuariosHelper = new UsuariosHelper();
    ProductosHelper productosHelper = new ProductosHelper();
    Usuarios usuario = usuariosHelper.getUsuario(usuarioNav.getIdusuario());
    String accion = request.getParameter("accion");
    
    if((accion != null) && (accion.compareTo("comprar") == 0)){
%>
        <script type="text/javascript">compraRealizada();</script>
<%        
    }
%>

<div style="margin: 20px;">  
    <p class="login">
         Hola <%=usuario.getNombre()%> <%=usuario.getApellidos()%>.
    </p>   
  
    <p class="login">
        En tu zona personal de cliente puedes consultar el estado de tus pedidos recientes o modificar tus datos de cliente. Para ello selecciona los links que aparecen abajo.
    </p>

    <div class="panel" style="float: left;">
        <h3>
            Mis datos como usuario
        </h3>

        <div style="margin: 20px;">
            <table cellspacing="0" cellpadding="0" border="0" style="font-size: 1.00em; color: #777;">
            <tbody>
                <tr>
                    <td>
                        Tratamiento:
                    </td>
                    <td>
                        <%=usuario.getTratamiento()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre:
                    </td>
                    <td>
                        <%=usuario.getNombre()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Apellidos:
                    </td>
                    <td>
                        <%=usuario.getApellidos()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Correo:
                    </td>
                    <td>
                        <%=usuario.getEmail()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Tipo documento:
                    </td>
                    <td>
                        <%=usuario.getDocumentos().getTiposdocumentos().getDesctipodocumento()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Documento:
                    </td>
                    <td>
                        <%=usuario.getDocumentos().getDocumento()%>
                    </td>
                </tr>
            </tbody>
            </table>
            <br/>
            <div style="text-align: center">
                <form method="post" action="cuenta.html">
                    <input type="submit" value="Editar">
                </form>
            </div>
        </div>
    </div>

    <div class="panel" style="float:right;">
        <h3>Mi dirección</h3>
        <div style="margin: 20px; font-size: 1.00em; color: #777;">
            <table cellspacing="0" cellpadding="0" border="0" style="font-size: 1.00em; color: #777;">
            <tbody>
                <tr>
                    <td>
                        Tratamiento:
                    </td>
                    <td>
                        <%=usuario.getTratamiento()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre y apellidos:
                    </td>
                    <td>
                        <%=usuario.getNombre()%> <%=usuario.getApellidos()%>
                    </td>
                </tr>                
                <tr>
                    <td>
                        Dirección:
                    </td>
                    <td>
                        <%=usuario.getDomicilios().getNombrevia()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Número y piso:
                    </td>
                    <td>
                        <%=usuario.getDomicilios().getNumeropiso()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Código Postal:
                    </td>
                    <td>
                        <%=usuario.getDomicilios().getCodigopostal()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Localidad (Provincia):
                    </td>
                    <td>
                        <%=usuario.getDomicilios().getLocalidadprovincia()%>
                    </td>
                </tr>
                <tr>
                    <td>
                        País:
                    </td>
                    <td>
                        <%=usuario.getDomicilios().getPaises().getNombrepais()%>
                    </td>
                </tr>
            </tbody>
            </table>
            <br/>
            <div style="text-align: center">
                <form method="post" action="direccion.html">
                    <input type="submit" value="Editar">
                </form>
            </div>
        </div>
    </div>  
    <div style="clear: both;">
    </div>
</div>
<%
    Map<Integer, Integer> listaCompra = usuarioNav.getListaCompra();    
    if((listaCompra != null) && (!listaCompra.isEmpty())){
%>
        <div class="panel" style="float: left; width: 840px; height:auto; margin: 20px;">
            <h3>
                <div style="text-align: center;">
                    Mi cesta
                </div>
            </h3>
            <table class="cesta" border="1" cellspacing="0">
                <tr class="cesta" border="0">
                    <th style="width: 30%;" border="0" class="cesta">
                        Marca
                    </th>
                    <th style="width: 30%" class="cesta">
                        Modelo
                    </th>
                    <th style="width: 15%" class="cesta">
                        Precio/Unidad
                    </th>
                    <th style="width: 5%" class="cesta">
                        Unidades
                    </th>
                    <th style="width: 20%" class="cesta">
                        Total
                    </th>
                </tr>
<%
                for(Map.Entry<Integer, Integer> entry : listaCompra.entrySet()){
                    int idProducto = entry.getKey();
                    Productos producto = productosHelper.getProducto(idProducto);
                    double total = producto.getPrecio().doubleValue() * entry.getValue();                              
%>
                    <tr class="cesta">
                        <td class="cesta">
                            <%=producto.getMarca()%>
                        </td>
                        <td class="cesta">
                            <%=producto.getModelo()%>
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=producto.getPrecio().doubleValue()%>&#8364
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=entry.getValue()%>
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=total%>&#8364
                        </td>
                    </tr>
<%
                }
%>
            </table>
        </div>
<%
   }//else{
%>
<!--
        <div class="panel" style="float: left; width: 840px; height:auto; margin: 20px;">
                    <h3>
                        <div style="text-align: center;">
                            Mi cesta
                        </div>
                    </h3>
                    <div id="tituloProducto" style="text-align: center">
                        No tiene ningún producto en la cesta.
                    </div>
            <br/>
        </div>
-->
<%
   //}
%>

<%
    int idUsuario = usuarioNav.getIdusuario();
    TransaccionesHelper transaccionesHelper = new TransaccionesHelper();
    List<Transacciones> listaTransacciones = transaccionesHelper.getTransacciones(idUsuario);
    
    if((listaTransacciones != null) && (!listaTransacciones.isEmpty())){
%>
        <div class="panel" style="float: left; width: 840px; height:auto; margin: 20px;">
            <h3>
                <div style="text-align: center;">
                    Mi historial de pedidos
                </div>
            </h3>
            <table class="cesta" border="1" cellspacing="0">
                <tr class="cesta" border="0">
                    <th style="width: 30%;" border="0" class="cesta">
                        Marca
                    </th>
                    <th style="width: 30%" class="cesta">
                        Modelo
                    </th>
                    <th style="width: 15%" class="cesta">
                        Precio/Unidad
                    </th>                    
                    <th style="width: 5%" class="cesta">
                        Nº Factura
                    </th>
                    <th style="width: 20%" class="cesta">
                        Forma pago
                    </th>
                </tr>
<%
                Iterator<Transacciones> iter = listaTransacciones.iterator();
                while(iter.hasNext()){
                    Transacciones transaccion = iter.next();
                    Productos p = productosHelper.getProducto((int)transaccion.getIdproducto());
%>
                    <tr class="cesta">
                        <td class="cesta">
                            <%=p.getMarca()%>                            
                        </td>
                        <td class="cesta">
                            <%=p.getModelo()%>
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=p.getPrecio()%>&#8364
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=transaccion.getNumerocompra()%>
                        </td>
                        <td class="cesta" style="text-align: center;">
                            <%=transaccion.getFormapago()%>
                        </td>
                    </tr>
<%
                }
%>
            </table>
        </div>
<%
   }
%>