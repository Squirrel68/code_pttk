<%-- 
    Document   : gdSuatChieuPhim748
    Created on : Nov 22, 2024, 7:12:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page import="model.TKSuatChieu748" %>
<%@ page import="dao.TKSuatChieuDAO748" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê suất chiếu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #444;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        button {
            padding: 10px 15px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px 0;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
        // Lấy thông tin từ query parameters
        String phimIDParam = request.getParameter("id");
        String nBDParam = request.getParameter("nBD");
        String nKTParam = request.getParameter("nKT");

        int tongSoVe = 0;  // Biến tổng số vé
        float tongDoanhThu = 0;  // Biến tổng doanh thu

        if (phimIDParam != null && nBDParam != null && nKTParam != null) {
            int phimID = Integer.parseInt(phimIDParam);
            Date nBD = Date.valueOf(nBDParam);
            Date nKT = Date.valueOf(nKTParam);

            TKSuatChieuDAO748 dao = new TKSuatChieuDAO748();
            ArrayList<TKSuatChieu748> list = dao.getDsTKSChieu(nBD, nKT, phimID);

            if (!list.isEmpty()) {
    %>
                <button onclick="history.back()">Back</button>
                <h1>Thống kê suất chiếu của phim <%= list.get(0).getPhim().getTenPhim() %></h1>
                <h1>Từ ngày: <%= nBD %></h1>
                <h1>Đến ngày: <%= nKT %> </h1>
                

                <!-- Hiển thị bảng thống kê -->
                <table>
                    <thead>
                        <tr>
                            <th>Ngày chiếu</th>
                            <th>Giờ chiếu</th>
                            <th>Phòng chiếu</th>
                            <th>Tổng số vé</th>
                            <th>Tổng doanh thu (VND)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (TKSuatChieu748 suatChieu : list) {
                                // Cập nhật tổng số vé và doanh thu
                                tongSoVe += suatChieu.getTongSoVe();
                                tongDoanhThu += suatChieu.getTongDoanhThu();
                        %>
                        <tr onclick="window.location.href='gdHoaDonSC748.jsp?id=<%= suatChieu.getID()%>&nBD=<%= nBD %>&nKT=<%= nKT %>'">
                            <td><%= suatChieu.getNgayChieu() %></td>
                            <td><%= suatChieu.getGioChieu() %></td>
                            <td>Phòng <%= suatChieu.getPhongChieu().getID() %></td>
                            <td><%= suatChieu.getTongSoVe() %></td>
                            <td><%= suatChieu.getTongDoanhThu() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <!-- Hiển thị tổng cộng -->
                <h3>Tổng cộng:</h3>
                <p>Tổng số vé: <%= tongSoVe %></p>
                <p>Tổng doanh thu: <%= tongDoanhThu %> VND</p>
    <%
            } else {
                out.println("<p>Không có dữ liệu suất chiếu cho phim trong khoảng thời gian đã chọn.</p>");
            }
        } else {
            out.println("<p>Thiếu thông tin phim hoặc ngày bắt đầu/kết thúc.</p>");
        }
    %>
</body>

</html>
