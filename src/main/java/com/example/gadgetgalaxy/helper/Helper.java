package com.example.gadgetgalaxy.helper;

import com.example.gadgetgalaxy.dto.PageableResponse;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.stream.Collectors;

 public class Helper {

    //u-> entity , V-> dto
    public static<U,V> PageableResponse<V> getPageableResponse(Page<U> page,Class<V> type){
        List<U> U = page.getContent();

        List<V> userDtos = U.stream().map(object -> new ModelMapper().map(object,type)).collect(Collectors.toList());

        PageableResponse<V> response = new PageableResponse<>();
        response.setContent(userDtos);
        response.setPageNumber(page.getNumber());//if want to start page from 1 just simply add 1 here also
        // when calling do a pagenumber-1 so that whatever
        // you pass internally for system its 0 based indexed or starts from 0
        response.setPageSize(page.getSize());
        response.setTotalElements(page.getTotalElements());
        response.setTotalPages(page.getTotalPages());
        response.setLastPage(page.isLast());

        return response;
    }
}
