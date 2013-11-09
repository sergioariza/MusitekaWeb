<%@page import="modelos.MenuNav"%>
<%@page import="ClasesMusiteka.DocumentosHelper"%>
<%@page import="ClasesMusiteka.Usuarios"%>
<%@page import="ClasesMusiteka.UsuariosHelper"%>
<%@page import="modelos.UsuarioNav"%>

<%
    UsuarioNav usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    UsuariosHelper usuariosHelper = new UsuariosHelper();
    Usuarios usuario = usuariosHelper.getUsuario(usuarioNav.getIdusuario());
%>

<div style="margin: 20px;">  
    <h3 class="login" style="margin-left: 10px;">
         Mis datos como usuario
    </h3>   
  
    <p class="login">
        En este formulario puedes cambiar tus datos de usuario y de contacto.
    </p>
    
    <div style="height: 7px; color: #456; margin-left: 10px;">
    </div>
   
<%
    if((menuNav.getDescripcionLogin() != null)&&(menuNav.getDescripcionLogin().compareTo("") != 0)){
%>
        <div id="mensajeAdvertencia" style="margin-top: -3px;">        
            <%=menuNav.getDescripcionLogin()%>
        </div>
<%        
    }
%>
    
    <div class="panel" style="float: left; width: 840px; height:305px; margin-top: -1px;">
        <h3>
            Modificar datos de usuario
        </h3>

        <div style="margin: 20px;">
            <form method="post" action="cuenta.html">
                <input type="hidden" name="accion" value="modificar">
                <input type="hidden" name="idUsuario" value="<%=(int)usuario.getIdusuario()%>">
                <table cellspacing="1" cellpadding="0" border="0" style="font-size: 1.00em; color: #777;">
                    <tbody>
                    <tr>
                        <td>
                            Tratamiento:
                        </td>
                        <td>
<%
                            if(usuario.getTratamiento().compareTo("Sr.") == 0){
%>
                                <input type="radio" name="tratamiento" value="1" checked="checked">
<%
                            }else{
%>
                                <input type="radio" name="tratamiento" value="1">
<%
                            }
%>
                            <span style="margin-right:15px;">
                                Sr.
                            </span>
<%
                            if(usuario.getTratamiento().compareTo("Sra.") == 0){
%>
                                <input type="radio" name="tratamiento" value="2" checked="checked">
<%
                            }else{
%>
                                <input type="radio" name="tratamiento" value="2">
<%
                            }
%>
                            <span style="margin-right:15px;">
                                Sra.
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nombre:
                        </td>
                        <td>
                            <input type="text" name="nombre" value="<%=usuario.getNombre()%>" size="50">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Apellidos:
                        </td>
                        <td>
                            <input type="text" name="apellidos" value="<%=usuario.getApellidos()%>" size="50">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Correo:
                        </td>
                        <td>
                            <input type="text" name="correo" value="<%=usuario.getEmail()%>" size="50">
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
                            <select size="1" name="tipodocumento">
<%
                                if((int)usuario.getDocumentos().getTiposdocumentos().getIdtipodocumento() == 0){
%>
                                    <option value="0" selected="selected">DNI</option>
<%                                    
                                }else{
%>
                                    <option value="0">DNI</option> 
<%        
                                }

                                if((int)usuario.getDocumentos().getTiposdocumentos().getIdtipodocumento() == 1){
%>
                                    <option value="1" selected="selected">NIE</option>
<%                                    
                                }else{
%>
                                    <option value="1">NIE</option> 
<%        
                                }

                                if((int)usuario.getDocumentos().getTiposdocumentos().getIdtipodocumento() == 2){
%>
                                    <option value="2" selected="selected">Pasaporte</option>
<%                                    
                                }else{
%>
                                    <option value="2">Pasaporte</option> 
<%        
                                }

                                if((int)usuario.getDocumentos().getTiposdocumentos().getIdtipodocumento() == 3){
%>
                                    <option value="3" selected="selected">CIF</option>
<%                                    
                                }else{
%>
                                    <option value="3">CIF</option> 
<%        
                                }
%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Documento:
                        </td>
                        <td>
                            <input type="text" name="documento" value="<%=usuario.getDocumentos().getDocumento()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Contraseña:
                        </td>
                        <td>
                            <input type="password" name="password" value="<%=usuario.getPassword()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Repetir contraseña:
                        </td>
                        <td>
                            <input type="password" name="passwordRepetir" value="<%=usuario.getPassword()%>">
                        </td>
                    </tr>
                </tbody>
                </table>
                <div style="text-align: center">
                    <input type="submit" value="Editar">
                </div>
            </form>
        </div>
    </div>
  <div style="clear: both;"></div>
</div>