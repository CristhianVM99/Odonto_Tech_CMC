package com.odontotech.model;

public class Usuarios {

    private int id;
    private String nombre_doctor;
    private String usuario;
    private String password;
    private String correo;
    private int id_doctor;
    private String rol;

    public Usuarios() {
        this.id = 0;
        this.nombre_doctor ="";
        this.usuario = "";
        this.password = "";
        this.correo = "";
        this.id_doctor = 0;
        this.rol = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_doctor() {
        return nombre_doctor;
    }

    public void setNombre_doctor(String nombre_doctor) {
        this.nombre_doctor = nombre_doctor;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    @Override
    public String toString() {
        return "Usuarios{" + "id=" + id + ", nombre_doctor=" + nombre_doctor + ", usuario=" + usuario + ", password=" + password + ", correo=" + correo + ", id_doctor=" + id_doctor + ", rol=" + rol + '}';
    }
    
    
    

}//class
