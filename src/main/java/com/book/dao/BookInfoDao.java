package com.book.dao;

import com.book.pojo.BookInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BookInfoDao {
    List<BookInfo> getBookList(@Param("bookId")Integer bookId,@Param("bookName")String bookName,@Param("bookSort")String bookSort
            ,@Param("bookAuthor") String bookAuthor,@Param("bookPublisher")String bookPublisher,@Param("userName")String userName);
    int getCount(@Param("bookId")Integer bookId,@Param("bookName")String bookName,@Param("bookSort")String bookSort
            ,@Param("bookAuthor") String bookAuthor,@Param("bookPublisher")String bookPublisher,@Param("userName")String userName);
    int addBook(BookInfo bookInfo);
    int deleteBook(Integer bookId);
    BookInfo findBookById(Integer bookId);
    int updateBook(BookInfo bookInfo);
    int deleteSelectedBook(String ck);
    List<BookInfo> getBookListByName(@Param("userName")String userName);
    int displayBook(Integer bookId);
}
