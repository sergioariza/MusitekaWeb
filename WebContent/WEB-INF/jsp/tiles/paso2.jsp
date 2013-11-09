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
    UsuariosHelper usuariosHelper = new UsuariosHelper();
    Usuarios usuario = usuariosHelper.getUsuario(usuarioNav.getIdusuario());
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
<table border="0" style="border-collapse: collapse; width: 1250px; background-color: #EEEEE9; background: linear-gradient(#EEEEE9,#BBBBBB); border:1px solid white; padding: 10px;">
    <col width="100">
    <col width="600">
    <col width="150">
    <col width="150">
    <tr style="border:1px solid white; vertical-align: top;">
        <td rowspan="2" style=" width: 20%; background-color: white; border:1px solid white; vertical-align: top;">
            <img src="Imagenes/Compra/step2.jpg" width="188" height="200" style="border:none;">
        </td>
        <td style="background-color: white; border:1px solid white;">
            <div style="float: left; background: url('Imagenes/fondopasos.jpg') left center repeat-x; width: 20px; height: 20px; color: white; text-align: center; vertical-align: central;">
                2
            </div>
            <h3>&nbsp&nbspSus datos / dirección</h3>
        </td>
    </tr>
    <tr>
        <td>
            <div style="margin: 20px;">
            <form method="post" action="paso2.html">
                <input type="hidden" name="accion" value="modificar">
                <input type="hidden" name="idDomicilio" value="<%=usuario.getDomicilios().getIddomicilio()%>">
                <table cellspacing="1" cellpadding="0" border="0" style="font-size: 1.00em; color: #777;">
                    <tbody>
                    <tr>
                        <td>
                            Dirección:
                        </td>
                        <td>
                            <input type="text" name="calle" value="<%=usuario.getDomicilios().getNombrevia()%>" size="50">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Número y piso:
                        </td>
                        <td>
                            <input type="text" name="numeroypiso" value="<%=usuario.getDomicilios().getNumeropiso()%>" size="50">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Código Postal:
                        </td>
                        <td>
                            <input type="text" name="codigopostal" value="<%=usuario.getDomicilios().getCodigopostal()%>" size="10">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Localidad (Provincia):
                        </td>
                        <td>
                            <input type="text" name="localidadprovincia" value="<%=usuario.getDomicilios().getLocalidadprovincia()%>" size="40">
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                            País:
                        </td>
                        <td>
                            <select size="1" name="pais">
<%
                                if(usuario.getDomicilios().getPaises().getIdpais() == 1){
%>
                                    <option value="1" selected="selected">Austria</option>
<%                                    
                                }else{
%>
                                    <option value="1">Austria</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 2){
%>
                                    <option value="2" selected="selected">Bélgica</option>
<%                                    
                                }else{
%>
                                    <option value="2">Bélgica</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 3){
%>
                                    <option value="3" selected="selected">Bulgaria</option>
<%                                    
                                }else{
%>
                                    <option value="3">Bulgaria</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 4){
%>
                                    <option value="4" selected="selected">República Checa</option>
<%                                    
                                }else{
%>
                                    <option value="4">República Checa</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 5){
%>
                                    <option value="5" selected="selected">Dinamarca</option>
<%                                    
                                }else{
%>
                                    <option value="5">Dinamarca</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 6){
%>
                                    <option value="6" selected="selected">Estonia</option>
<%                                    
                                }else{
%>
                                    <option value="6">Estonia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 7){
%>
                                    <option value="7" selected="selected">Finlandia</option>
<%                                    
                                }else{
%>
                                    <option value="7">Finlandia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 8){
%>
                                    <option value="8" selected="selected">Francia</option>
<%                                    
                                }else{
%>
                                    <option value="8">Francia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 9){
%>
                                    <option value="9" selected="selected">Alemania</option>
<%                                    
                                }else{
%>
                                    <option value="9">Alemania</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 10){
%>
                                    <option value="10" selected="selected">Grecia</option>
<%                                    
                                }else{
%>
                                    <option value="10">Grecia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 11){
%>
                                    <option value="11" selected="selected">Hungría</option>
<%                                    
                                }else{
%>
                                    <option value="11">Hungría</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 12){
%>
                                    <option value="12" selected="selected">Irlanda</option>
<%                                    
                                }else{
%>
                                    <option value="12">Irlanda</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 13){
%>
                                    <option value="13" selected="selected">Italia</option>
<%                                    
                                }else{
%>
                                    <option value="13">Italia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 14){
%>
                                    <option value="14" selected="selected">Letonia</option>
<%                                    
                                }else{
%>
                                    <option value="14">Letonia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 15){
%>
                                    <option value="15" selected="selected">Liechtenstein</option>
<%                                    
                                }else{
%>
                                    <option value="15">Liechtenstein</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 16){
%>
                                    <option value="16" selected="selected">Lituania</option>
<%                                    
                                }else{
%>
                                    <option value="16">Lituania</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 17){
%>
                                    <option value="17" selected="selected">Luxemburgo</option>
<%                                    
                                }else{
%>
                                    <option value="17">Luxemburgo</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 18){
%>
                                    <option value="18" selected="selected">Malta</option>
<%                                    
                                }else{
%>
                                    <option value="18">Malta</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 19){
%>
                                    <option value="19" selected="selected">Holanda</option>
<%                                    
                                }else{
%>
                                    <option value="19">Holanda</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 20){
%>
                                    <option value="20" selected="selected">Noruega</option>
<%                                    
                                }else{
%>
                                    <option value="20">Noruega</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 21){
%>
                                    <option value="21" selected="selected">Polonia</option>
<%                                    
                                }else{
%>
                                    <option value="21">Polonia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 22){
%>
                                    <option value="22" selected="selected">Portugal</option>
<%                                    
                                }else{
%>
                                    <option value="22">Portugal</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 23){
%>
                                    <option value="23" selected="selected">Rumanía</option>
<%                                    
                                }else{
%>
                                    <option value="23">Rumanía</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 24){
%>
                                    <option value="24" selected="selected">Rusia</option>
<%                                    
                                }else{
%>
                                    <option value="24">Rusia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 25){
%>
                                    <option value="25" selected="selected">Eslovakia</option>
<%                                    
                                }else{
%>
                                    <option value="25">Eslovakia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 26){
%>
                                    <option value="26" selected="selected">Eslovenia</option>
<%                                    
                                }else{
%>
                                    <option value="26">Eslovenia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 27){
%>
                                    <option value="27" selected="selected">España</option>
<%                                    
                                }else{
%>
                                    <option value="27">España</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 28){
%>
                                    <option value="28" selected="selected">Suecia</option>
<%                                    
                                }else{
%>
                                    <option value="28">Suecia</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 29){
%>
                                    <option value="29" selected="selected">Suiza</option>
<%                                    
                                }else{
%>
                                    <option value="29">Suiza</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 30){
%>
                                    <option value="30" selected="selected">Turquía</option>
<%                                    
                                }else{
%>
                                    <option value="30">Turquía</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 31){
%>
                                    <option value="31" selected="selected">Reino Unido</option>
<%                                    
                                }else{
%>
                                    <option value="31">Reino Unido</option>
<%        
                                }

                                if(usuario.getDomicilios().getPaises().getIdpais() == 32){
%>
                                    <option value="32" selected="selected">Chipre</option>
<%                                    
                                }else{
%>
                                    <option value="32">Chipre</option>
<%        
                                }
%>                                                    
                            </select>
                        </td>
                    </tr>
                </tbody>
                </table>
                <br/>
                <div style="text-align: center">
                    <input type="submit" value="Editar">
                </div>
            </form>
        </div>
        </td>
        
    </tr>
</table>
<br/>
<table border="0" align="center">
    <col width="358">
    <col width="1100">
    <tr>
        <td style="text-align: right;">
            <form method="post" action="cesta.html">
                <input type="submit" value="Volver">
            </form>
        </td>
        <td style="text-align: right;">
            <form method="post" action="paso3.html">
                <input type="submit" value="Siguiente">
            </form>
        </td>
    </tr>
</table>
</div>