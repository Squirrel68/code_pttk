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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #444;
        }

        button {
            padding: 10px 15px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        label {
            font-size: 1rem;
        }

        select {
            padding: 5px;
            font-size: 1rem;
            margin: 10px;
        }
    </style>
</head>
<body>
    <button onclick="history.back()">Back</button>
    <h1>Chọn kiểu thống kê</h1>

    <form method="post">
        <label for="thongke">Chọn kiểu thống kê:</label>
        <select id="thongke" name="thongke">
            <option value="phim">Thống kê Phim</option>
            <option value="khachhang">Thống kê Khách hàng</option>
        </select>
        <button type="submit">Thống kê</button>
    </form>

    <%
        String selectedOption = request.getParameter("thongke");
        if (selectedOption != null) {
            if ("phim".equals(selectedOption)) {
                response.sendRedirect("gdTKPhim748.jsp");
            } else if ("khachhang".equals(selectedOption)) {
                response.sendRedirect("gdTKKhachHang748.jsp");
            } else {
                out.println("Lựa chọn không hợp lệ.");
            }
        }
    %>
</body>
</html>
