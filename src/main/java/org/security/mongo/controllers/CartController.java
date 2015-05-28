package org.security.mongo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.security.mongo.entities.Cart;
import org.security.mongo.entities.Product;
import org.security.repositories.IProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
	
	@Autowired
	private IProduct product;
	
	@RequestMapping(value="/cart", method = RequestMethod.GET)
	public String product(HttpSession session, Model model) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		if (list != null) {
			model.addAttribute("products", list);
			model.addAttribute("count", list.size());
		}
		return "cart";
	}
	
	@RequestMapping(value="/addToCart", method = RequestMethod.POST)
	public String addToCart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Integer price = Integer.parseInt(request.getParameter("price"));
		Integer finalPrice = Integer.parseInt(request.getParameter("finalPrice"));
		Integer discount = Integer.parseInt(request.getParameter("discount"));
		Integer totalQuontity = Integer.parseInt(request.getParameter("totalCount"));
		Cart cart = new Cart();
		cart.setId(id);
		cart.setName(name);
		cart.setQuontity(1);
		cart.setDiscount(discount);
		cart.setPrice(price);
		cart.setFinalPrice(finalPrice);
		cart.setTotalQuontity(totalQuontity);
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		if (list == null) {
			list = new ArrayList<Cart>();
			list.add(cart);
		} else {
			boolean flag = false;
			for (Cart c : list) {
				if (c.getId().equals(id)) {
					flag = true;
					break;
				}
			}
			if (flag == false)
				list.add(cart);
		}
		session.setAttribute("cart", list);
		model.addAttribute("products", list);
		model.addAttribute("count", list.size());
		model.addAttribute("totalPrice", getTotalPrice(list));
		return "cart";
	}
	
	@RequestMapping(value="/removeFromCart")
	public String removeFromCart(HttpSession session, String product, Model model) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		for (Cart cart : list) {
			if (cart.getName().equals(product)) {
				list.remove(cart);
				break;
			}
		}
		session.setAttribute("cart", list);
		model.addAttribute("products", list);
		model.addAttribute("count", list.size());
		model.addAttribute("totalPrice", getTotalPrice(list));
		return "cart";
	}
	
	public Integer getTotalPrice(List<Cart> list) {
		Integer total = 0;
		for (Cart cart : list) {
			total += cart.getQuontity() * cart.getFinalPrice();
		}
		return total;
	}
	
	@RequestMapping(value="/reCountPrice")
	public String reCountPrice(HttpSession session, String product, Integer quontity, Model model) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		for (Cart cart : list) {
			if (cart.getName().equals(product)) {
				cart.setQuontity(quontity);
				break;
			}
		}
		session.setAttribute("cart", list);
		model.addAttribute("products", list);
		model.addAttribute("count", list.size());
		model.addAttribute("totalPrice", getTotalPrice(list));
		return "cart";
	}
}