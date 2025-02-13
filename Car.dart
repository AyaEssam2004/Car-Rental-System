abstract class Car {
  String _carID;
  int _year;
  double _rentalPricePerDay;
  bool _isAvailable;
  String _carType;

  Car(this._carID, this._year, this._rentalPricePerDay, this._carType, {bool isAvailable = true})
      : _isAvailable = isAvailable;

  String get carID => _carID;
  int get year => _year;
  double get rentalPricePerDay => _rentalPricePerDay;
  bool get isAvailable => _isAvailable;
  String get carType => _carType;

  set isAvailable(bool status) => _isAvailable = status;

  double calculateCost(int days);
  double calculateLatePenalty(int lateDays);

  void displayCarDetails() {
    print("Car ID: $_carID, Type: $_carType, Year: $_year, Price per Day: $_rentalPricePerDay, Available: $_isAvailable");
  }
}
