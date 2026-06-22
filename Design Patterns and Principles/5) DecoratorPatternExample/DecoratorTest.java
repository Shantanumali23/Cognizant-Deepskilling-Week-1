public class DecoratorTest {

    public static void main(String[] args) {

        // Email only
        Notifier emailNotifier = new EmailNotifier();
        emailNotifier.send("Meeting at 10 AM");

        System.out.println();

        // Email + SMS
        Notifier smsNotifier = new SMSNotifierDecorator(new EmailNotifier());

        smsNotifier.send("Project deadline tomorrow");

        System.out.println();

        // Email + SMS + Slack
        Notifier allNotifier = new SlackNotifierDecorator(
                new SMSNotifierDecorator(
                        new EmailNotifier()));

        allNotifier.send("System maintenance tonight");
    }
}