public class AdapterTest {

    public static void main(String[] args) {

        // Using PayPal through Adapter
        PaymentProcessor paypal =
                new PayPalAdapter(new PayPalGateway());

        paypal.processPayment(1500);

        // Using Stripe through Adapter
        PaymentProcessor stripe =
                new StripeAdapter(new StripeGateway());

        stripe.processPayment(2500);
    }
}