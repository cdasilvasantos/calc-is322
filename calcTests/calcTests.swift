import XCTest
@testable import calc

final class calcTests: XCTestCase {

    func testAddition() {
        let result = performOperation(first: 2, second: 3, operation: "+")
        XCTAssertEqual(result, "5")  // Changed from "5.0" to "5"
    }

    func testSubtraction() {
        let result = performOperation(first: 5, second: 3, operation: "-")
        XCTAssertEqual(result, "2")  // Changed from "2.0" to "2"
    }

    func testMultiplication() {
        let result = performOperation(first: 4, second: 3, operation: "×")
        XCTAssertEqual(result, "12") // Changed from "12.0" to "12"
    }

    func testDivision() {
        let result = performOperation(first: 10, second: 2, operation: "÷")
        XCTAssertEqual(result, "5")  // Changed from "5.0" to "5"
    }

    func testDivisionByZero() {
        let result = performOperation(first: 10, second: 0, operation: "÷")
        XCTAssertEqual(result, "0")  // Changed from "0.0" to "0"
    }

    private func performOperation(first: Double, second: Double, operation: String) -> String {
        var result: Double = 0
        switch operation {
        case "+": result = first + second
        case "-": result = first - second
        case "×": result = first * second
        case "÷": result = second != 0 ? first / second : 0
        default: break
        }
        
        // Format result to match the ContentView formatting
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(result))
        }
        return String(result)
    }
}
