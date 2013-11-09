<%@page import="ClasesMusiteka.Transacciones"%>
<%@page import="java.util.List"%>
<%@page import="ClasesMusiteka.TransaccionesHelper"%>
<%@page import="ClasesMusiteka.Usuarios"%>
<%@page import="ClasesMusiteka.UsuariosHelper"%>
<%@page import="java.util.Map"%>
<%@page import="modelos.UsuarioNav"%>
<%
    UsuarioNav usuarioNav = new UsuarioNav();
    usuarioNav = (UsuarioNav) request.getSession().getAttribute("usuarioNav");
    Map<Integer, Integer> listaCompra = usuarioNav.getListaCompra();
    UsuariosHelper usuariosHelper = new UsuariosHelper();
    Usuarios usuario = usuariosHelper.getUsuario(usuarioNav.getIdusuario());
    TransaccionesHelper transaccionesHelper = new TransaccionesHelper();
    List<Transacciones> listaTransacciones = transaccionesHelper.getTransacciones((int)usuario.getIdusuario());
%>

<ul class="cabecera">
    Mi cuenta de usuario
</ul>

<ul class="contenido">
    <li><a href="panel.html">&nbsp&nbspVisión general</a></li>
    <li><a href="cuenta.html">&nbsp&nbspMis datos como usuario</a></li>
    <li><a href="direccion.html">&nbsp&nbspMi dirección</a></li>
<%  
    if((listaCompra != null)&&(!listaCompra.isEmpty())){
%>
        <li><a href="cesta.html">&nbsp&nbspMi cesta</a></li>
<%        
    }
%>    
</ul>