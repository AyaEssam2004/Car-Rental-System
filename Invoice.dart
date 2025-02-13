import 'Booking.dart';

class Invoice {
  String _invoiceID;
  Booking _booking;
  double _additionalFees;
  double _totalAmount;

  Invoice(this._invoiceID, this._booking, this._additionalFees)
      : _totalAmount = _booking.totalCost + _additionalFees;

  void displayInvoice() {
    print("Invoice ID: $_invoiceID");
    print("Booking ID: ${_booking.bookingID}");
    print("Customer: ${_booking.customer.name}");
    print("Car ID: ${_booking.car.carID}, Type: ${_booking.car.runtimeType}");
    print("Rental Period: ${_booking.rentalDuration} days");
    print("Base Cost: ${_booking.totalCost}");
    print("Additional Fees: $_additionalFees");
    print("Total Amount: $_totalAmount");
  }
}