<%@page contentType="text/html"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert page="/WEB-INF/jsp/plantillaLogin.jsp" flush="true" >
	<tiles:put name="titulo" value="Musiteka - Producto" />
        <tiles:put name="cabecera" value="/WEB-INF/jsp/tiles/cabecera.jsp" />
	<tiles:put name="cuerpoLogin" value="/WEB-INF/jsp/tiles/producto.jsp" />
</tiles:insert>