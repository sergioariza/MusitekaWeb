<%@page import="modelos.MenuNav"%>
<%@page import="ClasesMusiteka.*" %>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<ul class="cabecera">
    <c:if test="${menuNav.nivel == 0}">
        Instrumentos de música
    </c:if>
    
    <c:if test="${menuNav.nivel > 0}">
        Categoría
    </c:if>
</ul>
<%
    ProductosHelper productosHelper = new ProductosHelper();
    ClasesproductosHelper clasesproductosHelper = new ClasesproductosHelper();
    SubclasesproductosHelper subclasesproductosHelper = new SubclasesproductosHelper();
    List<String> marcas = null;
    MenuNav producto = null;
%>
<ul class="contenido">    
    <c:if test="${menuNav.nivel == 0}">
        <%
            List<Clasesproductos> listaClasesProductos = clasesproductosHelper.getProductos();
            
            for (int i = 0; i < listaClasesProductos.size(); i++) {
                Clasesproductos cp = (Clasesproductos) listaClasesProductos.get(i);
        %>
                <li><a href="index.html?niv=1&id=<%=cp.getIdclaseproducto()%>">&nbsp&nbsp<c:out value="<%=cp.getDescclaseproducto()%>"/></a></li>
        <%
            }
        %>        
    </c:if>    
    
    <c:if test="${menuNav.nivel == 1}">
        <%
            producto = (MenuNav) request.getAttribute("menuNav");
            List<Subclasesproductos> listaSubclasesproductos = subclasesproductosHelper.getSubproductos(producto.getProducto());
            
            for (int i = 0; i < listaSubclasesproductos.size(); i++) {
                Subclasesproductos scp = (Subclasesproductos) listaSubclasesproductos.get(i);                
        %>
                <li><a href="index.html?niv=2&id=<%=scp.getIdsubclaseproducto()%>">&nbsp&nbsp<c:out value="<%=scp.getDescsubclaseproducto()%>"/></a></li>
        <%
            }
        %>
    </c:if>
            
    <c:if test="${menuNav.nivel == 2}">
<%
        producto = (MenuNav) request.getAttribute("menuNav");
        marcas = productosHelper.getMarcasSubclaseProductos(producto.getProducto());
        String subclaseProducto = subclasesproductosHelper.getNombreSubproducto(producto.getProducto());
%>
        &nbsp&nbsp<%=subclaseProducto%>      
    </c:if>
</ul>

<c:if test="${menuNav.nivel < 2}">
    <ul class="cabecera">
        Tienda de música   
    </ul>
        
    <ul class="contenido">
        <li><a href="marcas.html">&nbsp&nbspMarcas de la A a la Z</a></li>            
        <li><a href="novedades.html">&nbsp&nbspNovedades</a></li>
    </ul>
</c:if>

<c:if test="${menuNav.nivel == 2}">   
<%  
    if(marcas.size()>0){
%>
        <ul class="cabecera">
            Marcas 
        </ul>
        
        <ul class="contenido">
<%                    
            for(int i = 0; i < marcas.size(); i++){
%>
                <li><a href="index.html?niv=2&id=<%=producto.getProducto()%>&marca=<%=marcas.get(i)%>">&nbsp&nbsp<%=marcas.get(i)%></a></li>
<%    
            }
%>
        </ul>
<%
    }
%>
</c:if>