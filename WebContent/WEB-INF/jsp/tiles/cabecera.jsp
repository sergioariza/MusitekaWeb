<%@page import="java.util.Map"%>
<%@page import="ClasesMusiteka.ProductosHelper"%>
<%@page import="ClasesMusiteka.SubclasesproductosHelper"%>
<%@page import="ClasesMusiteka.Subclasesproductos"%>
<%@page import="ClasesMusiteka.Productos"%>
<%@page import="ClasesMusiteka.ClasesproductosHelper"%>
<%@page import="java.util.List"%>
<%@page import="modelos.*"%>

<%
    UsuarioNav usuarioNav = (UsuarioNav) session.getAttribute("usuarioNav");
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    String marca = (String) request.getParameter("marca");
    ClasesproductosHelper clasesproductosHelper = null;
    SubclasesproductosHelper subclasesproductosHelper = null;
    String claseProducto = null;
    String subclaseProducto = null;
    Map<Integer,Integer> listaCompra = usuarioNav.getListaCompra();
    
    if((menuNav.getNivel() == 3)&&(request.getParameter("accion") != null)&&(request.getParameter("accion").compareTo("agregar") == 0)){
        Productos producto = new Productos();
        ProductosHelper productosHelper = new ProductosHelper();
        producto = productosHelper.getProducto(menuNav.getProducto());
        
        if(listaCompra.containsKey((int)producto.getIdproducto())){
%>
            <script type="text/javascript">productoYaAgregado();</script>
<%
        }else{
            if(usuarioNav.getNombre().compareTo("Invitado") == 0){
%>
                <script type="text/javascript">errorInvitado();</script>
<%                
            }else{
                listaCompra.put((int)producto.getIdproducto(), 1);
                usuarioNav.setListaCompra(listaCompra);
                session.setAttribute("usuarioNav", usuarioNav);
            }
        }
    }   
%>

<table class="tablaCabecera">
    <tr>
        <td rowspan="2"><a href="index.html"><img class="mimagen" src="Imagenes/logo.png" width="200" height="100" hspace="10" border="0"></a></td>
        <td colspan="9" class="usuario">
            <%  
                if(usuarioNav.getNombre() == "Invitado"){
            %>    
                    Bienvenido a Musiteka.&nbsp
                    <a href="login.html?opcion=inicio"><%=usuarioNav.getNombre()%>.</a>
                    &nbsp¿Eres un cliente nuevo?
                    <a href="login.html?opcion=inicio">Empieza aquí, por favor.</a>
<%
                }else{
%>
                    &nbspHola <a href="panel.html"><%=usuarioNav.getNombre()%>.</a>
                    Bienvenido a la Musiteka. 
                    <a href="login.html?opcion=logout">Cierre de sesión.</a>
                    <td class="usuario" colspan="2">
                        <a href="panel.html">Mi cuenta de usuario</a>
                    </td>
<%
                }
%>
        </td>
    </tr>
            
    <tr>
        <td>Envío gratuito a <br>partir de 299 euros</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
        <td>Garantía precio bajo <br>El precio más bajo en Internet</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
        <td>30 días de <br>Garantía Money Back</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
        <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
<%
        if((listaCompra != null)&&(listaCompra.size() > 0)){
%>
            <td style="width: 80px; font-size: 0.78em;"><a href="cesta.html">Tiene productos en su cesta</a></td>
<%
    
        }else{
%>
            <td style="width: 80px;">La cesta está vacía</td>
<%
        }
%>
        <td><img class="mimagen" src="Imagenes/logo2.png" width="50" height="50" hspace="10"></td>
    </tr>
</table>

<ul class="menu">
    <li><a href="index.html?niv=1&id=1" onmouseover="mopen('guitarras')" onmouseout="mclosetime()">Guitarras</a>
        <div id="guitarras" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=1">Guitarras eléctricas</a></li>
                <li><a href="index.html?niv=2&id=2">Guitarras acústicas</a></li>
                <li><a href="index.html?niv=2&id=3">Guitarras clásicas</a></li>
		<li><a href="index.html?niv=2&id=4">Amplificadores</a></li>
		<li><a href="index.html?niv=2&id=5">Efectos</a></li>
		<li><a href="index.html?niv=2&id=6">Cuerdas</a></li>
		<li><a href="index.html?niv=2&id=7">Pastillas</a>
            </ul>
        </div>        
    </li>
    
    <li><a href="index.html?niv=1&id=2" onmouseover="mopen('bajos')" onmouseout="mclosetime()">Bajos</a>
        <div id="bajos" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=16">Bajos eléctricos</a></li>
		<li><a href="index.html?niv=2&id=17">Bajos acústicos</a></li>
		<li><a href="index.html?niv=2&id=18">Amplificadores</a></li>
		<li><a href="index.html?niv=2&id=19">Efectos</a></li>
		<li><a href="index.html?niv=2&id=20">Cuerdas</a></li>
		<li><a href="index.html?niv=2&id=21">Pastillas</a></li>
		<li><a href="index.html?niv=2&id=22">Fundas</a></li>
            </ul>
        </div>
    </li>
    
    <li><a href="index.html?niv=1&id=3" onmouseover="mopen('bateria-y-percusion')" onmouseout="mclosetime()">Baterías</a>
        <div id="bateria-y-percusion" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=29">Baterías acústicas</a></li>
		<li><a href="index.html?niv=2&id=30">Baterías eléctricas</a></li>
		<li><a href="index.html?niv=2&id=31">Platos batería</a></li>
		<li><a href="index.html?niv=2&id=32">Parches batería</a></li>
		<li><a href="index.html?niv=2&id=33">Baquetas y mazas</a></li>
		<li><a href="index.html?niv=2&id=34">Herrajes batería</a></li>
            </ul>
        </div>        
    </li>
            
    <li><a href="index.html?niv=1&id=4" onmouseover="mopen('teclados')" onmouseout="mclosetime()">Teclados</a>
        <div id="teclados" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=48">Teclados</a></li>
                <li><a href="index.html?niv=2&id=49">Órganos</a></li>
		<li><a href="index.html?niv=2&id=50">Teclados controladores</a></li>
		<li><a href="index.html?niv=2&id=51">Sintetizadores/samples</a></li>
		<li><a href="index.html?niv=2&id=52">Pianos escenario</a></li>
		<li><a href="index.html?niv=2&id=53">Pianos digitales</a></li>
            </ul>
        </div>
    </li>
    
    <li><a href="index.html?niv=1&id=7" onmouseover="mopen('microfono')" onmouseout="mclosetime()">Micrófonos</a>
        <div id="microfono" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=90">Para locución y voz</a></li>
		<li><a href="index.html?niv=2&id=91">Para instrumentos</a></li>
		<li><a href="index.html?niv=2&id=92">Instrumentos y voz</a></li>
		<li><a href="index.html?niv=2&id=93">Estudio y grabación</a></li>
		<li><a href="index.html?niv=2&id=94">Sistemas inalámbricos</a></li>
		<li><a href="index.html?niv=2&id=95">Accesorios micrófono</a></li>
            </ul>
        </div>        
    </li>
            
    <li><a href="index.html?niv=1&id=5" onmouseover="mopen('viento')" onmouseout="mclosetime()">Viento</a>
        <div id="viento" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=62">Trompetas</a></li>
		<li><a href="index.html?niv=2&id=63">Saxofones</a></li>
		<li><a href="index.html?niv=2&id=64">Trombones</a></li>
		<li><a href="index.html?niv=2&id=65">Flautas traveseras</a></li>
		<li><a href="index.html?niv=2&id=66">Clarinetes</a></li>
		<li><a href="index.html?niv=2&id=67">Flautas dulces</a></li>
		<li><a href="index.html?niv=2&id=68">Melódicas</a></li>
		<li><a href="index.html?niv=2&id=69">Armónicas</a></li>
            </ul>
        </div>
    </li>
    
    <li><a href="index.html?niv=1&id=8" onmouseover="mopen('sonido')" onmouseout="mclosetime()">Sonido</a>
        <div id="sonido" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=96">Mezcladores</a></li>
		<li><a href="index.html?niv=2&id=97">Previo</a></li>
		<li><a href="index.html?niv=2&id=98">Etapas</a></li>
		<li><a href="index.html?niv=2&id=99">Altavoces</a></li>
		<li><a href="index.html?niv=2&id=100">Monitor in ear</a></li>
		<li><a href="index.html?niv=2&id=101">CD/DVD/MP3</a></li>
            </ul>
        </div>        
    </li>
    
    <li><a href="index.html?niv=1&id=9" onmouseover="mopen('dj')" onmouseout="mclosetime()">DJ</a>
        <div id="dj" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=2&id=116">Controladores DJ</a></li>
		<li><a href="index.html?niv=2&id=117">Mezcladores DJ</a></li>
		<li><a href="index.html?niv=2&id=118">Tocadiscos</a></li>
		<li><a href="index.html?niv=2&id=119">Reproductor CD</a></li>
		<li><a href="index.html?niv=2&id=120">Auriculares</a></li>
		<li><a href="index.html?niv=2&id=121">Cápsulas giradiscos</a></li>
            </ul>
        </div>
    </li>
    
    <li><a onmouseover="mopen('otros')" onmouseout="mclosetime()">Otros</a>
        <div id="otros" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
            <ul>
                <li><a href="index.html?niv=1&id=10">Estudio y grabación</a></li>
		<li><a href="index.html?niv=1&id=11">Iluminación y escenario</a></li>
		<li><a href="index.html?niv=1&id=12">Accesorios</a></li>
		<li><a href="index.html?niv=1&id=13">Medios</a></li>
		<li><a href="index.html?niv=1&id=14">Vestuario</a></li>
                <li><a href="index.html?niv=1&id=15">Artículos de regalo</a></li>
            </ul>
        </div>
    </li>
</ul>

<%--
<%
    if(menuNav.getNivel() > 0){
        ClasesproductosHelper clasesproductosHelper = new ClasesproductosHelper();
        String claseProducto = clasesproductosHelper.getNombreProducto(menuNav.getProducto());
%>
        <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
        &nbsp>&nbsp
        <span class="indice"><%=claseProducto%></span>
<%
    }else{
        if((menuNav.getDescripcion().compareTo("")) != 0){
%>
            <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
            &nbsp>&nbsp
            <span class="indice"><%=menuNav.getDescripcion()%></span>
<%
        }
    }
%>
--%>
<%
    switch(menuNav.getNivel()){
        case 0:
            if((menuNav.getDescripcion().compareTo("")) != 0){
%>
            <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
            &nbsp>&nbsp
            <span class="indice"><%=menuNav.getDescripcion()%></span>
<%
            }
            break;
        case 1:
            clasesproductosHelper = new ClasesproductosHelper();
            claseProducto = clasesproductosHelper.getNombreProducto(menuNav.getProducto());
%>
            <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
            &nbsp>&nbsp
            <span class="indice"><%=claseProducto%></span>
<%
            break;
        case 2:
            clasesproductosHelper = new ClasesproductosHelper();
            subclasesproductosHelper = new SubclasesproductosHelper();
            int idClaseProducto = subclasesproductosHelper.getIdClaseProducto(menuNav.getProducto());
            claseProducto = clasesproductosHelper.getNombreProducto(idClaseProducto);
            subclaseProducto = subclasesproductosHelper.getNombreSubproducto(menuNav.getProducto());
            if(marca == null){
%>
                <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
                &nbsp>&nbsp
                <span class="indice"><a href="index.html?niv=1&id=<%=idClaseProducto%>"><%=claseProducto%></a></span>
                &nbsp>&nbsp
                <span class="indice"><%=subclaseProducto%></span>
<%
            }else{
%>
                <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
                &nbsp>&nbsp
                <span class="indice"><a href="index.html?niv=1&id=<%=idClaseProducto%>"><%=claseProducto%></a></span>
                &nbsp>&nbsp
                <span class="indice"><a href="index.html?niv=2&id=<%=menuNav.getProducto()%>"><%=subclaseProducto%></a></span>
                &nbsp>&nbsp
                <span class="indice"><%=marca%></span>
<%                
            }
            break;
        case 3:
            clasesproductosHelper = new ClasesproductosHelper();
            subclasesproductosHelper = new SubclasesproductosHelper();
            ProductosHelper productosHelper = new ProductosHelper();
            int idClaseproducto = productosHelper.getIdClaseProducto(menuNav.getProducto());
            int idSubclaseproducto = productosHelper.getIdSubclaseProducto(menuNav.getProducto());
            String nombreClaseproducto = clasesproductosHelper.getNombreProducto(idClaseproducto);
            String nombreSubclaseproducto = subclasesproductosHelper.getNombreSubproducto(idSubclaseproducto);
            String nombreProducto = productosHelper.getMarcaymodelo(menuNav.getProducto());
            marca = productosHelper.getMarca(menuNav.getProducto());
%>
            <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
            &nbsp>&nbsp
            <span class="indice"><a href="index.html?niv=1&id=<%=idClaseproducto%>"><%=nombreClaseproducto%></a></span>
            &nbsp>&nbsp
            <span class="indice"><a href="index.html?niv=2&id=<%=idSubclaseproducto%>"><%=nombreSubclaseproducto%></a></span>
            &nbsp>&nbsp
            <span class="indice"><a href="index.html?niv=2&id=<%=idSubclaseproducto%>&marca=<%=marca%>"><%=marca%></a></span>
            &nbsp>&nbsp
            <span class="indice"><%=nombreProducto%></span>
<%
            break;
        default:
            if((menuNav.getDescripcion().compareTo("")) != 0){
%>
            <span class="indice">&nbsp&nbsp&nbsp&nbsp&nbsp<a href="index.html">Página de inicio</a></span>
            &nbsp>&nbsp
            <span class="indice"><%=menuNav.getDescripcion()%></span>
<%
            }
            break;
    }
%>