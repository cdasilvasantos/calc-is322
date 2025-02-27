import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var equationDisplay = "" // Stores the full equation
    @State private var firstNumber: Double?
    @State private var secondNumber: Double?
    @State private var currentOperation: String?
    @State private var isTypingNumber = false

    let buttons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.number("7"), .number("8"), .number("9"), .multiply],
        [.number("4"), .number("5"), .number("6"), .subtract],
        [.number("1"), .number("2"), .number("3"), .add],
        [.delete, .number("0"), .decimal, .equals]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            // Show the equation in small text above the display
            Text(equationDisplay)
                .font(.system(size: 30))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)

            // Show the main display where the user types
            Text(display)
                .font(.system(size: 80))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button, action: {
                            self.buttonTapped(button)
                        })
                    }
                }
            }
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }

    func buttonTapped(_ button: CalculatorButton) {
        switch button {
        case .number(let value):
            if isTypingNumber {
                display += value
            } else {
                display = value
                isTypingNumber = true
            }
        case .clear:
            display = "0"
            equationDisplay = "" // Reset equation
            firstNumber = nil
            secondNumber = nil
            currentOperation = nil
            isTypingNumber = false
        case .delete:
            if display.count > 1 {
                display.removeLast()
            } else {
                display = "0"
            }
        case .add, .subtract, .multiply, .divide:
            if let num = Double(display) {
                firstNumber = num
                currentOperation = button.symbol
                isTypingNumber = false
                equationDisplay = "\(formatResult(num)) \(button.title)" // Update equation display
            }
        case .equals:
            if let first = firstNumber, let operation = currentOperation, let second = Double(display) {
                let result = calculate(first: first, second: second, operation: operation)
                equationDisplay = "\(equationDisplay) \(formatResult(second)) ="
                display = formatResult(result)
                firstNumber = nil
                currentOperation = nil
                isTypingNumber = false
            }
        case .decimal:
            if !display.contains(".") {
                display += "."
            }
        case .plusMinus:
            if let num = Double(display) {
                display = formatResult(-num)
            }
        case .percent:
            if let num = Double(display) {
                display = formatResult(num / 100)
            }
        }
    }

    func calculate(first: Double, second: Double, operation: String) -> Double {
        switch operation {
        case "+": return first + second
        case "-": return first - second
        case "×": return first * second
        case "÷": return second != 0 ? first / second : 0
        default: return 0
        }
    }

    func formatResult(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(result))
        }
        return String(result)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark) // Ensures it looks good in dark mode
}
