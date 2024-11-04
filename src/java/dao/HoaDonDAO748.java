/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.HoaDon748;

/**
 *
 * @author Admin
 */
public class HoaDonDAO748 extends DAO748 {

    public HoaDonDAO748() {
        super();
    }

    public ArrayList<HoaDon748> getDsHoaDon() {
        ArrayList<HoaDon748> list = new ArrayList<>();
        String sql = "select * from HoaDon748";

        try {
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                HoaDon748 hd = new HoaDon748();
                list.add(hd);
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
