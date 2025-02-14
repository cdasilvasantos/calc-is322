import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var firstNumber: Double?
    @State private var secondNumber: Double?
    @State private var currentOperation: String?
    @State private var isTypingNumber = false

    let buttons = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["AC", "0", "=", "+"]
    ]

    var body: some View {
        VStack {
            Spacer()
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()

            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(Color.blue.opacity(0.7))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
        .padding()
    }

    func buttonTapped(_ button: String) {
        if let _ = Double(button) {  // Number button tapped
            if isTypingNumber {
                display += button
            } else {
                display = button
                isTypingNumber = true
            }
        } else if button == "AC" {  // All Clear button
            display = "0"
            firstNumber = nil
            secondNumber = nil
            currentOperation = nil
            isTypingNumber = false
        } else if button == "=" {  // Equals button
            if let first = firstNumber, let operation = currentOperation, let second = Double(display) {
                display = formatResult(calculate(first: first, second: second, operation: operation))
                firstNumber = nil
                currentOperation = nil
                isTypingNumber = false
            }
        } else {  // Operator button tapped (+, -, ×, ÷)
            if let num = Double(display) {
                firstNumber = num
                currentOperation = button
                isTypingNumber = false
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
            return String(Int(result))  // Show as integer if there's no decimal part
        }
        return String(result)  // Show as decimal otherwise
    }
}

#Preview {
    ContentView()
}
