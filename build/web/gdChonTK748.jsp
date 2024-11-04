<%-- 
    Document   : gdChonTK748
    Created on : Nov 4, 2024, 4:54:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chọn kiểu thống kê</title>
</head>
<body>
    <button onclick="history.back()">Back</button>
    <h1>Chọn kiểu thống kê</h1>

    <form method="post">
        <!-- Dropdown selection for statistics type -->
        <label for="thongke">Chọn kiểu thống kê:</label>
        <select id="thongke" name="thongke">
            <option value="phim">Thống kê Phim</option>
            <option value="khachhang">Thống kê Khách hàng</option>
        </select>
        
        <!-- Submit button -->
        <button type="submit">Thống kê</button>
    </form>

    <%
        // Lấy thông tin từ form nếu có (chỉ xử lý khi form được submit)
        String selectedOption = request.getParameter("thongke");

        if (selectedOption != null) {
            // Kiểm tra giá trị đã chọn và điều hướng tương ứng
            if ("phim".equals(selectedOption)) {
                response.sendRedirect("gdTKPhim748.jsp");
            } else if ("khachhang".equals(selectedOption)) {
                response.sendRedirect("gdTKKhachHang748.jsp"); // Trang thống kê khách hàng
            } else {
                out.println("Lựa chọn không hợp lệ.");
            }
        }
    %>
</body>
</html>
