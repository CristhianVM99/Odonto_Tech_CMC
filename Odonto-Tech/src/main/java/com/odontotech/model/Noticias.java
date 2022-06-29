package com.odontotech.model;

import java.sql.Date;

public class Noticias {

    private int id;
    private String titulo;
    private String contenido;
    private byte[] imagen;
    private Date fecha;
    private int id_doctor;
    private String estado;

    public Noticias(int id, String titulo, String contenido, byte[] imagen, Date fecha, int id_doctor) {
        this.id = id;
        this.titulo = titulo;
        this.contenido = contenido;
        this.imagen = imagen;
        this.fecha = fecha;
        this.id_doctor = id_doctor;
    }

    public Noticias() {
        this.id = 0;
        this.titulo = "";
        this.contenido = "";
        this.imagen = null;
        this.fecha = null;
        this.id_doctor = 0;
        this.estado = "";
    }
    // mis metodos getters y setters

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return this.contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public byte[] getImagen() {
        return this.imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public Date getFecha() {
        return this.fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getId_doctor() {
        return this.id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
    }

    public String getEstado() {
        return this.estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Noticias{" + "id=" + id + ", titulo=" + titulo + ", contenido=" + contenido + ", fecha=" + fecha + ", id_doctor=" + id_doctor + ", estado=" + estado + '}';
    }

}//class
