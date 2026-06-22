public class DependencyInjectionTest {

    public static void main(String[] args) {

        // Inject Repository into Service
        CustomerRepository repository = new CustomerRepositoryImpl();

        CustomerService service = new CustomerService(repository);

        service.getCustomerDetails(101);

        System.out.println();

        service.getCustomerDetails(102);

        System.out.println();

        service.getCustomerDetails(105);

    }

}