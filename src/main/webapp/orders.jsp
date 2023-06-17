<%@page import="com.techtutorial.model.Order"%>
<%@page import="com.techtutorial.connection.DbCon"%>
<%@page import="com.techtutorial.dao.OrderDao"%>
<%@page import="com.techtutorial.model.Cart"%>
<%@page import="com.techtutorial.model.User"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
		<%
	User auth = (User) request.getSession().getAttribute("auth");
		List<Order>orders = null;
	if(auth != null){
		request.setAttribute("auth",auth);
		//response.sendRedirect("index.jsp");
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
	}else
	{
		response.sendRedirect("login.jsp");	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {

		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Shopping Cart...!</title>
<%@include file="includes/head.jsp" %>
<title>Cart Page</title>

</head>
<body>

<%@include file="includes/navabar.jsp" %>
<div class="container"></div>
	
	<div class="container">
	<div class=cart-header my-3">All Orders</div>
	<table class="table table-light">
	<thead>
		<thead>
		<tr>
		<th scope="col">Date</th>
		<th scope="col">Name</th>
	   	<th scope="col">Category</th>
	   	<th scope="col">Quantity</th>
		<th scope="col">Price</th>
	   	<th scope="col">Cancel</th>
	   </tr>
	   </thead>
	</tbody>
		
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
	
	</tbody>
	</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>