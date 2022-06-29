package com.odontotech.model;

public class especialidades {
    private int id;
    private String nombre_especialidad;

    public especialidades() {
        this.id=0;
        this.nombre_especialidad="";
    }

    public especialidades(int id, String nombre_especialidad) {
        this.id = id;
        this.nombre_especialidad = nombre_especialidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_especialidad() {
        return nombre_especialidad;
    }

    public void setNombre_especialidad(String nombre_especialidad) {
        this.nombre_especialidad = nombre_especialidad;
    }

    @Override
    public String toString() {
        return "especialidades{" + "id=" + id + ", nombre_especialidad=" + nombre_especialidad + '}';
    }
        
}
