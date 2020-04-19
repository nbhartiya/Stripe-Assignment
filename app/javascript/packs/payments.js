import { logger } from "@rails/actioncable";

var stripe = Stripe('pk_test_zoQCOxSYlUEvu5xesw4tPlIR00h7LFVQUy');
var elements = stripe.elements();


// Set up Stripe.js and Elements to use in checkout form
var style = {
    base: {
        color: "#32325d",
    }
};

var card = elements.create("card", { style: style });
card.mount("#card-element");