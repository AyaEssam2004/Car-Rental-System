import 'Booking.dart';

class Customer {
  String _customerID;
  String _name;
  String _phoneNumber;
  String _email;
  String _address;
  List<Booking> _bookingHistory = [];
  Customer(this._customerID, this._name, this._phoneNumber, this._email, this._address);

  String get customerID => _customerID;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get address => _address;
  List<Booking> get bookingHistory => _bookingHistory;

  void addBooking(Booking booking){
    _bookingHistory.add(booking);
  }

  void displayCustomerInfo() {
    print("Customer ID: $_customerID, Name: $_name, Phone: $_phoneNumber, Email: $_email, Address: $_address");
  }

  void updateCustomerDetails({String? name, String? phoneNumber, String? email, String? address}) {
    if (name != null) _name = name;
    if (phoneNumber != null) _phoneNumber = phoneNumber;
    if (email != null) _email = email;
    if (address != null) _address = address;
    print("Customer details updated successfully.");
  }
}