package com.book.controller;

import com.book.pojo.Cart;
import com.book.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping("/addCart")
    public String addCart(Integer bookId,Integer userId){
        int i = cartService.addCart(userId,bookId);
        return "book_detail";
    }

    @RequestMapping("/shoppingCart")
    public String shoppingCart(Integer userId, Model model){
        List<Cart> cl = cartService.getUserCart(userId);
        model.addAttribute("cl",cl);
        return "shoppingcart";
    }

    @RequestMapping("/deleteSelectedCart")
    @ResponseBody
    public String deleteSelectedCart(String ck){
        int i = cartService.deleteSelectedCart(ck);
        return "shoppingcart";
    }

}
