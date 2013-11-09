/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package varios;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author The_Edge
 */
public class ValidacionFormularios {
    
    private Pattern pattern;
    private Matcher matcher;
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private static final String NUMERO = "[0-9]+";
    
    public ValidacionFormularios(){
        
    }
    
    //Validación de campo obligatorio
    public boolean validarCampoObligatorio(String campo){
        return (campo.compareTo("") != 0);
    }   
    
    //Validación de correo electrónico
    public boolean validarCorreo(String direccion){
        pattern = Pattern.compile(EMAIL_PATTERN);
        matcher = pattern.matcher(direccion);
	return matcher.matches();
    }
    
    //Validación de número
    public boolean validarNumero(String numero){
        pattern = Pattern.compile(NUMERO);
        matcher = pattern.matcher(numero);
	return matcher.matches();
    }
}
