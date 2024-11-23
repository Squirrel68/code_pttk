<%-- 
    Document   : gdHoaDonSC748.jsp
    Created on : Nov 22, 2024, 8:29:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page import="model.HoaDon748" %>
<%@ page import="dao.HoaDonDAO748" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết Hóa Đơn Suất Chiếu</title>
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
    <button onclick="history.back()">Back</button>
    <h1>Danh sách hóa đơn cho suất chiếu ID: <%= request.getParameter("id") %></h1>
    <h1>Từ ngày: <%= request.getParameter("nBD") %></h1>
    <h1>Đến ngày: <%= request.getParameter("nKT") %> </h1>

    <%
        // Lấy thông tin từ query parameters
        String suatChieuIDParam = request.getParameter("id");
        String nBDParam = request.getParameter("nBD");
        String nKTParam = request.getParameter("nKT");

        if (suatChieuIDParam != null && nBDParam != null && nKTParam != null) {
            int suatChieuID = Integer.parseInt(suatChieuIDParam);
            Date nBD = Date.valueOf(nBDParam);
            Date nKT = Date.valueOf(nKTParam);

            // Truy vấn dữ liệu từ DAO
            HoaDonDAO748 dao = new HoaDonDAO748();
            ArrayList<HoaDon748> listHoaDon = dao.getDsHoaDon(nBD, nKT, suatChieuID);

            if (!listHoaDon.isEmpty()) {
    %>
                <!-- Hiển thị bảng danh sách hóa đơn -->
                <table>
                    <thead>
                        <tr>
                            <th>Mã Hóa Đơn</th>
                            <th>Ngày Hóa Đơn</th>
                            <th>Tổng Số Vé</th>
                            <th>Tổng Tiền (VND)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (HoaDon748 hoaDon : listHoaDon) {
                        %>
                        <tr>
                            <td><%= hoaDon.getID() %></td>
                            <td><%= hoaDon.getNgay() %></td>
                            <td><%= hoaDon.getTongSoVe() %></td>
                            <td><%= hoaDon.getTongTien() %> VND</td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
    <%
            } else {
                out.println("<p>Không có hóa đơn trong khoảng thời gian đã chọn.</p>");
            }
        } else {
            out.println("<p>Thiếu thông tin suất chiếu hoặc ngày bắt đầu/kết thúc.</p>");
        }
    %>
</body>
</html>

