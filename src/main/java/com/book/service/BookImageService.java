package com.book.service;

import com.book.pojo.BookImage;

import java.util.List;

public interface BookImageService {
    List<BookImage> getBookImage();
    List<BookImage> getAllBookImage(Integer bookSortId);
    List<BookImage> searchBookImage(String searchBook);
    BookImage getBookImageById(Integer bookId);
    List<BookImage> getSimilarBookImage(String bookSort);
    int addBookPic(Integer bookId,String path);
}
