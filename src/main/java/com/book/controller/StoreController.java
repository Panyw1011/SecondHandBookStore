package com.book.controller;

import com.book.pojo.BookImage;
import com.book.pojo.BookInfo;
import com.book.pojo.BookSort;
import com.book.service.BookImageService;
import com.book.service.BookInfoService;
import com.book.service.BookSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.rmi.Remote;
import java.util.List;

@Controller
public class StoreController {
    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private BookImageService bookImageService;
    @Autowired
    private BookSortService bookSortService;

    @RequestMapping("/storePage")
    public String storePage(Model model){
        List<BookImage> bimg = bookImageService.getBookImage();
        model.addAttribute("bimg",bimg);
        return "storepage";
    }

    @RequestMapping("/userLogin")
    public String toUserLogin(){
        return "userlogin";
    }

    @RequestMapping("/toAdminLogin")
    public String toAdminLogin(){
        return "login";
    }

    @RequestMapping("/allBook")
    public String allBook(String bookSort,Model model,Integer bookSortId){
        List<BookSort> bsl = bookSortService.getSortList(bookSort);
        model.addAttribute("bsl",bsl);
        List<BookImage> bil = bookImageService.getAllBookImage(bookSortId);
        model.addAttribute("bil",bil);
        return "allbook";
    }

    @RequestMapping("/findBookImage")
    public String findBookImage(String bookSort,String searchBook,Model model){
        List<BookSort> bsl = bookSortService.getSortList(bookSort);
        model.addAttribute("bsl",bsl);
        List<BookImage> bil = bookImageService.searchBookImage(searchBook);
        model.addAttribute("bil",bil);
        return "allbook";
    }

    @RequestMapping("/bookDetail")
    public String bookDetail(Integer bookId,Model model){
        BookInfo bookInfo = bookInfoService.findBookById(bookId);
        BookImage bookImage = bookImageService.getBookImageById(bookId);
        List<BookImage> bimg = bookImageService.getSimilarBookImage(bookInfo.getBookSort());
        model.addAttribute("bimg",bimg);
        model.addAttribute("clickBook",bookInfo);
        model.addAttribute("clickBookImage",bookImage);
        return "book_detail";
    }



}
