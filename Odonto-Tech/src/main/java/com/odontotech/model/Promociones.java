
package com.odontotech.model;
import java.awt.Image;
import java.sql.Blob;
import javax.swing.ImageIcon;

public class Promociones {
 private int id;
 private String servicio;
 private double precio;
 private byte[] imagen;
 private int id_especialidad;
 private String nombre_especialidad;
 private String estado;

    public Promociones() {
        this.id = 0;
        this.servicio = "";
        this.precio = 0.0;
        this.imagen = null;
        this.id_especialidad = 0;
        this.nombre_especialidad = "";
    }

    public Promociones(int id, String servicio, double precio, byte[] imagen, int id_especialidad, String nombre_especialidad) {
        this.id = id;
        this.servicio = servicio;
        this.precio = precio;
        this.imagen = imagen;
        this.id_especialidad = id_especialidad;
        this.nombre_especialidad = nombre_especialidad;
        this.estado="";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public int getId_especialidad() {
        return id_especialidad;
    }

    public void setId_especialidad(int id_especialidad) {
        this.id_especialidad = id_especialidad;
    }

    public String getNombre_especialidad() {
        return nombre_especialidad;
    }

    public void setNombre_especialidad(String nombre_especialidad) {
        this.nombre_especialidad = nombre_especialidad;
    }
  public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    @Override
    public String toString() {
        return "Promociones{" + "id=" + id + ", servicio=" + servicio + ", precio=" + precio + ", id_especialidad=" + id_especialidad + ", nombre_especialidad=" + nombre_especialidad +", estado="+estado+ '}';
    }

}
