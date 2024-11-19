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
import model.TKSuatChieu748;

/**
 *
 * @author Admin
 */
public class TKSuatChieuDAO748 extends DAO748 {

    public TKSuatChieuDAO748() {
        super();
    }

    public ArrayList<TKSuatChieuDAO748> getDsTKPhim(Date nBD, Date nKT, int phimID) {
        ArrayList<TKSuatChieu748> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    SuatChieu748.*,\n"
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
                + "    AND Phim748.ID = ? \n" // thêm điều kiện lọc theo ID phim
                + "GROUP BY \n"
                + "    SuatChieu748.ID\n"
                + "ORDER BY \n"
                + "    TongDoanhThu DESC;";

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setDate(1, nBD);  // truyền tham số ngày bắt đầu
            cs.setDate(2, nKT);  // truyền tham số ngày kết thúc
            cs.setInt(3, phimID); // truyền tham số ID phim
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                TKSuatChieu748 tkSuatChieu = new TKSuatChieu748();
//                        , rs.getString("theLoai"), rs.getFloat("thoiLuong")
//                        rs.getString("moTa"));
                tkSuatChieu.setTongSoVe( rs.getInt("TongSoVe"));
                tkSuatChieu.setTongDoanhThu(rs.getFloat("TongDoanhThu"));
                tkSuatChieu.setPhim(rs.getString("tenPhim"));

                
                list.add(tkSuatChieu);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        HoaDonDAO748 a = new HoaDonDAO748();
        ArrayList<HoaDon748> list = a.getDsHoaDon();
        System.out.println(list.get(0).getTongSoVe());
    }

}
