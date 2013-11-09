package ClasesMusiteka;

// Generated 17-ago-2013 1:35:04 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Transacciones generated by hbm2java
 */
public class Transacciones implements java.io.Serializable {

	private long idtransaccion;
	private Usuarios usuarios;
	private long idproducto;
	private Date fechatransaccion;
	private long numerocompra;
	private String formapago;

	public Transacciones() {
	}

	public Transacciones(long idtransaccion, Usuarios usuarios,
			long idproducto, Date fechatransaccion, long numerocompra,
			String formapago) {
		this.idtransaccion = idtransaccion;
		this.usuarios = usuarios;
		this.idproducto = idproducto;
		this.fechatransaccion = fechatransaccion;
		this.numerocompra = numerocompra;
		this.formapago = formapago;
	}

	public long getIdtransaccion() {
		return this.idtransaccion;
	}

	public void setIdtransaccion(long idtransaccion) {
		this.idtransaccion = idtransaccion;
	}

	public Usuarios getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(Usuarios usuarios) {
		this.usuarios = usuarios;
	}

	public long getIdproducto() {
		return this.idproducto;
	}

	public void setIdproducto(long idproducto) {
		this.idproducto = idproducto;
	}

	public Date getFechatransaccion() {
		return this.fechatransaccion;
	}

	public void setFechatransaccion(Date fechatransaccion) {
		this.fechatransaccion = fechatransaccion;
	}

	public long getNumerocompra() {
		return this.numerocompra;
	}

	public void setNumerocompra(long numerocompra) {
		this.numerocompra = numerocompra;
	}

	public String getFormapago() {
		return this.formapago;
	}

	public void setFormapago(String formapago) {
		this.formapago = formapago;
	}

}
