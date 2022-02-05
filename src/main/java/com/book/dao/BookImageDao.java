package com.book.dao;

import com.book.pojo.BookImage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BookImageDao {
    List<BookImage> getBookImage();
    List<BookImage> getAllBookImage(Integer bookSortId);
    List<BookImage> searchBookImage(@Param("searchBook") String searchBook);
    BookImage getBookImageById(Integer bookId);
    List<BookImage> getSimilarBookImage(String bookSort);
    int addBookPic(@Param("bookId")Integer bookId,@Param("path") String path);
}
