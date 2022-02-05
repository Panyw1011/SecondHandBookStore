package com.book.service.impl;

import com.book.dao.BookImageDao;
import com.book.pojo.BookImage;
import com.book.service.BookImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookImageServiceImpl implements BookImageService {
    @Autowired
    private BookImageDao bookImageDao;
    @Override
    public List<BookImage> getBookImage() {
        List<BookImage> bimg = bookImageDao.getBookImage();
        return bimg;
    }

    @Override
    public List<BookImage> getAllBookImage(Integer bookSortId) {
        List<BookImage> bil = bookImageDao.getAllBookImage(bookSortId);
        return bil;
    }

    @Override
    public List<BookImage> searchBookImage(String searchBook) {
        List<BookImage> bil = bookImageDao.searchBookImage(searchBook);
        return bil;
    }

    @Override
    public BookImage getBookImageById(Integer bookId) {
        BookImage bookImage = bookImageDao.getBookImageById(bookId);
        return bookImage;
    }

    @Override
    public List<BookImage> getSimilarBookImage(String bookSort) {
        List<BookImage> bimg= bookImageDao.getSimilarBookImage(bookSort);
        return bimg;
    }

    @Override
    public int addBookPic(Integer bookId,String path) {
        return bookImageDao.addBookPic(bookId,path);
    }
}
