import 'dart:io';
import 'Booking.dart';
import 'Car.dart';
import 'Customer.dart';
import 'package:collection/collection.dart';

import 'Invoice.dart';

class CarRentalSystem {
  List<Car> _cars = [];
  List<Customer> _customers = [];
  List<Booking> _bookings = [];

  void addCar(Car car) => _cars.add(car);

  void registerCustomer(Customer customer) {
    if (_customers.any((c) => c.customerID == customer.customerID)) {
      return;
    }

    _customers.add(customer);
  }


  void createBooking(Booking booking) {
    if (!_cars.contains(booking.car)) {
      print("Error: Car not found in system.");
      return;
    }
    if (!booking.car.isAvailable) {
      print("Error: Car is not available for booking.");
      return;
    }

    booking.car.isAvailable = false;
    _bookings.add(booking);
  }

  void displayAvailableCars() {
    print("\n===== Available Cars =====");
    for (var car in _cars.where((car) => car.isAvailable)) {
      print("Car ID: ${car.carID}, Type: ${car.carType}, Year: ${car.year}, Price per Day: ${car.rentalPricePerDay}");
    }
  }


  void returnCar(String bookingID, DateTime actualReturnDate) {
    Booking? booking = getBookingByID(bookingID);

    if (booking == null) {
      print("❌ Booking not found.");
      return;
    }

    int lateDays = actualReturnDate.difference(booking.endDate).inDays;
    if (lateDays > 0) {
      booking.lateReturnPenalty = booking.car.calculateLatePenalty(lateDays);
    }

    booking.car.isAvailable = true;

    Invoice invoice = Invoice("INV-$bookingID", booking, booking.lateReturnPenalty);
    invoice.displayInvoice();

    print("✅ Car returned successfully!");
  }



  void generateReport() {
    File file = File("rental_report.txt");
    String report = _bookings.map((b) => "${b.bookingID}, ${b.customer.name}, ${b.car.carID}, ${b.rentalDuration}, ${b.totalCost}").join("\n");
    file.writeAsStringSync(report);
    print("Report saved to rental_report.txt");
  }

  void searchAvailableCars({String? carID, String? carType, double? maxPrice, int? year}) {
    var filteredCars = _cars.where((car) => car.isAvailable);

    if (carID != null && carID.isNotEmpty) {
      filteredCars = filteredCars.where((car) => car.carID == carID);
    }
    if (carType != null && carType.isNotEmpty) {
      filteredCars = filteredCars.where((car) => car.runtimeType.toString().toLowerCase() == carType.toLowerCase());
    }
    if (maxPrice != null) {
      filteredCars = filteredCars.where((car) => car.rentalPricePerDay <= maxPrice);
    }
    if (year != null) {
      filteredCars = filteredCars.where((car) => car.year == year);
    }

    if (filteredCars.isEmpty) {
      print("No matching cars found.");
    } else {
      print("\nMatching Available Cars:");
      filteredCars.forEach((car) => car.displayCarDetails());
    }
  }

  Customer? getCustomerByID(String customerID) {
    return _customers.firstWhereOrNull((customer) => customer.customerID == customerID);
  }

  Car? getCarByID(String carID) {
    return _cars.firstWhereOrNull((car) => car.carID == carID);
  }
  bool hasAvailableCars() {
    return _cars.any((car) => car.isAvailable);
  }
  Booking? getBookingByID(String bookingID) {
    return _bookings.firstWhereOrNull((booking) => booking.bookingID == bookingID);
  }


}