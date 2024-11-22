/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DAO748.con;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.HoaDon748;
import model.Phim748;
import model.PhongChieu748;
import model.TKSuatChieu748;

/**
 *
 * @author Admin
 */
public class TKSuatChieuDAO748 extends DAO748 {

    public TKSuatChieuDAO748() {
        super();
    }

    public ArrayList<TKSuatChieu748> getDsTKPhim(Date nBD, Date nKT, int phimID) {
        ArrayList<TKSuatChieu748> listSC = new ArrayList<>();
        String sql = "SELECT SuatChieu748.*, "
                + "Phim748.tenPhim, "
                + "COUNT(Ve748.ID) AS TongSoVe, "
                + "SUM(Ve748.giaVe) AS TongDoanhThu "
                + "FROM SuatChieu748 "
                + "JOIN Ve748 ON SuatChieu748.ID = Ve748.SuatChieu748ID "
                + "JOIN Phim748 ON SuatChieu748.Phim748ID = Phim748.ID "
                + "WHERE SuatChieu748.Phim748ID = ? "
                + "AND SuatChieu748.ngayChieu BETWEEN ? AND ? "
                + "GROUP BY SuatChieu748.ID "
                + "ORDER BY TongDoanhThu DESC";

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setInt(1, phimID);  // Truyền phimID
            cs.setDate(2, nBD);     // Truyền ngày bắt đầu
            cs.setDate(3, nKT);     // Truyền ngày kết thúc
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                TKSuatChieu748 tkSuatChieu = new TKSuatChieu748();
                Phim748 phim = new Phim748();
                PhongChieu748 phongChieu = new PhongChieu748();

                phongChieu.setID(rs.getInt("phongChieu748ID"));
                phim.setTenPhim(rs.getString("tenPhim"));  // Gán tên phim cho đối tượng phim

                tkSuatChieu.setTongSoVe(rs.getInt("TongSoVe"));
                tkSuatChieu.setTongDoanhThu(rs.getFloat("TongDoanhThu"));
                tkSuatChieu.setNgayChieu(rs.getDate("ngayChieu"));
                tkSuatChieu.setGioChieu(rs.getString("gioChieu"));
                tkSuatChieu.setPhim(phim);
                tkSuatChieu.setPhongChieu(phongChieu);
                tkSuatChieu.setID(rs.getInt("ID"));

                listSC.add(tkSuatChieu);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSC;
    }

}
