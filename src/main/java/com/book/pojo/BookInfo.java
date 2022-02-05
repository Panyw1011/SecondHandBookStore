package com.book.pojo;

import java.math.BigDecimal;

public class BookInfo {
    private Integer bookId;
    private String bookName;
    private Integer bookLevel;
    private BigDecimal bookPrice;
    private String bookSort;
    private Integer bookCount;
    private String bookAuthor;
    private String bookPublisher;
    private String display;
    private Integer bookSales;
    private String userName;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getBookLevel() {
        return bookLevel;
    }

    public void setBookLevel(Integer bookLevel) {
        this.bookLevel = bookLevel;
    }

    public BigDecimal getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(BigDecimal bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookSort() {
        return bookSort;
    }

    public void setBookSort(String bookSort) {
        this.bookSort = bookSort;
    }

    public Integer getBookCount() {
        return bookCount;
    }

    public void setBookCount(Integer bookCount) {
        this.bookCount = bookCount;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPublisher() {
        return bookPublisher;
    }

    public void setBookPublisher(String bookPublisher) {
        this.bookPublisher = bookPublisher;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public Integer getBookSales() {
        return bookSales;
    }

    public void setBookSales(Integer bookSales) {
        this.bookSales = bookSales;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "BookInfo{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookLevel=" + bookLevel +
                ", bookPrice=" + bookPrice +
                ", bookSort='" + bookSort + '\'' +
                ", bookCount=" + bookCount +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPublisher='" + bookPublisher + '\'' +
                ", display='" + display + '\'' +
                ", bookSales=" + bookSales +
                ", userName='" + userName + '\'' +
                '}';
    }
}
