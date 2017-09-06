/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rojas.carlos.DAL;

import java.util.Collection;

import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import rojas.carlos.modelos.Producto;

/**
 *
 * @author carlos
 */
public class ProductosDAL {

    private static  EntityManagerFactory emf;
    private static EntityManager em;
    private static Query consulta;
    
    private static EntityManager getEM(){
        if (em == null){
            if (emf == null){
                emf = Persistence.createEntityManagerFactory("showDatabaseDataPU");
            }
            em = emf.createEntityManager();
        }
        return em;
    }

    private static Query getConsulta(String name) {
        if (em == null) {
            if (emf == null) {
                emf = Persistence.createEntityManagerFactory("showDatabaseDataPU");
            }
            em = emf.createEntityManager();
        }
        consulta = em.createNamedQuery(name);
        return consulta;
    }

    public static Collection<Producto> listarProductos() {
        return getConsulta("Producto.findAll").getResultList();
    }
    
    public static Producto traerProducto(String codigo){
        return (Producto)getConsulta("Producto.findByCodigo").
                setParameter("codigo", codigo).
                getSingleResult();
    }
    
    public static void crearProducto(Producto producto)
    {
        getEM().getTransaction().begin();
        getEM().persist(producto);
        getEM().getTransaction().commit();
    }
    
    public static void  modificarProducto(String codigo, Producto productoNuevo){
        Producto producto = traerProducto(codigo);
        producto.setDescripcion(productoNuevo.getDescripcion());
        producto.setCategoria(productoNuevo.getCategoria());
        producto.setPrecio(productoNuevo.getPrecio());
        getEM().getTransaction().begin();
        getEM().merge(producto);
        getEM().getTransaction().commit();
    }

}
