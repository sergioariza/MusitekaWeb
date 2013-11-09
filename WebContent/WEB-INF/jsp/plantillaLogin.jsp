<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <title><tiles:getAsString name="titulo" /></title>
        <meta content="es" http-equiv="Content-Language" />
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<link rel="stylesheet" type="text/css" href="css/estilo.css" />
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/easyzoom.js"></script>
        <script type="text/javascript">
            jQuery(function($){
                $('a.zoom').easyZoom(); // lo aplica a 1
                        $('a.zoom').each(function(){ $(this).easyZoom(); }); // lo aplica a todas las imágenes que tengan a.zoom
            });
        </script>
    </head>

    <body>
        <div id="cabecera">
            <tiles:insert attribute="cabecera"/>
        </div>
        
        <div id="cuerpoLogin">
            <tiles:insert attribute="cuerpoLogin"/>
        </div>
    </body>
</html>