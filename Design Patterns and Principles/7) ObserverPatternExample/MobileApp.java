public class MobileApp implements Observer {

    private final String user;

    public MobileApp(String user) {
        this.user = user;
    }

    @Override
    public void update(String stockName, double price) {

        System.out.println(user +
                " received Mobile Notification -> "
                + stockName + " : ₹" + price);

    }
}