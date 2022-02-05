package com.book.service;

import com.book.pojo.BookInfo;

import java.util.List;

public interface BookInfoService {
    List<BookInfo> getBookList(Integer bookId,String bookName,String bookSort,String bookAuthor,String bookPublisher,String userName);
    int getCount(Integer bookId,String bookName,String bookSort,String bookAuthor,String bookPublisher,String userName);
    int addBook(BookInfo bookInfo);
    int deleteBook(Integer bookId);
    BookInfo findBookById(Integer bookId);
    int updateBook(BookInfo bookInfo);
    int deleteSelectedBook(String ck);
    List<BookInfo> getBookListByName(String userName);
    int displayBook(Integer bookId);
}
