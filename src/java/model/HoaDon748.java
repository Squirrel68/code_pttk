/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;


/**
 *
 * @author Admin
 */
public class HoaDon748 {
    private int tongSoVe;
    private float tongTien;
    private Date ngay;
    private String loaiHoaDon;
    private NguoiDung_HoaDon748 khachHang;
    private NguoiDung_HoaDon748 nhanVien;



    public String getLoaiHoaDon() {
        return loaiHoaDon;
    }

    public void setLoaiHoaDon(String loaiHoaDon) {
        this.loaiHoaDon = loaiHoaDon;
    }

    public NguoiDung_HoaDon748 getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(NguoiDung_HoaDon748 khachHang) {
        this.khachHang = khachHang;
    }

    public NguoiDung_HoaDon748 getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NguoiDung_HoaDon748 nhanVien) {
        this.nhanVien = nhanVien;
    }

    public int getTongSoVe() {
        return tongSoVe;
    }

    public void setTongSoVe(int tongSoVe) {
        this.tongSoVe = tongSoVe;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public HoaDon748() {
    }
    
    
}
