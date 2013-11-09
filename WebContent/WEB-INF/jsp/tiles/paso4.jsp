<%@page import="modelos.MenuNav"%>
<%@page import="ClasesMusiteka.Usuarios"%>
<%@page import="ClasesMusiteka.UsuariosHelper"%>
<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="java.util.Map"%>
<%@page import="modelos.UsuarioNav"%>
<%
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    UsuarioNav usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
    Map<Integer, Integer> listaCompra = usuarioNav.getListaCompra();
    ProductosHelper productosHelper = new ProductosHelper();
    UsuariosHelper usuariosHelper = new UsuariosHelper();
    Usuarios usuario = usuariosHelper.getUsuario(usuarioNav.getIdusuario());
    int formaPago = Integer.parseInt(request.getParameter("formapago"));
%>

<div style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; width: 1250px; height: auto;">
<%
    if((menuNav.getDescripcionLogin() != null)&&(menuNav.getDescripcionLogin().compareTo("") != 0)){
%>
        <div id="mensajeAdvertencia" style="margin-top: -3px;">        
            <%=menuNav.getDescripcionLogin()%>
        </div>
<%        
    }
%>
<table border="0" style="border-collapse: collapse; width: 1250px; border:1px solid white; padding: 10px;">
    <col width="100">
    <col width="600">
    <tr style="vertical-align: top; border:1px solid white;">
        <td rowspan="2" style="width: 20%; background-color: white; vertical-align: top; border:1px solid white;">
            <img src="Imagenes/Compra/step4.jpg" width="188" height="200" style="border:none;">
        </td>
        <td style="background-color: white; border:1px solid white;">
            <div style="float: left; background: url('Imagenes/fondopasos.jpg') left center repeat-x; width: 20px; height: 20px; color: white; text-align: center; vertical-align: central;">
                4
            </div>
            <h3>&nbsp&nbspVerificar y pedir</h3>
        </td>
    </tr>
    <tr style="border:1px solid white;">
        <td style="border:1px solid white;background-color: #EEEEEE; background: linear-gradient(#EEEEEE,#CCCCCC);">            
            <table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-size: 1.00em; color: #777; border-collapse: collapse;">
                <colgroup>
                    <col width="30">
                    <col width="30">
                    <col width="*">
                </colgroup>    
                <tr>
                    <td rowspan="2">
                        <div style="font-size: 1.00em; color: #777; text-align: left; margin-top: 10px; margin-left: 20px;"><b>Datos de usuario</b></div>
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
                        </div>
                    </td>
                    <td>
                        <div style="font-size: 1.00em; color: #777; text-align: left;margin-top: 0px; margin-left: 20px;"><b>Datos de envío</b></div>
                        <div style="margin: 20px; font-size: 1.00em; color: #777;">
                        <table cellspacing="0" cellpadding="0" border="0" style="font-size: 1.00em; color: #777;">
                        <tbody>                                                
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
                    </div>
                    </td>                        
                </tr>
                <tr>
                    <td>
                        <div style="margin-left: 20px;">
                            Forma de pago:
<%
                            switch(formaPago){
                                case 1:
%>
                                    <img src="Imagenes/Compra/paypal.gif" align="middle"> Paypal
<%
                                    break;
                                case 2:
%>
                                    <img src="Imagenes/Compra/tarjeta.gif" align="middle"> Tarjeta de crédito
<%
                                    break;
                                case 3:
%>
                                    <img src="Imagenes/Compra/contrareembolso.gif" align="middle"> Contrareembolso
<%
                                    break;
                                case 4:
%>
                                    <img src="Imagenes/Compra/transferencia.gif" align="middle"> Transferencia
<%
                                    break;
                                default:
%>
                                    <img src="Imagenes/Compra/contrareembolso.gif"> Contrareembolso
<%
                                    break;
                            }                                        
%>
                        </div>
                    </td>
                </tr>
            </table>
            <div style="padding: 20px;">           
            <table border="1" cellspacing="0">
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
                double gastosEnvio = 0;
                double total = 0;
                for(Map.Entry<Integer, Integer> entry : listaCompra.entrySet()){
                    int idProducto = entry.getKey();
                    Productos producto = productosHelper.getProducto(idProducto);
                    total = total + (producto.getPrecio().doubleValue() * entry.getValue());
                    
                    if(total > 299.0){
                        gastosEnvio = 0.0;
                    }
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
                            <%=(producto.getPrecio().doubleValue() * entry.getValue())%>&#8364
                        </td>
                    </tr>
<%
                }
%>
                <tr class="cesta" border="0">
                    <td class="cesta" colspan="4" style="text-align: right;">
                        Gastos de envío:
                    </td>                   
                    <td class="cesta" style="text-align: center;">
                         <%=String.valueOf(gastosEnvio)%> &euro;
                    </td>
                </tr>
                <tr class="cesta" border="0">
                    <td class="cesta" colspan="4" style="text-align: right;">
                        <b>Total:</b>
                    </td>                   
                    <td class="cesta" colspan="5" style="text-align: center;">
                        <b><%=String.valueOf(total + gastosEnvio)%> &euro;</b>
                    </td>
                </tr>
            </table>
            </div>
        </td>
        <tr>
            <td colspan="2">
                <form action="panel.html" method="post">
                        <input type="hidden" name="accion" value="comprar">
                        <input type="hidden" name="formapago" value="<%=formaPago%>">
                        <div style="height: 20px; display: block;">&nbsp;</div>
                        <div style="font-size:0.82em;height: 23px;border: none;margin-left: 249px;">
                            <input type="submit" value="Comprar" style="float:right;">
                            <input type="button" onclick="parent.location='paso3.html'" value="Volver">
                        </div>
                </form>
            </td>
        </tr>
    </tr>
</table>
</div>