package ClasesMusiteka;

// Generated 17-ago-2013 1:35:04 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Subclasesproductos generated by hbm2java
 */
public class Subclasesproductos implements java.io.Serializable {

	private long idsubclaseproducto;
	private Clasesproductos clasesproductos;
	private String descsubclaseproducto;
	private String link;
	private Set productoses = new HashSet(0);
	private Set productoses_1 = new HashSet(0);

	public Subclasesproductos() {
	}

	public Subclasesproductos(long idsubclaseproducto,
			Clasesproductos clasesproductos, String descsubclaseproducto,
			String link) {
		this.idsubclaseproducto = idsubclaseproducto;
		this.clasesproductos = clasesproductos;
		this.descsubclaseproducto = descsubclaseproducto;
		this.link = link;
	}

	public Subclasesproductos(long idsubclaseproducto,
			Clasesproductos clasesproductos, String descsubclaseproducto,
			String link, Set productoses, Set productoses_1) {
		this.idsubclaseproducto = idsubclaseproducto;
		this.clasesproductos = clasesproductos;
		this.descsubclaseproducto = descsubclaseproducto;
		this.link = link;
		this.productoses = productoses;
		this.productoses_1 = productoses_1;
	}

	public long getIdsubclaseproducto() {
		return this.idsubclaseproducto;
	}

	public void setIdsubclaseproducto(long idsubclaseproducto) {
		this.idsubclaseproducto = idsubclaseproducto;
	}

	public Clasesproductos getClasesproductos() {
		return this.clasesproductos;
	}

	public void setClasesproductos(Clasesproductos clasesproductos) {
		this.clasesproductos = clasesproductos;
	}

	public String getDescsubclaseproducto() {
		return this.descsubclaseproducto;
	}

	public void setDescsubclaseproducto(String descsubclaseproducto) {
		this.descsubclaseproducto = descsubclaseproducto;
	}

	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Set getProductoses() {
		return this.productoses;
	}

	public void setProductoses(Set productoses) {
		this.productoses = productoses;
	}

	public Set getProductoses_1() {
		return this.productoses_1;
	}

	public void setProductoses_1(Set productoses_1) {
		this.productoses_1 = productoses_1;
	}

}
