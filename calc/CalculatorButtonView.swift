import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(button.title)
                .font(.system(size: 32))
                .foregroundColor(button.textColor)
                .frame(width: buttonWidth(), height: 80)
                .background(button.backgroundColor)
                .clipShape(Circle())
        }
    }
    
    private func buttonWidth() -> CGFloat {
        return 80 // Ensure all buttons are the same size
    }
}
