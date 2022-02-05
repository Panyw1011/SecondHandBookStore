package com.book.pojo;

import java.math.BigDecimal;

public class BookImage {
    private Integer bookId;
    private String bookName;
    private BigDecimal bookPrice;
    private String bookAuthor;
    private Integer bookSales;
    private String url;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public BigDecimal getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(BigDecimal bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public Integer getBookSales() {
        return bookSales;
    }

    public void setBookSales(Integer bookSales) {
        this.bookSales = bookSales;
    }
}
