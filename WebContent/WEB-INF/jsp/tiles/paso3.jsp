<%@page import="modelos.MenuNav"%>
<%@page import="ClasesMusiteka.Usuarios"%>
<%@page import="ClasesMusiteka.UsuariosHelper"%>
<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="java.util.Map"%>
<%@page import="modelos.UsuarioNav"%>
<%
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
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
        <td rowspan="2" style=" width: 20%; background-color: white; vertical-align: top; border:1px solid white;">
            <img src="Imagenes/Compra/step3.jpg" width="188" height="200" style="border:none;">
        </td>
        <td style="background-color: white; border:1px solid white;">
            <div style="float: left; background: url('Imagenes/fondopasos.jpg') left center repeat-x; width: 20px; height: 20px; color: white; text-align: center; vertical-align: central;">
                3
            </div>
            <h3>&nbsp&nbspForma de pago</h3>
        </td>
    </tr>
    <tr style="border:1px solid white;">
        <td style="border:1px solid white;">
            <form action="paso4.html" method="post">
                <table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-size: 1.00em; color: #777;border-collapse: separate;background-color: #EEEEE9; background: linear-gradient(#EEEEE9,#BBBBBB);">
                    <colgroup>
                        <col width="30">
                        <col width="30">
                        <col width="*">
                    </colgroup>    
                    <tr>
                        <th colspan="3"><div style="height: 10px;"></div>¿Cómo quiere pagar?</th>
                    </tr>
                        <tr>
                            <td align="center" valign="middle" style="padding:10px;">
                                <input type="radio" name="formapago" value="1" checked="checked">
                            </td>
                            <td align="center" valign="middle" style="padding:10px;">
                                <img src="Imagenes/Compra/paypal.gif" width="24" height="24" style="border:none;">
                            </td>
                            <td align="left" valign="top" style="padding:10px;">
                                <b>PayPal</b>
                                <br>Pagar sencillo con PayPal
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" style="height:1px; border-top:1px dashed #BBBBBB;"></td>
                        </tr>

                        <tr>
                            <td align="center" valign="middle" style="padding:10px;">
                                <input type="radio" name="formapago" value="2">
                            </td>
                            <td align="center" valign="middle" style="padding:10px;">
                                <img src="Imagenes/Compra/tarjeta.gif" width="24" height="24" alt="" style="border:none;">
                            </td>
                            <td align="left" valign="top" style="padding:10px;">
                                <b>Tarjeta de crédito</b>
                                <br>Aceptamos VISA, Euro/Mastercard, American Express, JCB y Maestro
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" style="height:1px; border-top:1px dashed #BBBBBB;"></td>
                        </tr>

                        <tr>
                            <td align="center" valign="middle" style="padding:10px;">
                                <input type="radio" name="formapago" value="3">
                            </td>
                            <td align="center" valign="middle" style="padding:10px;">
                                <img src="Imagenes/Compra/transferencia.gif" width="24" height="24" alt="" style="border:none;">
                            </td>
                            <td align="left" valign="top" style="padding:10px;">
                                <b>Contrareembolso</b>
                                <br>El servicio del contrareembolso es gratuito
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3" style="height:1px; border-top:1px dashed #BBBBBB;"></td>
                        </tr>

                        <tr>
                            <td align="center" valign="middle" style="padding:10px;">
                                <input type="radio" name="formapago" value="4">
                            </td>
                            <td align="center" valign="middle" style="padding:10px;">
                                <img src="Imagenes/Compra/contrareembolso.gif" width="24" height="24" alt="" style="border:none;">
                            </td>
                            <td align="left" valign="top" style="padding:10px;">
                                <b>Transferencia bancaria</b>
                                <br>Nosotros realizaremos el envío de su compra nada más recibir el importe
                            </td>
                        </tr>               
                </table>
                <div style="height: 20px; display: block;">&nbsp;</div>
                <div style="font-size:0.82em;height: 23px;border: none;">
                    <input type="submit" value="Seguir" class="button" style="float:right;">
                    <input type="button" onclick="parent.location='paso2.html'" value="Volver">
                </div>
            </form>
        </td>        
    </tr>
</table>
</div>