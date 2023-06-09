package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {

    private int id;
    @NonNull
    private String name;
    @NonNull
    private int price;
    @NonNull
    private int stock;
    @NonNull
    private String image;


}
