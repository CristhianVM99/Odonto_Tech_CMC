package com.odontotech.model;

import java.sql.Date;

public class Reserva_De_Citas {

    private int id;
    private String nombre_paciente;
    private String descripcion_consulta;
    private Date fecha;
    private String hora;
    private int celular;
    private int id_especialidad;
    private String servicios;


    public Reserva_De_Citas() {
        this.id = 0;
        this.nombre_paciente = "";
        this.descripcion_consulta = "";
        this.fecha = null;
        this.hora = "";
        this.celular = 0;
        this.id_especialidad = 0;
        this.servicios = "";
    }

    public Reserva_De_Citas(int id, String nombre_paciente, String descripcion_consulta, Date fecha, String hora, int celular, int id_especialidad, String servicios) {

        this.id = id;
        this.nombre_paciente = nombre_paciente;
        this.descripcion_consulta = descripcion_consulta;
        this.fecha = fecha;
        this.hora = hora;
        this.celular = celular;
        this.id_especialidad = id_especialidad;
        this.servicios = servicios;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_paciente() {
        return nombre_paciente;
    }

    public void setNombre_paciente(String nombre_paciente) {
        this.nombre_paciente = nombre_paciente;
    }

    public String getDescripcion_consulta() {
        return descripcion_consulta;
    }

    public void setDescripcion_consulta(String descripcion_consulta) {
        this.descripcion_consulta = descripcion_consulta;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public int getId_especialidad() {
        return id_especialidad;
    }

    public void setId_especialidad(int id_especialidad) {
        this.id_especialidad = id_especialidad;
    }

    public String getServicios() {
        return servicios;
    }

    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    @Override
    public String toString() {
        return "Reserva_De_Citas{" + "id=" + id + ", nombre_paciente=" + nombre_paciente + ", descripcion_consulta=" + descripcion_consulta + ", fecha=" + fecha + ", hora=" + hora + ", celular=" + celular + ", id_especialidad=" + id_especialidad + ", servicios=" + servicios + '}';
    }

}
