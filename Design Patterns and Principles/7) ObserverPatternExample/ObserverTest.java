public class ObserverTest {

    public static void main(String[] args) {

        StockMarket market = new StockMarket();

        Observer mobile = new MobileApp("Rahul");
        Observer web = new WebApp("Shantanu");

        market.registerObserver(mobile);
        market.registerObserver(web);

        System.out.println("Stock Price Updated:");

        market.setStock("TCS", 4200.50);

        System.out.println();

        market.setStock("Infosys", 1650.75);
    }
}