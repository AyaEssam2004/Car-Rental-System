# 🚗 Car Rental System

## 📌 Overview
The **Car Rental System** is a **CLI-based** application that enables efficient management of car rentals. It allows users to **add, rent, return, and manage cars**, while ensuring proper validation, invoicing, and customer management. Designed for rental agencies, the system streamlines operations and enhances customer service.

## 🛠 Features

### 🚘 Car Management
- Add new cars (Economy, Sports, Electric).
- Display available cars.
- Search for cars based on **ID, type, year, and price**.

### 👤 Customer Management
- Register new customers with **ID, name, phone, email, and address**.
- Update customer details.
- Validate unique customer IDs.

### 📅 Booking System
- Create bookings by selecting available cars.
- Validate **dates** to ensure correct rental periods.
- Prevent duplicate booking IDs.

### 🏷️ Return & Invoice Generation
- Process car returns with actual return dates.
- Automatically calculate **rental costs**.
- Generate invoices detailing the rental period and total cost.

### 🔍 Advanced Search & Reports
- Search available cars with **filters (type, price, year, etc.)**.
- Generate a rental report summarizing bookings and returns.

### ✅ Input Validation & Error Handling
- Ensures **correct date format (YYYY-MM-DD)**.
- Prevents duplicate IDs for **customers, bookings, and cars**.
- Handles **missing or invalid inputs** gracefully.

## 🏗️ Project Structure
```
CarRentalSystem/
│── CarRentalSystem.dart   # Main system logic
│── Car.dart               # Base Car class
│── EconomyCar.dart        # Economy car subclass
│── SportsCar.dart         # Sports car subclass
│── ElectricCar.dart       # Electric car subclass
│── Customer.dart          # Customer class
│── Booking.dart           # Booking class
│── Invoice.dart           # Invoice class
│── main.dart              # CLI interface
```

## 🔧 Installation & Usage

### 📥 Prerequisites
- Install **Dart SDK**: [Dart Install Guide](https://dart.dev/get-dart)

### ▶️ Run the System
```sh
# Clone the repository
git clone https://github.com/your-username/car-rental-system.git
cd car-rental-system

# Run the main program
dart main.dart
```

## 📝 Example Usage
```
===== Car Rental System =====
1. Add a new car
2. Register a new customer
3. Create a booking
4. Display available cars
5. Return a car and generate an invoice
6. Search available cars
7. Update customer details
8. Generate rental report
9. Exit
Enter your choice: 3

===== Available Cars =====
Car ID: 1, Type: Economy, Year: 2022, Price per Day: 50.0
Enter customer ID: 101
Enter car ID to book: 1
Enter start date (YYYY-MM-DD): 2025-02-10
Enter end date (YYYY-MM-DD): 2025-02-15
Enter booking ID: B001
✅ Booking created successfully!
```

## 📌 Future Improvements
- Add a **graphical user interface (GUI)**.
- Implement a **database** for persistent storage.
- Introduce **discounts and loyalty programs**.

## 📜 License
This project is open-source and available under the **MIT License**.

---
🚀 Built with **Dart** for efficient car rental management!

