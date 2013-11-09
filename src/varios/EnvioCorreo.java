package varios;

import ClasesMusiteka.ProductosHelper;
import ClasesMusiteka.UsuariosHelper;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class EnvioCorreo{
    private static final String SMTP_HOST_NAME = "smtp.sendgrid.net";
    private static final String SMTP_AUTH_USER = "musiteka";
    private static final String SMTP_AUTH_PWD  = "sfam2000";
    
    public EnvioCorreo(){
        
    }
    
    private class SMTPAuthenticator extends javax.mail.Authenticator {
        public PasswordAuthentication getPasswordAuthentication() {
           String username = SMTP_AUTH_USER;
           String password = SMTP_AUTH_PWD;
           return new PasswordAuthentication(username, password);
        }
    }
    
    public void enviarCorreoRecordatorio(String direccion, String usuario, String password) throws MessagingException{
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        
        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, auth);
        Transport transport = mailSession.getTransport();
        MimeMessage message = new MimeMessage(mailSession);
        Multipart multipart = new MimeMultipart("alternative");

        BodyPart part1 = new MimeBodyPart();
        part1.setText("Estimado/a " + usuario + ". Gracias por confiar en Musiteka. Su password es: " + password);
        multipart.addBodyPart(part1);

        message.setContent(multipart);
        message.setFrom(new InternetAddress("musiteka.curso.java@gmail.com"));
        message.setSubject("Recuperación de password");
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(direccion));

        transport.connect();
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
        transport.close();        
    }
    
    public void enviarCorreoAlta(String direccion, String usuario, String password) throws MessagingException{    	
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        
        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, auth);
        Transport transport = mailSession.getTransport();
        MimeMessage message = new MimeMessage(mailSession);
        Multipart multipart = new MimeMultipart("alternative");

        BodyPart part1 = new MimeBodyPart();
        part1.setText("Estimado/a " + usuario + ". Gracias por confiar en Musiteka. Su datos de acceso son los siguientes. Correo: " + direccion + ". Su password es: " + password);
        multipart.addBodyPart(part1);

        message.setContent(multipart);
        message.setFrom(new InternetAddress("musiteka.curso.java@gmail.com"));
        message.setSubject("Alta de usuario " + usuario);
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(direccion));

        transport.connect();
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
        transport.close();        
    }
    
    public void enviarCorreoCompra(int idUsuario, String correo, Map<Integer, Integer> listaCompra) throws MessagingException{        
        UsuariosHelper usuariosHelper = new UsuariosHelper();
        ProductosHelper productosHelper = new ProductosHelper();
        String listadoProductos = "";
        double total = 0;
        double gastosEnvio = 15.0;
        
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        
        Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, auth);
        Transport transport = mailSession.getTransport();
        MimeMessage message = new MimeMessage(mailSession);
        Multipart multipart = new MimeMultipart("alternative");
        
        for(Map.Entry<Integer, Integer> entry : listaCompra.entrySet()){
            total = total + (productosHelper.getPrecio(entry.getKey()) * entry.getValue());
            listadoProductos = listadoProductos + "Producto: " + productosHelper.getMarcaymodelo(entry.getKey()) + ". Cantidad: " + entry.getValue() + ". Precio unidad: " + productosHelper.getPrecio(entry.getKey()) + " eur. Precio total: " + (productosHelper.getPrecio(entry.getKey()) * entry.getValue()) + " eur. \n";
        }
        
        if(total > 299.0){
            gastosEnvio = 0.0;
        }
        
        listadoProductos = listadoProductos + "Gastos de envío: " + gastosEnvio + " eur.\n";
        total = total + gastosEnvio;
        listadoProductos = listadoProductos + "Total compra: " + total + " eur.";
        
        BodyPart part1 = new MimeBodyPart();
        part1.setText("Estimado/a " + usuariosHelper.getUsuario(idUsuario).getNombre() + ".\n\n"
                + "Su datos de compra son los siguientes:\n"
                + listadoProductos + "\n\n"
                + "Gracias por confiar en la Musiteka.");
        multipart.addBodyPart(part1);
        
        message.setContent(multipart);
        message.setFrom(new InternetAddress("musiteka.curso.java@gmail.com"));
        message.setSubject("Compra de usuario " + usuariosHelper.getUsuario(idUsuario).getNombre());
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));

        transport.connect();
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
        transport.close();
    }
}