public class MVCTest {

    public static void main(String[] args) {

        // Create Model
        Student student = new Student("Shantanu", 101, "A");

        // Create View
        StudentView view = new StudentView();

        // Create Controller
        StudentController controller =
                new StudentController(student, view);

        // Display Initial Data
        controller.updateView();

        System.out.println();

        // Update Student Details
        controller.setStudentName("Rahul");
        controller.setStudentGrade("A+");

        // Display Updated Data
        controller.updateView();

    }

}