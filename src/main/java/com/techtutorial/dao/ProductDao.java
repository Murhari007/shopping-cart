package com.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import com.techtutorial.model.Cart;
import com.techtutorial.model.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductDao(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			query = "select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;

	}
		
	public List<Cart>getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		try {
			if(cartList.size()>0)
			{
				for(Cart item:cartList)
				{
					query="select * from products where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs =pst.executeQuery();
					while(rs.next()) {
						Cart cart = new Cart();
						cart.setId(rs.getInt("id"));
						cart.setName(rs.getString("name"));
						cart.setCategory(rs.getString("category"));
						cart.setPrice(rs.getDouble("price")*item.getQuantity());
						cart.setQuantity(item.getQuantity());
						products.add(cart);						
					}
				}
			}
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return products;
	}
	public Product getSingleProduct(int id)
	{
		Product row =null;
	
			try{
				query="select * from orders where u_id=? order by orders.i_id desc";
				pst = this.con.prepareStatement(query);
				pst.setInt(1, id);
				rs = pst.executeQuery();
				
				while (rs.next())
				{
					row=new Product();
					row.setId(rs.getInt("id"));
					row.setName(rs.getString("name"));
					row.setCategory(rs.getString("category"));
					row.setPrice(rs.getDouble("price"));
					row.setImage(rs.getString("image"));
					

				}
			
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return row;
	}

	}

