package com.odontotech.model;

import java.sql.Date;

public class almacen {

    private int id;
    private String nombre;
    private int cantidad;
    private Date fecha_venc;
    private double Precio_unit;
    private int id_doctor;

    public almacen() {
        this.id = 0;
        this.nombre = "";
        this.cantidad = 0;
        this.fecha_venc = null;
        this.Precio_unit = 0.0;
        this.id_doctor = 0;
    }

    public almacen(int id, String nombre, int cantidad, Date fecha, double Precio_unit, int id_doctor) {
        this.id = id;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.fecha_venc = fecha;
        this.Precio_unit = Precio_unit;
        this.id_doctor = id_doctor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha_venc() {
        return fecha_venc;
    }

    public void setFecha_venc(Date fecha) {
        this.fecha_venc = fecha;
    }

    public double getPrecio_unit() {
        return Precio_unit;
    }

    public void setPrecio_unit(double Precio_unit) {
        this.Precio_unit = Precio_unit;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
    }

    @Override
    public String toString() {
        return "almacen{" + "id=" + id + ", nombre=" + nombre + ", cantidad=" + cantidad + ", fecha_venc=" + fecha_venc + ", Precio_unit=" + Precio_unit + ", id_doctor=" + id_doctor + '}';
    }
    
    

}
