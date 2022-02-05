package com.book.service.impl;

import com.book.dao.BookSortDao;
import com.book.pojo.BookSort;
import com.book.service.BookSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BookSortServiceImpl implements BookSortService {
    @Autowired
    private BookSortDao bookSortDao;
    @Override
    public List<String> getBookSort() {
        List<String> sl = bookSortDao.getBookSort();
        return sl;
    }

    @Override
    public List<BookSort> getSortList(String bookSort) {
        List<BookSort> bsl = bookSortDao.getSortList(bookSort);
        return bsl;
    }

    @Override
    public int getCount(String bookSort) {
        return bookSortDao.getCount(bookSort);
    }

    @Override
    public int addSort(BookSort bookSort) {
        return bookSortDao.addSort(bookSort);
    }

    @Override
    public int deleteSort(Integer booSortId) {
        return bookSortDao.deleteSort(booSortId);
    }

    @Override
    public BookSort findSortById(Integer bookSortId) {
        BookSort bookSort = bookSortDao.findSortById(bookSortId);
        return bookSort;
    }

    @Override
    public int updateSort(BookSort bookSort) {
        return bookSortDao.updateSort(bookSort);
    }

    @Override
    public int deleteSelectedSort(String ck) {
        return bookSortDao.deleteSelectedSort(ck);
    }

    @Override
    public List<Map<String,Object>> getSortSales() {
        List<Map<String,Object>> ssl = bookSortDao.getSortSales();
        return ssl;
    }
}
