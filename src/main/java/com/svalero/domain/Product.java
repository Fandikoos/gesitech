package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {


    private int id_product;
    @NonNull
    private String name;
    @NonNull
    private int stock;
    @NonNull
    private int price;

}
