package com.book.service.impl;

import com.book.dao.BookInfoDao;
import com.book.pojo.BookInfo;
import com.book.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookInfoServiceImpl implements BookInfoService {
    @Autowired
    private BookInfoDao bookInfoDao;
    @Override
    public List<BookInfo> getBookList(Integer bookId,String bookName,String bookSort,String bookAuthor,String bookPublisher,String userName) {
        List<BookInfo> bl = bookInfoDao.getBookList(bookId,bookName,bookSort,bookAuthor,bookPublisher,userName);
        return bl;
    }

    @Override
    public int getCount(Integer bookId,String bookName,String bookSort,String bookAuthor,String bookPublisher,String userName) {
        return bookInfoDao.getCount(bookId,bookName,bookSort,bookAuthor,bookPublisher,userName);
    }

    @Override
    public int addBook(BookInfo bookInfo) {
        return bookInfoDao.addBook(bookInfo);
    }

    @Override
    public int deleteBook(Integer bookId) {
        return bookInfoDao.deleteBook(bookId);
    }

    @Override
    public BookInfo findBookById(Integer bookId) {
        BookInfo bookInfo = bookInfoDao.findBookById(bookId);
        return bookInfo;
    }

    @Override
    public int updateBook(BookInfo bookInfo) {
        return bookInfoDao.updateBook(bookInfo);
    }

    @Override
    public int deleteSelectedBook(String ck) {
        return bookInfoDao.deleteSelectedBook(ck);
    }

    @Override
    public List<BookInfo> getBookListByName(String userName) {
        List<BookInfo> bl = bookInfoDao.getBookListByName(userName);
        return bl;
    }

    @Override
    public int displayBook(Integer bookId) {
        return bookInfoDao.displayBook(bookId);
    }
}
