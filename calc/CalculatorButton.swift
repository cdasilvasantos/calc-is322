//CalculatorButton.swift

import SwiftUI

enum CalculatorButton: Hashable {
    case number(String)
    case add, subtract, multiply, divide, equals, clear, plusMinus, percent, decimal, delete
    
    var title: String {
        switch self {
        case .number(let value): return value
        case .add: return "+"
        case .subtract: return "−"
        case .multiply: return "×"
        case .divide: return "÷"
        case .equals: return "="
        case .clear: return "AC"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .decimal: return "."
        case .delete: return "⌫"
        }
    }
    
    var symbol: String {
        switch self {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        default: return ""
        }
    }

    var backgroundColor: Color {
        switch self {
        case .clear, .plusMinus, .percent, .delete:
            return Color(.lightGray)
        case .add, .subtract, .multiply, .divide, .equals:
            return Color(red: 2.0, green: 0.75, blue: 1.0) 
        default:
            return Color(.darkGray)
        }
    }




    var textColor: Color {
        switch self {
        case .clear, .plusMinus, .percent, .delete:
            return Color.black
        default:
            return Color.white
        }
    }
}
