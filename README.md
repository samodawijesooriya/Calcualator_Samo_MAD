# Calculator App

This is a **simple calculator app** built using **Flutter**. It allows users to perform basic arithmetic operations, calculate square roots, percentages, and toggle between positive and negative numbers. The app features an interactive UI with buttons designed for a user-friendly experience.

---

## Features

- **Basic Operations**: Addition, subtraction, multiplication, division.
- **Percentage Calculation**: Quickly calculate percentages.
- **Square Root Calculation**: Compute the square root of numbers.
- **Clear Button**: Reset the entire expression.
- **Backspace**: Delete the last entered character.
- **Sign Toggle**: Switch between positive and negative numbers.
- **Decimal Support**: Work with floating-point numbers.
- **Error Handling**: Displays errors like "Invalid" or "Can't divide by 0."

---

## Technology Stack

- **Flutter**: The app is developed using Dart and Flutter for a smooth cross-platform experience.
- **Material Design**: Styled using Flutter's Material widgets.

---

## Screenshots
![image](https://github.com/user-attachments/assets/0270b92b-c064-4cf8-ae05-7f94a7a2de49)


---

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/calculator-app.git
   ```
2. **Navigate to the Project Directory**
   ```bash
   cd calculator-app
   ```
3. **Install Dependencies**
   ```bash
   flutter pub get
   ```
4. **Run the App**
   - Connect your device/emulator.
   - Execute:
     ```bash
     flutter run
     ```

---

## Usage

1. **Input Numbers and Operators**: Use the on-screen buttons to input values.
2. **Perform Calculations**: Press the `=` button to calculate results.
3. **Clear Expression**: Use the `AC` button to reset everything.
4. **Backspace**: Remove the last entered character using the ⌫ button.
5. **Toggle Sign**: Change the sign of a number using the `+/-` button.

---

## Code Overview

### Main Components:
- **`main.dart`**: Entry point of the app.
- **`Calculator` Class**: Manages the UI and interactions.
- **Logic Functions**:
  - `calculation(String btnText)`: Processes button presses.
  - `evaluateExpression(String expression)`: Evaluates mathematical expressions.
  - Utility methods like `isOperator`, `hasPrecedence`, and `applyOp`.

---

## Known Issues

- Decimal calculations may exhibit rounding errors for repeating decimals.
- Error handling can be expanded for complex scenarios.

---

## Contribution

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your message"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a Pull Request.

---

## License

This project is licensed under the [MIT License](LICENSE).  

---

## Author

- **Your Name**  
  - [GitHub Profile](https://github.com/yourusername)  
  - [Portfolio/Contact](https://yourwebsite.com)

---

Feel free to customize this README file based on your project details! 🚀
