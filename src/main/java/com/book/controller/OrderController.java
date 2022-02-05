package com.book.controller;

import com.book.pojo.BookInfo;
import com.book.pojo.Cart;
import com.book.pojo.Order;
import com.book.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private CartService cartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private BookSortService bookSortService;
    @Autowired
    private BookImageService bookImageService;

    @RequestMapping("/buySelected")
    public String buySelected(String ck){
        int i = orderService.buySelected(ck);
        int j = cartService.deleteSelectedCart(ck);
        int k = orderService.addSale(ck);
        return "shoppingcart";
    }

    @RequestMapping("/myList")
    public String myList(Integer userId, Model model){
        List<Order> ol = orderService.getOrderById(userId);
        model.addAttribute("ol",ol);
        return "mylist";
    }

    @RequestMapping("/mySaleBook")
    public String mySaleBook(String userName,Model model){
        List<BookInfo> bl = bookInfoService.getBookListByName(userName);
        List<String> sl = bookSortService.getBookSort();
        model.addAttribute("sl",sl);
        model.addAttribute("bl",bl);
        return "sale_book";
    }

    @RequestMapping("/displayBook")
    public String displayBook(Integer bookId){
        int i = bookInfoService.displayBook(bookId);
        return "sale_book";
    }

    @RequestMapping("/addPic")
    public String addPic(Integer bookId ,String userName ,Model model){
        model.addAttribute("bookId",bookId);
        model.addAttribute("userName",userName);
        return "pic_add";
    }

    @RequestMapping("/addBookPic")
    public String addBookPic(MultipartFile bookPic,Integer bookId,String userName, HttpServletRequest request,Model model){
        String realPath = request.getSession().getServletContext().getRealPath("/images/");
        String fileName = bookPic.getOriginalFilename();
        File targetFile = new File(realPath,fileName);
        if (!targetFile.exists()){
            targetFile.mkdirs();
        }
        try {
            bookPic.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        int i = bookImageService.addBookPic(bookId,fileName);
        List<BookInfo> bl = bookInfoService.getBookListByName(userName);
        List<String> sl = bookSortService.getBookSort();
        model.addAttribute("sl",sl);
        model.addAttribute("bl",bl);
        return "sale_book";
    }
}
