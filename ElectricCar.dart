import 'Car.dart';

class ElectricCar extends Car {
  double _chargingFee;

  ElectricCar(String carID, int year, double rentalPricePerDay, carType, this._chargingFee, )
      : super(carID, year, rentalPricePerDay, carType);

  @override
  double calculateCost(int days) {
    return (days * rentalPricePerDay) + _chargingFee;
  }
  @override
  double calculateLatePenalty(int lateDays) {
    return (rentalPricePerDay * 3 * lateDays)+_chargingFee;
  }

}