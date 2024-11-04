/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class TKPhim748 extends Phim748 {
    private int tongSoVe;
    private float tongDoanhThu;

    public TKPhim748(int id, int tongSoVe, float tongDoanhThu, String tenPhim, String theLoai, float thoiLuong, String moTa) {
        super(id, tenPhim, theLoai, thoiLuong, moTa);
        this.tongSoVe = tongSoVe;
        this.tongDoanhThu = tongDoanhThu;
    }

    public TKPhim748() {
    }

    public int getTongSoVe() {
        return tongSoVe;
    }

    public void setTongSoVe(int tongSoVe) {
        this.tongSoVe = tongSoVe;
    }

    public float getTongDoanhThu() {
        return tongDoanhThu;
    }

    public void setTongDoanhThu(float tongDoanhThu) {
        this.tongDoanhThu = tongDoanhThu;
    }
    
    
}
