
import 'Car.dart';

class EconomyCar extends Car {
  EconomyCar(String carID, int year, double rentalPricePerDay, carType)
      : super(carID, year, rentalPricePerDay, carType);

  @override
  double calculateCost(int days) {
    return days * rentalPricePerDay;
  }
  @override
  double calculateLatePenalty(int lateDays) {
    return (rentalPricePerDay * 1.5) * lateDays;
  }
}