import 'Car.dart';
import 'Customer.dart';

class Booking {
  String _bookingID;
  Customer _customer;
  Car _car;
  DateTime _startDate;
  DateTime _endDate;
  late int _rentalDuration;
  late double _totalCost;
  double _lateReturnPenalty = 0;

  Booking(this._bookingID, this._customer, this._car, this._startDate, this._endDate) {
    _rentalDuration = _endDate.difference(_startDate).inDays;
    _totalCost = _car.calculateCost(_rentalDuration);
    //_car.isAvailable = false;
  }
  set lateReturnPenalty(double penalty) {
    _lateReturnPenalty = penalty;
    calculateTotalCost();
  }

  String get bookingID => _bookingID;
  Customer get customer => _customer;
  Car get car => _car;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  int get rentalDuration => _rentalDuration;
  double get totalCost => _totalCost;
  double get lateReturnPenalty => _lateReturnPenalty;

  void calculateTotalCost() {
    _totalCost = _car.calculateCost(_rentalDuration) ;
  }

  void displayBookingDetails() {
    print("Booking ID: $_bookingID, Customer: ${_customer.name}, Car ID: ${_car.carID}, Duration: $_rentalDuration days, Total Cost: $_totalCost");
  }
}