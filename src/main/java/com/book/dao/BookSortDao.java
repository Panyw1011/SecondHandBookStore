package com.book.dao;

import com.book.pojo.BookImage;
import com.book.pojo.BookInfo;
import com.book.pojo.BookSort;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface BookSortDao {
    List<String> getBookSort();
    List<BookSort> getSortList(@Param("bookSort")String bookSort);
    int getCount(@Param("bookSort")String bookSort);
    int addSort(BookSort bookSort);
    int deleteSort(Integer booSortId);
    BookSort findSortById(Integer bookSortId);
    int updateSort(BookSort bookSort);
    int deleteSelectedSort(String ck);
    List<Map<String,Object>> getSortSales();
}
