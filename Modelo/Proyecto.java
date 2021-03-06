package Modelo;
// Generated 3 nov. 2021 10:47:30 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Proyecto generated by hbm2java
 */
@Entity
@Table(name="proyecto"
    ,schema="public"
)
public class Proyecto  implements java.io.Serializable {


     private int idproyecto;
     private Cultivo cultivo;
     private Estadoproyecto estadoproyecto;
     private Lote lote;
     private Set<Proyectoxlaboreo> proyectoxlaboreos = new HashSet<Proyectoxlaboreo>(0);

    public Proyecto() {
    }

	
    public Proyecto(Cultivo cultivo, Estadoproyecto estadoproyecto, Lote lote) {
        this.cultivo = cultivo;
        this.estadoproyecto = estadoproyecto;
        this.lote = lote;
    }
    public Proyecto(Cultivo cultivo, Estadoproyecto estadoproyecto, Lote lote, Set<Proyectoxlaboreo> proyectoxlaboreos) {
       this.cultivo = cultivo;
       this.estadoproyecto = estadoproyecto;
       this.lote = lote;
       this.proyectoxlaboreos = proyectoxlaboreos;
    }
   
     @Id 

    
    @Column(name="idproyecto", unique=true, nullable=false)
     @GeneratedValue(strategy=IDENTITY)
    public int getIdproyecto() {
        return this.idproyecto;
    }
    
    public void setIdproyecto(int idproyecto) {
        this.idproyecto = idproyecto;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idcultivo", nullable=false)
    public Cultivo getCultivo() {
        return this.cultivo;
    }
    
    public void setCultivo(Cultivo cultivo) {
        this.cultivo = cultivo;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idestadoproyecto", nullable=false)
    public Estadoproyecto getEstadoproyecto() {
        return this.estadoproyecto;
    }
    
    public void setEstadoproyecto(Estadoproyecto estadoproyecto) {
        this.estadoproyecto = estadoproyecto;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idlote", nullable=false)
    public Lote getLote() {
        return this.lote;
    }
    
    public void setLote(Lote lote) {
        this.lote = lote;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="proyecto")
    public Set<Proyectoxlaboreo> getProyectoxlaboreos() {
        return this.proyectoxlaboreos;
    }
    
    public void setProyectoxlaboreos(Set<Proyectoxlaboreo> proyectoxlaboreos) {
        this.proyectoxlaboreos = proyectoxlaboreos;
    }
    
    public boolean estaActivo() {
        boolean activo = true;
        if((this.estadoproyecto.getNombre().equals("Terminado")) || (this.estadoproyecto.getNombre().equals("Cancelado"))) {
            activo = false;
        }
        return activo;
    }
}


