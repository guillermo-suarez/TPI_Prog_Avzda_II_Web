package DAO;

import Modelo.*;
import java.util.*;
import org.hibernate.Query;
import org.hibernate.Session;

public class DAOPostgres implements InterfazDAO {
    private Session sesion;
    
    public DAOPostgres() {
        
    }
    
    @Override
    public void abrirSesion() {
        HibernateUtil.buildSessionFactory();
        HibernateUtil.openSessionAndBindToThread();
        this.sesion = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    @Override
    public void cerrarSesion() {
        this.sesion.close();
    }

    @Override
    public List recuperarTodos(Class clase) {
        Query query = sesion.createQuery("FROM " + clase.getName() + " C ORDER BY C.id");
        List resultado = new ArrayList<>();
        resultado = query.list();
        return resultado;
    }

    @Override
    public void agregarObjeto(Object objeto) {
        this.sesion.beginTransaction();
        this.sesion.save(objeto);
        this.sesion.getTransaction().commit();
    }
    
    @Override
    public void borrarObjeto(Object objeto) {
        this.sesion.beginTransaction();
        this.sesion.delete(objeto);
        this.sesion.getTransaction().commit();
    }

    @Override
    public void actualizarObjeto(Object objeto) {
        this.sesion.beginTransaction();
        this.sesion.update(objeto);
        this.sesion.getTransaction().commit();
    }

    @Override
    public Object recuperarUno(Class clase, int id) {
        Query query = sesion.createQuery("FROM " + clase.getName() + " C WHERE C.id = " + String.valueOf(id));
        return query.uniqueResult();
    }
    
    public Tiposuelo recuperarTiposuelo(String nombre) {
        Query query = sesion.createQuery("FROM Tiposuelo T WHERE T.nombre = " + "'" + nombre + "'");
        return (Tiposuelo) query.uniqueResult();
    }
    
    public Estadocampo recuperarEstadocampo(String nombre) {
        Query query = sesion.createQuery("FROM Estadocampo E WHERE E.nombre = " + "'" + nombre + "'");
        return (Estadocampo) query.uniqueResult();
    }
    
    public Estadoproyecto recuperarEstadoproyecto(String nombre) {
        Query query = sesion.createQuery("FROM Estadoproyecto E WHERE E.nombre = " + "'" + nombre + "'");
        return (Estadoproyecto) query.uniqueResult();
    }
    
    public Cultivo recuperarCultivo(String nombre) {
        Query query = sesion.createQuery("FROM Cultivo C WHERE C.nombre = " + "'" + nombre + "'");
        return (Cultivo) query.uniqueResult();
    }
    
}
