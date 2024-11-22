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
import model.TKPhim748;

/**
 *
 * @author Admin
 */
public class TKPhimDAO748 extends DAO748 {

    public TKPhimDAO748() {
        super();
    }

    public ArrayList<TKPhim748> getDsTKPhim(Date nBD, Date nKT) {
        ArrayList<TKPhim748> listPhim = new ArrayList<>();
        String sql = "SELECT \n"
                + "    Phim748.*,\n"
                + "    COUNT(Ve748.ID) AS TongSoVe,\n"
                + "    SUM(Ve748.giaVe) AS TongDoanhThu\n"
                + "FROM \n"
                + "    Phim748\n"
                + "JOIN \n"
                + "    SuatChieu748 ON Phim748.ID = SuatChieu748.Phim748ID\n"
                + "JOIN \n"
                + "    Ve748 ON SuatChieu748.ID = Ve748.SuatChieu748ID\n"
                + "WHERE \n"
                + "    SuatChieu748.ngayChieu BETWEEN ? AND ? \n" // sử dụng dấu hỏi cho tham số
                + "GROUP BY \n"
                + "    Phim748.ID\n"
                + "ORDER BY \n"
                + "    TongDoanhThu DESC;";

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setDate(1, nBD);  // truyền tham số ngày bắt đầu
            cs.setDate(2, nKT);  // truyền tham số ngày kết thúc
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                TKPhim748 tkPhim = new TKPhim748();                 
                tkPhim.setID(rs.getInt("ID"));
                tkPhim.setTongSoVe(rs.getInt("TongSoVe"));
                tkPhim.setTongDoanhThu(rs.getFloat("TongDoanhThu"));
                tkPhim.setTenPhim(rs.getString("tenPhim"));
                tkPhim.setTheLoai(rs.getString("theLoai"));
                tkPhim.setThoiLuong(rs.getFloat("thoiLuong"));
                tkPhim.setMoTa(rs.getString("moTa"));
                listPhim.add(tkPhim);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPhim;
    }
}
