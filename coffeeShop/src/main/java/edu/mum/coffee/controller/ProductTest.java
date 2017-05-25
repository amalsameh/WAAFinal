package edu.mum.coffee.controller;

import edu.mum.coffee.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by amal- on 5/25/2017.
 */
@Controller
public class ProductTest {
    @GetMapping({"/products"})
    public String personTestsrv(Model model)
    {
        RestTemplate restTemplate=new RestTemplate();
        List<Product> products=restTemplate.getForObject("http://localhost:8080/product", ArrayList.class);
        model.addAttribute("products",products);
        return "products";
    }
}
