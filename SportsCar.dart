import 'Car.dart';

class SportsCar extends Car {
  double _luxuryFee;

  SportsCar(String carID, int year, double rentalPricePerDay, carType, this._luxuryFee)
      : super(carID, year, rentalPricePerDay, carType);

  @override
  double calculateCost(int days) {
    return (days * rentalPricePerDay) + _luxuryFee;
  }
  @override
  double calculateLatePenalty(int lateDays) {
    return (rentalPricePerDay * 2) * lateDays+_luxuryFee;
  }
}
