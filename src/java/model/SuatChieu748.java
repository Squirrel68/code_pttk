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
public class SuatChieu748 {
    private int ID;
    private String gioChieu;
    private Date ngayChieu;
    private String ghiChu;
    private Phim748 phim;
    private PhongChieu748 phongChieu;

    public SuatChieu748() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }


    public String getGioChieu() {
        return gioChieu;
    }

    public void setGioChieu(String gioChieu) {
        this.gioChieu = gioChieu;
    }

    public Date getNgayChieu() {
        return ngayChieu;
    }

    public void setNgayChieu(Date ngayChieu) {
        this.ngayChieu = ngayChieu;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public Phim748 getPhim() {
        return phim;
    }

    public void setPhim(Phim748 phim) {
        this.phim = phim;
    }

    public PhongChieu748 getPhongChieu() {
        return phongChieu;
    }

    public void setPhongChieu(PhongChieu748 phongChieu) {
        this.phongChieu = phongChieu;
    }
    
    
    
}
