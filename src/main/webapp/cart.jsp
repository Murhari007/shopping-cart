<%@page import="com.techtutorial.connection.DbCon"%>
<%@page import="com.techtutorial.dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@page import="com.techtutorial.model.*"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
double price = 0.0D;
out.println("System");
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	for (Cart c : cartProduct) {
		price = price + c.getPrice();
	}
	request.setAttribute("cart-list", cartProduct);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Shopping Cart...!</title>
<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td {
	verticle-align: middle;
}

{
.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
}
</style>
<title>Cart Page</title>

</head>
<body>

	<%@include file="includes/navabar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>
				Total Price:<%=price%></h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=c.getPrice()%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control w-50"
									value="<%=c.getQuantity()%>"> <a
									class="btn bnt-sm btn-incre"
									href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a>

							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger"
						href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
			</tbody>

			</div>
			<%
			}
			}
			%>




			<%@include file="includes/footer.jsp"%>
</body>
</html>