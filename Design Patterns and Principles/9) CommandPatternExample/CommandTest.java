public class CommandTest {

    public static void main(String[] args) {

        Light light = new Light();

        Command lightOn = new LightOnCommand(light);
        Command lightOff = new LightOffCommand(light);

        RemoteControl remote = new RemoteControl();

        // Turn ON the light
        remote.setCommand(lightOn);
        remote.pressButton();

        // Turn OFF the light
        remote.setCommand(lightOff);
        remote.pressButton();

    }

}