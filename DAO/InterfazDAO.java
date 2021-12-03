package DAO;

import java.util.List;

public interface InterfazDAO {
    public void abrirSesion();
    public void cerrarSesion();
    public List recuperarTodos(Class clase);
    public Object recuperarUno(Class clase, int id);
    public void agregarObjeto(Object objeto);
    public void borrarObjeto(Object objeto);
    public void actualizarObjeto(Object objeto);
}
