/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DAO748.con;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.HoaDon748;
import model.Phim748;
import model.PhongChieu748;
import model.TKSuatChieu748;

/**
 *
 * @author Admin
 */
public class HoaDonDAO748 extends DAO748 {

    public HoaDonDAO748() {
        super();
    }

    public ArrayList<HoaDon748> getDsHoaDon(Date nBD, Date nKT, int suatChieuID) {
        ArrayList<HoaDon748> listHD = new ArrayList<>();
        String sql = "SELECT \n"
                + "    HoaDon748.*, \n"
                + "    SuatChieu748.ID as SuatChieuID,\n"
                + "    SuatChieu748.gioChieu, \n"
                + "    SuatChieu748.ngayChieu  \n"
                + "FROM \n"
                + "    HoaDon748\n"
                + "JOIN \n"
                + "    Ve748 ON HoaDon748.ID = Ve748.hoaDon748ID \n"
                + "JOIN \n"
                + "    SuatChieu748 ON Ve748.suatChieu748ID = SuatChieu748.ID  \n"
                + "WHERE \n"
                + "    SuatChieu748.ID = ?  \n"
                + "    AND SuatChieu748.ngayChieu BETWEEN ? AND ? \n"
                + "GROUP BY \n"
                + "    HoaDon748.ID\n"
                + "ORDER BY \n"
                + "    HoaDon748.ngay DESC;  ";

        try (CallableStatement cs = con.prepareCall(sql)) {
            cs.setInt(1, suatChieuID);  
            cs.setDate(2, nBD);     
            cs.setDate(3, nKT);    
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
                HoaDon748 hd = new HoaDon748();
                hd.setID(rs.getInt("ID"));
                hd.setNgay(rs.getDate("ngay"));
                hd.setTongSoVe(rs.getInt("tongSoVe"));
                hd.setTongTien(rs.getFloat("tongTien"));
                listHD.add(hd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listHD;
    }
}
