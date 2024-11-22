<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page import="model.TKPhim748" %>
<%@ page import="dao.TKPhimDAO748" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê phim</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #444;
        }
        form {
            margin: 20px auto;
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        form label {
            margin: 10px 0;
            font-size: 1rem;
        }
        form input {
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
        form button {
            padding: 10px 15px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        form button:hover {
            background-color: #0056b3;
        }
        table {
            margin: 20px auto;
            width: 80%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .total-row {
            font-weight: bold;
            background-color: #f9f9f9;
        }
        button {
            margin: 10px 0;
            padding: 10px;
        }
    </style>
</head>
<body>
    <button onclick="window.location='gdChonTK748.jsp'">Back</button>
    <h1>Thống kê phim</h1>

    <!-- Form chọn ngày bắt đầu và ngày kết thúc -->
    <form method="post">
        <label for="nBD">Ngày bắt đầu:</label>
        <input type="date" id="nBD" name="nBD" required>

        <label for="nKT">Ngày kết thúc:</label>
        <input type="date" id="nKT" name="nKT" required>

        <button type="submit">Thống kê</button>
    </form>

    <%
        // Kiểm tra nếu form được submit với các giá trị ngày bắt đầu và ngày kết thúc
        String nBDParam = request.getParameter("nBD");
        String nKTParam = request.getParameter("nKT");

        if (nBDParam != null && nKTParam != null) {
            Date nBD = Date.valueOf(nBDParam);
            Date nKT = Date.valueOf(nKTParam);

            TKPhimDAO748 dao = new TKPhimDAO748();
            ArrayList<TKPhim748> list = dao.getDsTKPhim(nBD, nKT);

            if (!list.isEmpty()) {
                int totalTickets = 0;
                long totalRevenue = 0;

                for (TKPhim748 phim : list) {
                    totalTickets += phim.getTongSoVe();
                    totalRevenue += phim.getTongDoanhThu();
                }
    %>
                <!-- Hiển thị kết quả thống kê trong bảng -->
                <table>
                    <thead>
                        <tr>
                            <th>Tên phim</th>
                            <th>Tổng số vé</th>
                            <th>Tổng doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (TKPhim748 phim : list) {
                        %>
                        <tr onclick="window.location='gdSuatChieuPhim748.jsp?id=<%= phim.getID() %>&nBD=<%= nBD %>&nKT=<%= nKT %>'">
                            <td>
                                <%= phim.getTenPhim() %>
                            </td>
                            <td><%= phim.getTongSoVe() %></td>
                            <td><%= phim.getTongDoanhThu() %> VND</td>
                        </tr>
                        <%
                            }
                        %>
                        <!-- Tổng số vé và tổng doanh thu -->
                        <tr class="total-row">
                            <td>Tổng cộng</td>
                            <td><%= totalTickets %></td>
                            <td><%= totalRevenue %> VND</td>
                        </tr>
                    </tbody>
                </table>
    <%
            } else {
                out.println("<p>Không có dữ liệu thống kê cho khoảng thời gian đã chọn.</p>");
            }
        }
    %>
</body>
</html>
