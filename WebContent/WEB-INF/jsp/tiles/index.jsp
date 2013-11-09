<%@page import="modelos.MenuNav"%>
<%@page import="ClasesMusiteka.*"%>
<%@page import="java.util.List"%>

<%
    int casilla = 0;
    MenuNav menuNav = (MenuNav) request.getAttribute("menuNav");
    ClasesproductosHelper clasesproductosHelper = new ClasesproductosHelper();
    SubclasesproductosHelper subclasesproductosHelper = new SubclasesproductosHelper();
    ProductosHelper productosHelper = new ProductosHelper();
    List lista = null;
%>

<%
    if(menuNav.getNivel() == 0){
        lista = productosHelper.getProductos();
%>
        
        <div id="slide">       
            <div id="gallery">
                <img src="Imagenes/Slide/1.jpg" />
                <img src="Imagenes/Slide/2.jpg" />
                <img src="Imagenes/Slide/3.jpg" />
                <img src="Imagenes/Slide/4.jpg" />
                <img src="Imagenes/Slide/5.jpg" />
                <img src="Imagenes/Slide/6.jpg" />
                <img src="Imagenes/Slide/7.jpg" />
            </div>

            <div id="thumbs">
                <img src="Imagenes/Slide/11.jpg" />
                <img src="Imagenes/Slide/22.jpg" />
                <img src="Imagenes/Slide/33.jpg" />
                <img src="Imagenes/Slide/44.jpg" />
                <img src="Imagenes/Slide/55.jpg" />
                <img src="Imagenes/Slide/66.jpg" />
                <img src="Imagenes/Slide/77.jpg" /> 
            </div>
            
            <a href="#" id="next"></a>
        </div>       
        
        <div id="bienvenida">
            Últimos productos:
            
            <table id="bienvenida" style="border: dotted 1px #999999;">
                <tr>
<%
                    for(int i=0; i < 6; i++){
                        Productos producto = (Productos) lista.get(i);
%>
                        <td>
                            <a href="producto.html?id=<%=producto.getIdproducto()%>" id="bienvenida">
                                <table border="0" id="bienvenida">
                                    <tr>
                                        <td rowspan="4">
                                            <img src="Imagenes/Productos/<%=producto.getIdproducto()%>.png" width="50" height="50" border="0">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Marca: <%=producto.getMarca()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Modelo: <%=producto.getModelo()%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Precio: <%=producto.getPrecio().doubleValue()%> &euro;
                                        </td>
                                    </tr>
                                </table>
                            </a>
                        </td>
<%                        
                    }
%>
                </tr>
            </table>
        </div>
        
        <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/mocha.js"></script>
<%
    }
%>

<%
    if(menuNav.getNivel() == 1){
        lista = subclasesproductosHelper.getSubproductos(menuNav.getProducto());
        String claseProducto = clasesproductosHelper.getNombreProducto(menuNav.getProducto());
        String linkProducto = clasesproductosHelper.getLinkProducto(menuNav.getProducto());
        
        if((menuNav.getProducto() != 12) && (menuNav.getProducto() != 13) && (menuNav.getProducto() != 15))
        {
%>        
        <div id="bannerProductos">
            <img src="Imagenes/ClasesProductos/<%=linkProducto%>.jpg" style="border-radius: 5px;" alt="<%=linkProducto%>"/>
        </div>        
        <%
        }
        %>
        
        <br/>
        
        <div id="tituloProducto">
            <%=claseProducto%>
        </div>

        <div id="hr">
        </div>

        <div id="subtituloProducto">
            Por favor, elija una categoría...
        </div>
        
        <table class="item">
<%
            for (int i = 0; i < lista.size(); i++){
                Subclasesproductos scp = (Subclasesproductos) lista.get(i);

                if(casilla == 0){
%>
                    <tr>
                        <td class="item">                    
                            <a href="index.html?niv=2&id=<%=scp.getIdsubclaseproducto()%>">
                                <br/>
                                <img src="Imagenes/Subproductos/<%=linkProducto%>/<%=scp.getLink()%>.jpg" border="0"/>
                                <br/>
                                <br/>
                                <%=scp.getDescsubclaseproducto()%>
                            </a>
                        </td>                        
<%
                }else if((casilla > 0)&&(casilla < 4)){
%>
                        <td class="item">
                            <a href="index.html?niv=2&id=<%=scp.getIdsubclaseproducto()%>">
                                <br/>
                                <img src="Imagenes/Subproductos/<%=linkProducto%>/<%=scp.getLink()%>.jpg" border="0"/>
                                <br/>
                                <br/>
                                <%=scp.getDescsubclaseproducto()%>
                            </a>
                        </td>
<%
                }else{
%>
                        <td class="item">
                            <a href="index.html?niv=2&id=<%=scp.getIdsubclaseproducto()%>">
                                <br/>
                                <img src="Imagenes/Subproductos/<%=linkProducto%>/<%=scp.getLink()%>.jpg" border="0"/>
                                <br/>
                                <br/>
                                <%=scp.getDescsubclaseproducto()%>
                            </a>
                        </td>
                    </tr>
<%
                    casilla = -1;
                }
                           
                casilla++;            
            }
%>
        </table>
<%
    }
%>

<%
    if(menuNav.getNivel() == 2){
        String subclaseProducto = subclasesproductosHelper.getNombreSubproducto(menuNav.getProducto());
        String marca = request.getParameter("marca");
        int orden = 1;
        int cantidad = 15;
        int posicion = 0;
        int total = 0;  
        
        if(request.getParameter("orden")!= null){
                orden = Integer.parseInt(request.getParameter("orden"));                
        }
        
        if((marca == null)||(marca == "")){
            switch(orden){
                case 1:
                    lista = productosHelper.getProductosSubclaseProductosOrdenMarcamodeloAsc(menuNav.getProducto());
                    break;
                case 2:
                    lista = productosHelper.getProductosSubclaseProductosOrdenMarcamodeloDesc(menuNav.getProducto());
                    break;
                case 3:
                    lista = productosHelper.getProductosSubclaseProductosOrdenPrecioAsc(menuNav.getProducto());
                    break;
                case 4:
                    lista = productosHelper.getProductosSubclaseProductosOrdenPrecioDesc(menuNav.getProducto());
                    break;
                default:
                    lista = productosHelper.getProductosSubclaseProductosOrdenMarcamodeloAsc(menuNav.getProducto());
                    break;
            }
        }else{
            switch(orden){
                case 1:
                    lista = productosHelper.getProductosSubclaseProductosMarcaOrdenMarcamodeloAsc(menuNav.getProducto(), marca);
                    break;
                case 2:
                    lista = productosHelper.getProductosSubclaseProductosMarcaOrdenMarcamodeloDesc(menuNav.getProducto(), marca);
                    break;
                case 3:
                    lista = productosHelper.getProductosSubclaseProductosMarcaOrdenPrecioAsc(menuNav.getProducto(), marca);
                    break;
                case 4:
                    lista = productosHelper.getProductosSubclaseProductosMarcaOrdenPrecioDesc(menuNav.getProducto(), marca);                      
                    break;
                default:
                    lista = productosHelper.getProductosSubclaseProductosMarcaOrdenMarcamodeloAsc(menuNav.getProducto(), marca);
                    break;
            }
        }
        
        int numeroregistros = lista.size();
        
        if(request.getParameter("posicion")!= null){
                posicion = Integer.parseInt(request.getParameter("posicion"));                
        }
            
        if(request.getParameter("select")!= null){
                cantidad = Integer.parseInt(request.getParameter("select"));               
        }
        
        if((posicion + cantidad) > numeroregistros){
            total = numeroregistros;
        }else{
            total = posicion + cantidad;
        }
        
        String tabla = "";
        int numpagina = 1;
        
        for (int i = 0; i < numeroregistros; i += cantidad)
        {
            if((marca == null)||(marca == "")){
                tabla += "<a href='index.html?niv=" + menuNav.getNivel() + "&id=" + menuNav.getProducto() + "&posicion=" + i + "&select=" + cantidad + "&orden=" + orden + "'>" + numpagina +"</a>&nbsp;";
            }else{
                tabla += "<a href='index.html?niv=" + menuNav.getNivel() + "&id=" + menuNav.getProducto() + "&marca=" + marca + "&posicion=" + i + "&select=" + cantidad + "&orden=" + orden + "'>" + numpagina +"</a>&nbsp;";
            }
            numpagina++;
        }
%>
        <br/>
        
        <div id="hr">
        </div>
        <div id="tituloProducto">
                <%=subclaseProducto%>
        </div>        
        <div id="hr">
        </div>
        
<%
        if(numeroregistros > 0){
%>
            <div class="articulos">
<%
            if((marca == null)||(marca == "")){
%>
                <form action="index.html?niv=<%=menuNav.getNivel()%>&id=<%=menuNav.getProducto()%>&select=<%=cantidad%>" method="post">
<%
            }else{
%>
                <form action="index.html?niv=<%=menuNav.getNivel()%>&id=<%=menuNav.getProducto()%>&marca=<%=marca%>&select=<%=cantidad%>" method="post">
<%
            }
%>
                        Clasificación: 
                        <select name="orden" style="width: 170px" onchange="this.form.submit()">
                        <%if(orden == 1){%>
                            <option selected="selected" value="1">En orden alfabético A-Z</option>
                        <%}else{%>
                            <option value="1">En orden alfabético A-Z</option>
                        <%}%>
                        <%if(orden == 2){%>
                            <option selected="selected" value="2">En orden alfabético Z-A</option>
                        <%}else{%>
                            <option value="2">En orden alfabético Z-A</option>
                        <%}%>
                        <%if(orden == 3){%>
                            <option selected="selected" value="3">Precio (ascendente)</option>
                        <%}else{%>
                            <option value="3">Precio (ascendente)</option>
                        <%}%>
                        <%if(orden == 4){%>
                            <option selected="selected" value="4">Precio (descendente)</option>
                        <%}else{%>
                            <option value="4">Precio (descendente)</option>
                        <%}%>
                        </select>
                </form>
            </div>
            <div id="subtituloProducto" style="text-align: right; margin-right: 40px;">Página: <%=tabla%></div>
<%
        }
%>
        
        <table class="producto">
<%
            for (int i = posicion; i < total; i++){
                Productos producto = (Productos) lista.get(i);
                
                if(casilla == 0){
%>            
                    <tr>
                        <td class="producto">                    
                            <a href="producto.html?id=<%=producto.getIdproducto()%>">
                                <br/>
                                <img src="Imagenes/Productos/<%=producto.getIdproducto()%>.png" border="0" height="120" width="120"/>
                                <br/>
                                Marca: <%=producto.getMarca()%>.
                                <br/>
                                Modelo: <%=producto.getModelo()%>.
                                <br/>
                                Precio: <%=producto.getPrecio()%>&#8364.
                            </a>
                        </td>                        
<%
                }else if((casilla > 0)&&(casilla < 4)){
%>
                        <td class="producto">
                            <a href="producto.html?id=<%=producto.getIdproducto()%>">
                                <br/>
                                <img src="Imagenes/Productos/<%=producto.getIdproducto()%>.png" border="0" height="120" width="120"/>
                                <br/>
                                Marca: <%=producto.getMarca()%>. 
                                <br/>
                                Modelo: <%=producto.getModelo()%>.
                                <br/>
                                Precio: <%=producto.getPrecio()%>&#8364.
                            </a>
                        </td>
<%
                }else{
%>
                        <td class="producto">
                            <a href="producto.html?id=<%=producto.getIdproducto()%>">
                                <br/>
                                <img src="Imagenes/Productos/<%=producto.getIdproducto()%>.png" border="0" height="120" width="120"/>
                                <br/>
                                Marca: <%=producto.getMarca()%>.
                                <br/>
                                Modelo: <%=producto.getModelo()%>.
                                <br/>
                                Precio: <%=producto.getPrecio()%>&#8364.
                            </a>
                        </td>
                    </tr>
<%
                    casilla = -1;
                }
                           
                casilla++;            
            }
%>
        </table>

<%
        if(numeroregistros > 0){
%>
            <div id="subtituloProducto" style="text-align: right; margin-right: 40px;">Página: <%=tabla%></div>
            <div class="articulos">
<%
            if((marca == null)||(marca == "")){
%>
                <form action="index.html?niv=<%=menuNav.getNivel()%>&id=<%=menuNav.getProducto()%>&orden=<%=orden%>" method="post">
<%
            }else{
%>
                <form action="index.html?niv=<%=menuNav.getNivel()%>&id=<%=menuNav.getProducto()%>&marca=<%=marca%>&orden=<%=orden%>" method="post">
<%
            }
%>
                        Artículos por pantalla:
                        <select name="select" style="width: 100px" onchange="this.form.submit()">
                        <%if(cantidad == 15){%>
                            <option selected="selected">15</option>
                        <%}else{%>
                            <option>15</option>
                        <%}%>
                        <%if(cantidad == 30){%>
                            <option selected="selected">30</option>
                        <%}else{%>
                            <option>30</option>
                        <%}%>
                        <%if(cantidad == 45){%>
                            <option selected="selected">45</option>
                        <%}else{%>
                            <option>45</option>
                        <%}%>
                        <%if(cantidad == 60){%>
                            <option selected="selected">60</option>
                        <%}else{%>
                            <option>60</option>
                        <%}%>
                        </select>
                </form>
            </div>
<%
        }else{
%>
            <br/>
            <br/>
            <div id="tituloProducto" style="text-align: center">
                No existen productos disponibles.
            </div>
            <br/>
<%            
        }
    }        
%>

        