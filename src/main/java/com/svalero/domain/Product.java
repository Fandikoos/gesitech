package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {

    private int ID_PRODUCTO;
    @NonNull
    private String NOMBRE;
    @NonNull
    private int STOCK;
    @NonNull
    private int PRECIO;

}
