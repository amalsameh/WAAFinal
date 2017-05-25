<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <jsp:include page="layout.jsp"></jsp:include>
</head>
<body>

<div id="home" class="container-fluid">

    <div id="carousel-generic" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-generic" data-slide-to="1"></li>
            <li data-target="#carousel-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../resources/image/ads/1.jpg" class="img img-rounded" style="height: 350px; width: 100%"/>
                <div class="carousel-caption">
                    <h3>Coffee Shop</h3>
                </div>
            </div>
            <div class="item">
                <img src="../resources/image/ads/4.jpg" alt="..." style="height: 350px; width: 100%">
                <div class="carousel-caption">
                    <h3>Coffee Shop</h3>
                </div>
            </div>
            <div class="item">
                <img src="../resources/image/ads/5.jpg" alt="..." style="height: 350px; width: 100%">
                <div class="carousel-caption">
                    <h3>Coffee Shop</h3>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div> <!-- Carousel -->

    <h2>Products</h2>
    <div class="container" style="margin-top: 10px">

        <hr/>
        <div class="row">

            <c:forEach items="${products}" var="product" varStatus="loop">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="thumbnail">
                        <c:choose>
                            <c:when test="${loop.count == 1}">
                                <img class="img   img-responsive" src="../resources/image/ads/p1.jpg"/>
                            </c:when>
                            <c:when test="${loop.count == 2}">
                                <img class="img img-responsive" src="../resources/image/ads/p2.jpg"/>
                            </c:when>
                            <c:when test="${loop.count == 3}">
                                <img class="img   img-responsive" src="../resources/image/ads/p3.jpg"/>
                            </c:when>
                            <c:when test="${loop.count == 4}">
                                <img class="img  img-responsive" src="../resources/image/ads/p4.jpg"/>
                            </c:when>
                            <c:when test="${loop.count == 5}">
                                <img class="img   img-responsive" src="../resources/image/ads/p5.jpg"/>
                            </c:when>
                            <c:otherwise>
                                <img class="img   img-responsive" src="../resources/image/ads/p6.jpg"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="caption">
                            <div class="name">${product.productName}</div>
                            <div class="price">$${product.price}</div>
                        </div>
                        <sec:authorize access="hasRole('USER')">
                            <a class="btn btn-danger" href="product/addToCart?productId=${product.id}">Add To Cart</a>
                        </sec:authorize>

                    </div>
                </div>

            </c:forEach>

        </div>

    </div>

</div>
</body>
</html>