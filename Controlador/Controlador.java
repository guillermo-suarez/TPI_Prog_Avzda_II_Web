package Controlador;

import DAO.*;
import Modelo.*;
import java.util.*;

public class Controlador {
    private final DAOPostgres DAO;
    
    public Controlador(DAOPostgres DAO) {
        this.DAO = DAO;
    }
    
    public void agregarObjeto(Object objeto) {
        this.DAO.agregarObjeto(objeto);
    }
    
    public void borrarObjeto(Object objeto) {
        this.DAO.borrarObjeto(objeto);
    }
    
    public void actualizarObjeto(Object objeto) {
        this.DAO.actualizarObjeto(objeto);
    }
    
    public List<Campo> getCampos() {
        return DAO.recuperarTodos(Campo.class);
    }
    
    public List<Tiposuelo> getTiposSuelo() {
        return DAO.recuperarTodos(Tiposuelo.class);
    }

    public List<Estadocampo> getEstadosCampo() {
        return DAO.recuperarTodos(Estadocampo.class);
    }
    
    public List<Estadoproyecto> getEstadosProyecto() {
        return DAO.recuperarTodos(Estadoproyecto.class);
    }
    
    public List<Laboreo> getLaboreos() {
        return DAO.recuperarTodos(Laboreo.class);
    }
    
    public List<Cultivo> getCultivos() {
        return DAO.recuperarTodos(Cultivo.class);
    }
    
    public Object recuperarUno(Class clase, int id) {
        return DAO.recuperarUno(clase, id);
    }
    
    public Tiposuelo recuperarTiposuelo(String nombre) {
        return DAO.recuperarTiposuelo(nombre);
    }
    
    public Estadocampo recuperarEstadocampo(String nombre) {
        return DAO.recuperarEstadocampo(nombre);
    }
    
    public Estadoproyecto recuperarEstadoproyecto(String nombre) {
        return DAO.recuperarEstadoproyecto(nombre);
    }
    
    public Cultivo recuperarCultivo(String nombre) {
        return DAO.recuperarCultivo(nombre);
    }
    
    public void actualizarEstadoCampo(Campo campo) {
        String nombreNuevoEstado = campo.verEstadoActualizado();
        Estadocampo nuevoEstado = recuperarEstadocampo(nombreNuevoEstado);
        campo.setEstadocampo(nuevoEstado);
        actualizarObjeto(campo);
    }
    
    public boolean esFloat(String texto) {
        if(texto == null || texto.equals("")) {
            return false;
        } 
        try {
            Float.parseFloat(texto);
            return true;
        } catch(NumberFormatException e) {
            return false;
        }
    }
}
