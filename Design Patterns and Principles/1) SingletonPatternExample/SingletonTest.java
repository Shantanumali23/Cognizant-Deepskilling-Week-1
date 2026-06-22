public class SingletonTest {

    public static void main(String[] args) {

        // Get first instance
        Logger logger1 = Logger.getInstance();
        logger1.log("First log message");

        // Get second instance
        Logger logger2 = Logger.getInstance();
        logger2.log("Second log message");

        // Check if both references point to the same object
        if (logger1 == logger2) {
            System.out.println("Both logger objects are the same instance.");
        } else {
            System.out.println("Different instances created.");
        }

        // Print hashcodes
        System.out.println("Logger1 HashCode: " + logger1.hashCode());
        System.out.println("Logger2 HashCode: " + logger2.hashCode());
    }
}