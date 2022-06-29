package com.odontotech.model;

public class Sonrisa_del_mes {

    private int id;
    private String nombre_paciente;
    private String nombre_doctor;
    private byte[] imagen;
    private String descripcion;
    private int id_doctor;
    private String ci_paciente;
    private String estado;

    public Sonrisa_del_mes(int id, String nombre_paciente, String nombre_doctor, byte[] imagen, String descripcion, int id_doctor, String ci_paciente) {
        this.id = id;
        this.nombre_paciente = nombre_paciente;
        this.nombre_doctor = nombre_doctor;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.id_doctor = id_doctor;
        this.ci_paciente = ci_paciente;
    }

    public Sonrisa_del_mes() {
        this.id = 0;
        this.nombre_paciente = "";
        this.nombre_doctor = "";
        this.imagen = null;
        this.descripcion = "";
        this.id_doctor = 0;
        this.ci_paciente = "";
        this.estado="";
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

    public String getNombre_doctor() {
        return nombre_doctor;
    }

    public void setNombre_doctor(String nombre_doctor) {
        this.nombre_doctor = nombre_doctor;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
    }

    public String getCi_paciente() {
        return ci_paciente;
    }

    public void setCi_paciente(String ci_paciente) {
        this.ci_paciente = ci_paciente;
    }
  public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    @Override
    public String toString() {
        return "Sonrisa_del_mes{" + "id=" + id + ", nombre_paciente=" + nombre_paciente + ", nombre_doctor=" + nombre_doctor + ", descripcion=" + descripcion + ", id_doctor=" + id_doctor + ", ci_paciente=" + ci_paciente +", estado="+estado+"}";
    }

}//class 
