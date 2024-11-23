/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.KhachHang748;

public class NguoiDungDAO748 extends DAO748 {

    public NguoiDungDAO748() {
        super();
    }

   public int addKH(KhachHang748 kh) {
    int generatedId = -1;
    String sqlInsert = "INSERT INTO NguoiDung748 (taiKhoan, matKhau, hoVaTen, loaiNguoiDung, diem, sdt, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
    String sqlUpdate = "UPDATE NguoiDung748 SET maTheTV = ? WHERE ID = ?";

    try (PreparedStatement psInsert = con.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS)) {
        // Thêm khách hàng vào cơ sở dữ liệu
        psInsert.setString(1, kh.getTaiKhoan());
        psInsert.setString(2, kh.getMatKhau());
        psInsert.setString(3, kh.getHoVaTen());
        psInsert.setString(4, kh.getLoaiNguoiDung());
        psInsert.setInt(5, kh.getDiem());
        psInsert.setString(6, kh.getSdt());
        psInsert.setString(7, kh.getEmail());

        int rowsAffected = psInsert.executeUpdate();

        if (rowsAffected > 0) {
            ResultSet rs = psInsert.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1); // Lấy ID tự sinh

                // Cập nhật mã thẻ thành viên vào bảng
                String maTheTV = "ttv" + generatedId;

                try (PreparedStatement psUpdate = con.prepareStatement(sqlUpdate)) {
                    psUpdate.setString(1, maTheTV);
                    psUpdate.setInt(2, generatedId);
                    psUpdate.executeUpdate();
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return generatedId;
}

}

