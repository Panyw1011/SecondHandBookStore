package com.book.service;

import com.book.pojo.BookSort;

import java.util.List;
import java.util.Map;

public interface BookSortService {
    List<String> getBookSort();
    List<BookSort> getSortList(String bookSort);
    int getCount(String bookSort);
    int addSort(BookSort bookSort);
    int deleteSort(Integer booSortId);
    BookSort findSortById(Integer bookSortId);
    int updateSort(BookSort bookSort);
    int deleteSelectedSort(String ck);
    List<Map<String,Object>> getSortSales();
}
