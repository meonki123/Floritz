package com.board.api;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

    private final IamportClient iamportClient;

    public PaymentController() {
        this.iamportClient = new IamportClient("4681403328050202",
                "6ZkGvaxMEVpOe7IgInctIxbbDaUFyy3ZDZhalbVTo9szlZJdVTl82DejFY2CMjlWi9s3VxyVDxo0cyOB");
    }

    @ResponseBody
    @RequestMapping("/verify/{imp45706873}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp45706873") String imp_uid)
            throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }

}
