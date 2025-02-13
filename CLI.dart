import 'dart:io';
import 'Car.dart';
import 'CarRentalSystem.dart';
import 'Customer.dart';
import 'EconomyCar.dart';
import 'SportsCar.dart';
import 'ElectricCar.dart';
import 'Booking.dart';
import 'Invoice.dart';

void main() {
  CarRentalSystem system = CarRentalSystem();

  DateTime? parseDate(String? input) {
    try {
      if (input == null || input.isEmpty) throw FormatException("Empty date");
      List<String> parts = input.split('-');
      if (parts.length != 3) throw FormatException("Invalid format");
      return DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    } catch (e) {
      print("\n❌ Invalid date format. Please enter in YYYY-MM-DD format.");
      return null;
    }
  }

  while (true) {
    print("\n===== Car Rental System =====");
    print("1. Add a new car");
    print("2. Register a new customer");
    print("3. Create a booking");
    print("4. Display available cars");
    print("5. Return a car and generate an invoice");
    print("6. Search available cars");
    print("7. Update customer details");
    print("8. Generate rental report");
    print("9. Exit");
    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter car ID: ");
        String? carID = stdin.readLineSync();
        if (carID == null || carID.isEmpty || system.getCarByID(carID) != null) {
          print("❌ Error: Invalid or duplicate Car ID.");
          break;
        }

        stdout.write("Enter car type (Economy/Sports/Electric): ");
        String? type = stdin.readLineSync();
        if (!(type == "Economy" || type == "Sports" || type == "Electric")) {
          print("❌ Invalid car type. Choose from 'Economy', 'Sports', or 'Electric'.");
          break;
        }

        stdout.write("Enter car year: ");
        int year = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write("Enter rental price per day: ");
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

        if (type == 'Sports') {
          stdout.write("Enter luxury fee: ");
          double luxuryFee = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
          system.addCar(SportsCar(carID, year, price, type, luxuryFee));
        } else if (type == 'Electric') {
          stdout.write("Enter charging fee: ");
          double chargingFee = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
          system.addCar(ElectricCar(carID, year, price, type, chargingFee));
        } else {
          system.addCar(EconomyCar(carID, year, price, type));
        }
        print("✅ Car added successfully!");
        break;

      case '2':
        stdout.write("Enter customer ID: ");
        String? customerID = stdin.readLineSync();
        if (customerID == null || customerID.isEmpty || system.getCustomerByID(customerID) != null) {
          print("❌ Error: Invalid or duplicate Customer ID.");
          break;
        }

        stdout.write("Enter name: ");
        String? name = stdin.readLineSync();
        stdout.write("Enter phone: ");
        String? phone = stdin.readLineSync();
        stdout.write("Enter email: ");
        String? email = stdin.readLineSync();
        stdout.write("Enter address: ");
        String? address = stdin.readLineSync();

        system.registerCustomer(Customer(customerID, name!, phone!, email!, address!));
        print("✅ Customer registered successfully!");
        break;

      case '3':
        stdout.write("Enter customer ID: ");
        String? customerID = stdin.readLineSync();
        Customer? customer = system.getCustomerByID(customerID!);
        if (customer == null) {
          print("❌ Error: Customer not found.");
          break;
        }

        stdout.write("Enter car ID to book: ");
        String? carID = stdin.readLineSync();
        Car? car = system.getCarByID(carID!);
        if (car == null || !car.isAvailable) {
          print("❌ Error: Car not found or unavailable.");
          break;
        }

        DateTime? startDate, endDate;
        while (startDate == null) {
          stdout.write("Enter start date (YYYY-MM-DD): ");
          startDate = parseDate(stdin.readLineSync());
        }
        do {
          stdout.write("Enter end date (YYYY-MM-DD): ");
          endDate = parseDate(stdin.readLineSync());
        } while (endDate == null || endDate.isBefore(startDate));

        stdout.write("Enter booking ID: ");
        String? bookingID = stdin.readLineSync();
        if (bookingID == null || bookingID.isEmpty || system.getBookingByID(bookingID) != null) {
          print("❌ Error: Invalid or duplicate Booking ID.");
          break;
        }

        Booking newBooking = Booking(bookingID, customer, car, startDate, endDate);
        system.createBooking(newBooking);
        print("✅ Booking created successfully!");
        break;

      case '4':
        system.displayAvailableCars();
        break;

      case '5':
        stdout.write("Enter booking ID: ");
        String? bookingID = stdin.readLineSync();

        Booking? booking = system.getBookingByID(bookingID!);
        if (booking == null) {
          print("Error: Booking not found. Please enter a valid booking ID.");
          break;
        }

        DateTime? actualReturnDate;
        while (actualReturnDate == null) {
          stdout.write("Enter actual return date (YYYY-MM-DD): ");
          actualReturnDate = parseDate(stdin.readLineSync());

          if (actualReturnDate == null) {
            print("Invalid date format. Please enter in YYYY-MM-DD format.");
          }
        }

        system.returnCar(bookingID, actualReturnDate);
        break;


      case '6':
        stdout.write("Enter car ID (or press Enter to skip): ");
        String? carID = stdin.readLineSync();

        stdout.write("Enter car type (Economy/Sports/Electric) (or press Enter to skip): ");
        String? carType = stdin.readLineSync();

        stdout.write("Enter max rental price per day (or press Enter to skip): ");
        String? maxPriceInput = stdin.readLineSync();
        double? maxPrice = maxPriceInput!.isNotEmpty ? double.tryParse(maxPriceInput) : null;

        stdout.write("Enter car year (or press Enter to skip): ");
        String? yearInput = stdin.readLineSync();
        int? year = yearInput!.isNotEmpty ? int.tryParse(yearInput) : null;

        system.searchAvailableCars(carID: carID, carType: carType, maxPrice: maxPrice, year: year);
        break;

      case '7':
        stdout.write("Enter customer ID: ");
        String? customerID = stdin.readLineSync();
        Customer? customer = system.getCustomerByID(customerID!);

        if (customer == null) {
          print("Customer not found.");
        } else {
          print("\nCurrent Customer Details:");
          customer.displayCustomerInfo();

          stdout.write("\nEnter new name (or press Enter to skip): ");
          String? newName = stdin.readLineSync();
          stdout.write("Enter new phone number (or press Enter to skip): ");
          String? newPhone = stdin.readLineSync();
          stdout.write("Enter new email (or press Enter to skip): ");
          String? newEmail = stdin.readLineSync();
          stdout.write("Enter new address (or press Enter to skip): ");
          String? newAddress = stdin.readLineSync();

          customer.updateCustomerDetails(
            name: newName!.isNotEmpty ? newName : null,
            phoneNumber: newPhone!.isNotEmpty ? newPhone : null,
            email: newEmail!.isNotEmpty ? newEmail : null,
            address: newAddress!.isNotEmpty ? newAddress : null,
          );
        }
        break;

      case '8':
        system.generateReport();
        break;

      case '9':
        print("Exiting system...");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
