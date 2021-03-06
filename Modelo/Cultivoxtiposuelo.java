package Modelo;
// Generated 3 nov. 2021 10:47:30 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Cultivoxtiposuelo generated by hbm2java
 */
@Entity
@Table(name="cultivoxtiposuelo"
    ,schema="public"
)
public class Cultivoxtiposuelo  implements java.io.Serializable {


     private int idcultivoxtiposuelo;
     private Cultivo cultivo;
     private Tiposuelo tiposuelo;

    public Cultivoxtiposuelo() {
    }

    public Cultivoxtiposuelo(Cultivo cultivo, Tiposuelo tiposuelo) {
       this.cultivo = cultivo;
       this.tiposuelo = tiposuelo;
    }
   
     @Id 

    
    @Column(name="idcultivoxtiposuelo", unique=true, nullable=false)
     @GeneratedValue(strategy=IDENTITY)
    public int getIdcultivoxtiposuelo() {
        return this.idcultivoxtiposuelo;
    }
    
    public void setIdcultivoxtiposuelo(int idcultivoxtiposuelo) {
        this.idcultivoxtiposuelo = idcultivoxtiposuelo;
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
    @JoinColumn(name="idtiposuelo", nullable=false)
    public Tiposuelo getTiposuelo() {
        return this.tiposuelo;
    }
    
    public void setTiposuelo(Tiposuelo tiposuelo) {
        this.tiposuelo = tiposuelo;
    }




}


