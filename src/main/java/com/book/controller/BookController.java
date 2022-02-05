package com.book.controller;

import com.book.pojo.BookInfo;
import com.book.service.BookInfoService;
import com.book.service.BookSortService;
import com.book.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookInfoService bookInfoService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private BookSortService bookSortService;

    @RequestMapping("/findBook")
    public String findBook(Integer bookId,String bookName,String bookSort,String bookAuthor,String bookPublisher,String userName,Model model){
        List<BookInfo> bl = bookInfoService.getBookList(bookId,bookName,bookSort,bookAuthor,bookPublisher,userName);
        int bCount = bookInfoService.getCount(bookId,bookName,bookSort,bookAuthor,bookPublisher,userName);
        List<String> nl = userInfoService.getUserName();
        List<String> sl = bookSortService.getBookSort();
        model.addAttribute("sl",sl);
        model.addAttribute("nl",nl);
        model.addAttribute("bl",bl);
        model.addAttribute("bCount",bCount);
        return "book_list";
    }

    @RequestMapping("/deleteBook")
    @ResponseBody
    public String deleteBook(Integer bookId){
        int i = bookInfoService.deleteBook(bookId);
        return "book_list";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    @ResponseBody
    public String addUser(@RequestBody BookInfo bookInfo){
        System.out.println(bookInfo);
        int i = bookInfoService.addBook(bookInfo);
        return "book_list";
    }

    @RequestMapping("/deleteSelectedBook")
    @ResponseBody
    public String deleteSelectedBook(String ck){
        int i = bookInfoService.deleteSelectedBook(ck);
        return "book_list";
    }

    @RequestMapping("/findBookById")
    public String findUserById(Integer bookId, Model model){
        BookInfo modifyBook = bookInfoService.findBookById(bookId);
        List<String> sl = bookSortService.getBookSort();
        model.addAttribute("sl",sl);
        model.addAttribute("modifyBook",modifyBook);
        if ("是".equals(modifyBook.getDisplay())){
            model.addAttribute("yes","checked=''");
            model.addAttribute("no","");
        }else {
            model.addAttribute("no","checked=''");
            model.addAttribute("yes","");
        }
        return "book_edit";
    }

    @RequestMapping(value = "/updateBook", method = RequestMethod.POST)
    public String updateBook(BookInfo bookInfo){
        int i = bookInfoService.updateBook(bookInfo);
        return "redirect:/findBook";
    }

    @RequestMapping("/getUserName")
    public List<String> getUserName(){
        List<String> nl = userInfoService.getUserName();
        return nl;
    }
}
