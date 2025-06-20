<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품등록</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            상품 등록
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmAddProduct" action="./add_product_process.jsp" class="form-horizontal" method="post">
                <div class="form-group row">
                    <label for="productId" class="col-sm-2">상품 코드</label>
                    <div class="col-sm-4">
                        <input type="text" id="productId" name="productId" class="form-control">
                    </div>
                </div>
                    <div class="form-group row">
                        <label for="productName" class="col-sm-2">상품 이름</label>
                        <div class="col-sm-7">
                            <input type="text" id="productName" name="productName" class="form-control">
                        </div>
                    </div>
                <div class="form-group row">
                    <label for="unitPrice" class="col-sm-2">상품 가격</label>
                    <div class="col-sm-5">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="manufacturer" class="col-sm-2">제조사</label>
                    <div class="col-sm-5">
                        <input type="text" id="manufacturer" name="manufacturer" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="category" class="col-sm-2">분류</label>
                    <div class="col-sm-5">
                        <select name="category" id="category">
                            <option value="Smart Phone">스마트폰</option>
                            <option value="Notebook">노트북</option>
                            <option value="Tablet">태블릿</option>
                            <option value="Accessory">액세서리</option>
                            <option value="Etc">기타</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="unitsInStock" class="col-sm-2">재고 수</label>
                    <div class="col-sm-3">
                        <input type="number" id="unitsInStock" name="unitsInStock" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="condition" class="col-sm-2">제품 상태</label>
                    <div class="col-sm-5">
                        <input type="radio" name="condition" value="New" checked> 신상품
                        <input type="radio" name="condition" value="Old"> 중고
                        <input type="radio" name="condition" value="Refurbished"> 재생품
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-2">상품 정보</label>
                    <div class="col-sm-5">
                        <textarea type="text" id="description" name="description" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="등록" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
