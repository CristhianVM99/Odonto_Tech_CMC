package com.odontotech.model;

import java.sql.Date;
import javax.persistence.Lob;

public class Pacientes {
    private String ci;
    private String nombre;    
    private Date fecha_inicio;
    private String descripcion;
    private int celular;
    private String servicio;
    private String direccion;
    @Lob
    private byte[] imagen;

    public Pacientes(){
        this.nombre = "";
        this.ci = "";
        this.fecha_inicio = null;
        this.descripcion = "";
        this.celular = 0;
        this.servicio = "";
        this.direccion = "";
        this.imagen = null;
    }

    public Pacientes(String nombre, String ci, Date fecha_inicio, String descripcion, int celular, String servicio, String direccion, byte[] imagen) {
        this.nombre = nombre;
        this.ci = ci;
        this.fecha_inicio = fecha_inicio;
        this.descripcion = descripcion;
        this.celular = celular;
        this.servicio = servicio;
        this.direccion = direccion;
        this.imagen = imagen;
    }   

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    @Override
    public String toString() {
        return "Pacientes{" + "ci=" + ci + ", nombre=" + nombre + ", fecha_inicio=" + fecha_inicio + ", descripcion=" + descripcion + ", celular=" + celular + ", servicio=" + servicio + ", direccion=" + direccion + '}';
    }
    
    
}
