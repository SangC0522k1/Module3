
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .login {
            height:380px; width:250px;
            margin:0;
            padding:10px;
            border:1px #CCC solid;
        }
        .login input {
            padding:5px; margin:5px
        }
    </style>
</head>
<body>
<form action="/discount" method="post">
    <div class="login">
        <h2>Product Discount Calculator</h2>
        <label>Product Description:</label><br>
        <input type="text" name="description" placeholder="Mô tả sản phẩm"><br>
        <label>List Price:</label><br>
        <input type="number" name="price" placeholder="Giá niêm yết của sản phẩm"><br>
        <label>Discount Percent:</label><br>
        <input type="number" name="percent" placeholder="Tỷ lệ chiết khấu (phần trăm)"><br>
        <input type="submit" id="submit" value="Result">
    </div>
    </form>
</body>
</html>
