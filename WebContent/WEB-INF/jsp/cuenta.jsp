<%@page contentType="text/html"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert page="/WEB-INF/jsp/plantillaIndex.jsp" flush="true" >
	<tiles:put name="titulo" value="Musiteka - Mi cuenta" />
        <tiles:put name="cabecera" value="/WEB-INF/jsp/tiles/cabecera.jsp" />
        <tiles:put name="menu" value="/WEB-INF/jsp/tiles/menuPanel.jsp" />
	<tiles:put name="cuerpo" value="/WEB-INF/jsp/tiles/cuenta.jsp" />
</tiles:insert>