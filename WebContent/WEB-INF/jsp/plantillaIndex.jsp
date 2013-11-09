<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <title><tiles:getAsString name="titulo" /></title>
        <meta content="es" http-equiv="Content-Language" />
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<link rel="stylesheet" type="text/css" href="css/estilo.css" />
        <script type="text/javascript" src="js/menu.js"></script>
    </head>

    <body>
        <div id="cabecera">
            <tiles:insert attribute="cabecera"/>
        </div>
        
        <div id="menu">
            <tiles:insert attribute="menu"/>
        </div>
        
        <div id="cuerpo">
            <tiles:insert attribute="cuerpo"/>
            <div id="bienvenida" style="text-align: center">
                Página web de demostración por Sergio Ariza (desarrollado con SpringMVC e Hibernate)
            </div>
        </div>
    </body>
</html>
