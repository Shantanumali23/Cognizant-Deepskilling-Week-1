public class CustomerRepositoryImpl implements CustomerRepository {

    @Override
    public String findCustomerById(int id) {

        return switch (id) {
            case 101 -> "Shantanu Mali";
            case 102 -> "Aryan Kumbhar";
            default -> "Customer Not Found";
        };

    }

}