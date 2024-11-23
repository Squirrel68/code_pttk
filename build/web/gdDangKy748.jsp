<%-- 
    Document   : gdDangKy748.jsp
    Created on : Nov 23, 2024, 11:51:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.NguoiDungDAO748" %>
<%@ page import="model.KhachHang748" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký Thành Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #444;
        }

        form {
            width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        form input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form button:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            color: green;
        }
    </style>
</head>
<body>
    <h1>Đăng Ký Thành Viên</h1>

    <form method="post" action="gdDangKy748.jsp">
        <label for="taiKhoan">Tài khoản:</label>
        <input type="text" name="taiKhoan" id="taiKhoan" required>

        <label for="matKhau">Mật khẩu:</label>
        <input type="password" name="matKhau" id="matKhau" required>

        <label for="hoVaTen">Họ và Tên:</label>
        <input type="text" name="hoVaTen" id="hoVaTen" required>

        <label for="sdt">Số điện thoại:</label>
        <input type="text" name="sdt" id="sdt" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <button type="submit">Đăng Ký</button>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String taiKhoan = request.getParameter("taiKhoan");
            String matKhau = request.getParameter("matKhau");
            String hoVaTen = request.getParameter("hoVaTen");
            String sdt = request.getParameter("sdt");
            String email = request.getParameter("email");

            KhachHang748 kh = new KhachHang748();
            kh.setTaiKhoan(taiKhoan);
            kh.setMatKhau(matKhau);
            kh.setHoVaTen(hoVaTen);
            kh.setLoaiNguoiDung("Khách hàng");
            kh.setDiem(0); // Điểm ban đầu
            kh.setSdt(sdt);
            kh.setEmail(email);

            NguoiDungDAO748 dao = new NguoiDungDAO748();
            int id = dao.addKH(kh); // Thêm khách hàng và lấy ID

            if (id > 0) {
                String maTheTV = "ttv" + id;
    %>
                <p class="message">Đăng ký thành công! Mã thẻ thành viên của bạn là: <strong><%= maTheTV %></strong></p>
    <%
            } else {
    %>
                <p class="message" style="color: red;">Đăng ký thất bại. Vui lòng thử lại!</p>
    <%
            }
        }
    %>
</body>
</html>

