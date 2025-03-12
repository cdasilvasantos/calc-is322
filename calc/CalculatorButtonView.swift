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
        // Using both identifier and label for maximum compatibility
        .accessibilityIdentifier(button.title)
        .accessibilityLabel(button.title)
    }

    private func buttonWidth() -> CGFloat {
        return 80
    }
}
