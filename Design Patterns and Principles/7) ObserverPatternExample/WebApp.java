public class WebApp implements Observer {

    private final String user;

    public WebApp(String user) {
        this.user = user;
    }

    @Override
    public void update(String stockName, double price) {

        System.out.println(user +
                " received Web Notification -> "
                + stockName + " : ₹" + price);

    }
}