package com.svalero.domain;

import lombok.*;

import java.time.LocalDate;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Order {

    private int id_order;
    @NonNull
    private int id_customer;
    @NonNull
    private int id_product;
    @NonNull
    private LocalDate registrationDate;

}
