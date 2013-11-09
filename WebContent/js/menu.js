// Copyright 2006-2007 javascript-array.com
var timeout	= 500;
var closetimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose;

function menu(marco){
    if(document.getElementById(marco).style.visibility == 'visible'){
        document.getElementById(marco).style.visibility = 'hidden';
    }else{
        document.getElementById(marco).style.visibility = 'visible';
    }        
}

function productoYaAgregado(){
    alert('El producto seleccionado ya se encuentra en la cesta');
}

function errorInvitado(){
    alert('Para agregar productos en la cesta es necesario estar registrado');
}

function change_quantity(id1, id2) {
  var idNumeroItems = document.getElementById(id1);
  var idNumeroItemsEdit = document.getElementById(id2);
  if (idNumeroItems != null && idNumeroItemsEdit != null) {
    idNumeroItems.style.display = "none";
    idNumeroItemsEdit.style.display = "block";
  }
}

function errorModificar(){
    alert('No se admiten valores menores a 1');
}

function compraRealizada(){
    alert('Se ha realizado la compra satisfactoriamente. Revisa tu correo para consultar los datos de la compra');
}