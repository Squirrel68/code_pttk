<%-- 
    Document   : gdTKPhim748
    Created on : Nov 3, 2024, 10:06:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>
<%@ page import="model.TKPhim748" %>
<%@ page import="dao.TKPhimDAO748" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thống kê phim</title>
</head>
<body>
    <button onclick="history.back()">Back</button>
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
    %>
                <!-- Hiển thị kết quả thống kê trong bảng -->
                <table border="1">
                    <thead>
                        <tr>
                            <th>Tên phim</th>
                            <th>Thể loại</th>
                            <th>Thời lượng</th>
                            <th>Mô tả</th>
                            <th>Tổng số vé</th>
                            <th>Tổng doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (TKPhim748 phim : list) {
                        %>
                        <tr>
                            <td>
                                <a href="gdSuatChieuPhim748.jsp?id=<%= phim.getId() %>&nBD=<%= nBD %>&nKT=<%= nKT %>">
                                    <%= phim.getTenPhim() %>
                                </a>
                            </td>
                            <td><%= phim.getTheLoai() %></td>
                            <td><%= phim.getThoiLuong() %> phút</td>
                            <td><%= phim.getMoTa() %></td>
                            <td><%= phim.getTongSoVe() %></td>
                            <td><%= phim.getTongDoanhThu() %> VND</td>
                        </tr>
                        <%
                            }
                        %>
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
