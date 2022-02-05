package com.book.controller;

import com.book.pojo.BookSort;
import com.book.service.BookSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookSortController {
    @Autowired
    private BookSortService bookSortService;

    @RequestMapping("/findSort")
    public String findSort(String bookSort, Model model){
        List<BookSort> bsl = bookSortService.getSortList(bookSort);
        int sCount = bookSortService.getCount(bookSort);
        model.addAttribute("bsl",bsl);
        model.addAttribute("sCount",sCount);
        return "sort_list";
    }

    @RequestMapping(value = "/addSort", method = RequestMethod.POST)
    @ResponseBody
    public String addSort(@RequestBody BookSort bookSort){
        int i = bookSortService.addSort(bookSort);
        return "sort_list";
    }

    @RequestMapping("/deleteSort")
    @ResponseBody
    public String deleteSort(Integer bookSortId){
        int i = bookSortService.deleteSort(bookSortId);
        return "sort_list";
    }

    @RequestMapping("/deleteSelectedSort")
    @ResponseBody
    public String deleteSelectedSort(String ck){
        int i = bookSortService.deleteSelectedSort(ck);
        return "sort_list";
    }

    @RequestMapping("/findSortById")
    public String findSortById(Integer bookSortId, Model model){
        BookSort modifySort = bookSortService.findSortById(bookSortId);
        model.addAttribute("modifySort",modifySort);
        return "sort_edit";
    }

    @RequestMapping(value = "/updateSort", method = RequestMethod.POST)
    public String updateSort(BookSort bookSort){
        int i = bookSortService.updateSort(bookSort);
        return "redirect:/findSort";
    }
}
