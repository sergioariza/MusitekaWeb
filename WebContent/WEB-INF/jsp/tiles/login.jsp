<%@page import="modelos.UsuarioRegistro"%>
<%@page import="modelos.UsuarioLogin"%>
<%@page import="modelos.MenuNav"%>

<%
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    
    if(menuNav.getDescripcionLogin() != ""){
%>
    <div id="mensajeAdvertencia">
        <%=menuNav.getDescripcionLogin()%>
    </div>
<%
    }

    UsuarioLogin usuarioLogin;
    usuarioLogin = (UsuarioLogin) request.getAttribute("usuarioLogin");
    
    if(usuarioLogin == null){
        usuarioLogin = new UsuarioLogin();
    }
%>
<div id="login">
    <form action="login.html?opcion=login" method="post">
        <h1 class="login">Acceso</h1>
        
        <div id="hr">
        </div>
        
        <p class="login">¿Es ya cliente de Musiteka?<br>Entonces regístrese con sus datos de login.</p>
        
        <table width="100%">
            <colgroup>
                <col width="100">
                <col width="*">
            </colgroup>
        
            <tbody>
                <tr>
                    <td class="login">Dirección de e-mail*:</td>
                    <td class="login">
                        <input type="text" name="email" value="<%=usuarioLogin.getCorreo()%>" maxlength="255" style="width:290px;">
                    </td>
                </tr>
                
                <tr>
                    <td class="login">Contraseña*:</td>
                    <td class="login">
                        <input type="password" name="password" value="<%=usuarioLogin.getPassword()%>" maxlength="255" style="width:290px;">
                    </td>
                </tr>
      
                <tr>
                    <td class="login">                    
                    </td>
                    
                    <td class="login">
                        <a href="#" style="margin-top:15px;" onclick="menu('recordar')">¿Olvidaste tu contraseña?</a>
                    </td>
                </tr>
                
                <tr>
                    <td class="login" colspan="2" style="padding-top:15px; text-align: center">
                        <input type="submit" name="login" value="Seguir">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    
    <div style="height:15px;">&nbsp;</div>    
</div>

<%
    if(menuNav.getDescripcionLogin() != ""){
%>
<div id="recordar" style="top: 328px;">
    <%
       }else{
    %>
<div id="recordar" style="top: 277px;">    
    <%
       }
    %>
    <form action="login.html?opcion=recordar" method="post">  
        <h1 class="login">¿Ha olvidado su contraseña?</h1>
        <div id="hr">
        </div>
        <p class="login">Si lo desea se lo podemos volver a enviar por correo electrónico.</p>    
        <table width="100%">
            <colgroup>
                <col width="150">
                <col width="*">
            </colgroup>
                
            <tbody>
                <tr>
                    <td class="login">Dirección de e-mail*:</td>
                    <td class="login">
                        <input type="text" name="email" value="" maxlength="255" style="width:290px;"/> 
                    </td>
                </tr>
                        
                <tr>
                    <td class="login" colspan="2" style="padding-top:15px; text-align: center">
                        <input type="submit" value="Enviar">
                    </td>
                </tr>
            </tbody>
        </table>    
    </form>
</div>

<%
    UsuarioRegistro usuarioRegistro;
    usuarioRegistro = (UsuarioRegistro) request.getAttribute("usuarioRegistro");
    
    if(usuarioRegistro == null){
        usuarioRegistro = new UsuarioRegistro();
    }
%>

<div id="registro">
  <form action="login.html?opcion=alta" method="post">    
      <h1 class="login">¡Registrarse aquí!</h1>
      <div id="hr">
      </div>
      <p class="login" style="margin:10px 10px 10px 10px;">¿Quiere registrarse como cliente nuevo, para no tener que introducir cada vez sus datos?</p>
      
      <table width="100%">
        <colgroup>
          <col width="150">
          <col width="*">
        </colgroup>
        <tbody>
            <tr>
                <td class="login">Tratamiento*:</td>
                <td class="login" align="left">
<%
                    if(usuarioRegistro.getTratamiento() == "Sr."){
%>
                        <input type="radio" name="tratamiento" value="1" checked="checked">
<%
                    }else{
%>
                        <input type="radio" name="tratamiento" value="1">
<%
                    }
%>
                    <label for="tratamiento2" style="margin-right:15px;">
                        Sr.
                    </label>
<%
                    if(usuarioRegistro.getTratamiento() == "Sra."){
%>
                        <input type="radio" name="tratamiento" value="2" checked="checked">
<%
                    }else{
%>
                        <input type="radio" name="tratamiento" value="2">
<%
                    }
%>
                    <label for="tratamiento1" style="margin-right:15px;">
                        Sra.
                    </label>
                </td>
            </tr>
        </tbody>
      </table>
      
      <table width="100%">
        <colgroup>
          <col width="150">
          <col width="*">
        </colgroup>
        <tbody><tr>
          <td class="login">Nombre*:</td>
          <td class="login"><input type="text" name="nombre" value="<%=usuarioRegistro.getNombre()%>" maxlength="50" class="" style="width:295px;"></td>
        </tr>
        <tr>
          <td class="login">Apellidos*:</td>
          <td class="login"><input type="text" name="apellidos" value="<%=usuarioRegistro.getApellidos()%>" maxlength="50" class="" style="width:295px;"></td>
        </tr>
        <tr>
          <td class="login">Dirección*:</td>
          <td class="login"><input type="text" name="calle" value="<%=usuarioRegistro.getCalle()%>" maxlength="100" class="" style="width:295px;"></td>
        </tr>
        <tr>
          <td class="login">Número y piso:</td>
          <td class="login"><input type="text" name="numeroypiso" value="<%=usuarioRegistro.getNumeroypiso()%>" size="10" maxlength="50"></td>
        </tr>
        <tr>
          <td class="login">Código Postal*:</td>
          <td><input type="text" name="codigopostal" value="<%=usuarioRegistro.getCodpostal()%>" size="10" maxlength="10"></td>
        </tr>
        <tr>
          <td class="login">Localidad (Provincia)*:</td>
          <td><input type="text" name="localidad" value="<%=usuarioRegistro.getLocalidad()%>" style="width:295px;"></td>
        </tr>
        <tr>
          <td class="login">País*:</td>
          <td class="login">
            <select size="1" name="pais">              
                    <option value="1">Austria</option>                
                    <option value="2">Bélgica</option>                
                    <option value="3">Bulgaria</option>                
                    <option value="4">República Checa</option>                
                    <option value="5">Dinamarca</option>                
                    <option value="6">Estonia</option>                
                    <option value="7">Finlandia</option>                
                    <option value="8">Francia</option>                
                    <option value="9">Alemania</option>                
                    <option value="10">Grecia</option>                
                    <option value="11">Hungría</option>                
                    <option value="12">Irlanda</option>                
                    <option value="13">Italia</option>              
                    <option value="14">Letonia</option>                
                    <option value="15">Liechtenstein</option>                
                    <option value="16">Lituania</option>                
                    <option value="17">Luxemburgo</option>                
                    <option value="18">Malta</option>                
                    <option value="19">Holanda</option>                
                    <option value="20">Noruega</option>                
                    <option value="21">Polonia</option>                
                    <option value="22">Portugal</option>                
                    <option value="23">Rumanía</option>                
                    <option value="24">Rusia</option>                
                    <option value="25">Eslovakia</option>                
                    <option value="26">Eslovenia</option>                
                    <option value="27" selected="selected">España</option>                
                    <option value="28">Suecia</option>                
                    <option value="29">Suiza</option>                
                    <option value="30">Turquía</option>                
                    <option value="31">Reino Unido</option>                
                    <option value="32">Chipre</option>                
            </select>
          </td>
        </tr>
        <tr>
          <td class="login">DNI/NIE/Pasaporte/CIF*:</td>
          <td>
              <select size="1" name="tipodocumento">              
                    <option value="0" selected="selected">DNI</option>                
                    <option value="1">NIE</option>                
                    <option value="2">Pasaporte</option>
                    <option value="3">CIF</option>
              </select>
          </td>
        </tr>
        <tr>
          <td class="login">Documento*:</td>
          <td><input type="text" name="documento" value="<%=usuarioRegistro.getDocumento()%>" class="" style="width:295px;"></td>
        </tr>
        <tr>
          <td class="login" colspan="2" style="height:10px;"></td>
        </tr>
        <tr>
          <td class="login" colspan="2">
            <div id="hr">
            </div>
          </td>
        </tr>
        <tr>
          <td class="login">
              Dirección de e-mail*:
          </td>
          <td class="login">
              <input type="text" name="email" value="<%=usuarioRegistro.getCorreo()%>" maxlength="255" style="width:295px">
          </td>
        </tr>
        <tr>
          <td class="login">
              Contraseña*:
          </td>
          
          <td class="login">
              <input type="password" name="password" value="<%=usuarioRegistro.getPassword()%>" size="20" maxlength="20" style="width:295px">
          </td>
        </tr>
        <tr>
          <td class="login">
              Repetir contraseña*:
          </td>
          <td class="login">
              <input type="password" name="passwordRepetir" value="<%=usuarioRegistro.getPasswordRepetir()%>" size="20" maxlength="20" style="width:295px">
          </td>
        </tr>
        <tr>
          <td class="login" style="padding:10px 2px 0px 0px; text-align:left;">
              * Campos obligatorios
          </td>
          
          <td class="login" style="padding:10px 2px 0px 0px; text-align:right;">
              <input type="submit" value="Seguir" class="button">
          </td>
        </tr>
      </tbody></table>
  </form>
</div>