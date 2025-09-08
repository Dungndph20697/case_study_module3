package com.example.case_study.model;

public class NguoiDung {
    private int id;
    private String tenNguoiDung;
    private String sdt;
    private String email;
    private String diaChi;
    private String matKhau;
    private ChucVu idChucVu;

    public NguoiDung() {
    }

    public NguoiDung(int id, String tenNguoiDung, String sdt, String email, String diaChi, String matKhau, ChucVu idChucVu) {
        this.id = id;
        this.tenNguoiDung = tenNguoiDung;
        this.sdt = sdt;
        this.email = email;
        this.diaChi = diaChi;
        this.matKhau = matKhau;
        this.idChucVu = idChucVu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public ChucVu getIdChucVu() {
        return idChucVu;
    }

    public void setIdChucVu(ChucVu idChucVu) {
        this.idChucVu = idChucVu;
    }
}
