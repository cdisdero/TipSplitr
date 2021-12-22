//
//  CurrencyTextFieldFormatterTests.swift
//  TipSplitrTests
//
//  Created by Christopher Disdero on 12/20/21.
//

@testable import TipSplitr
import XCTest

class CurrencyTextFieldFormatterTests: XCTestCase {

    let formatter = CurrencyTextFieldFormatter()
    
    // MARK: - displayString() cases
    
    func testDisplayStringNilValue() throws {
        XCTAssertEqual(formatter.displayString(for: nil), "")
    }

    func testDisplayStringZeroValue() throws {
        XCTAssertEqual(formatter.displayString(for: 0), "$0.00")
    }

    func testDisplayStringThreeDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 120.15), "$120.15")
    }

    func testDisplayStringZeroDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 0.15), "$0.15")
    }

    func testDisplayStringZeroDigitsPointOneDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 0.5), "$0.50")
    }

    func testDisplayStringTwoDigitsPointZeroDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 11), "$11.00")
    }

    func testDisplayStringOneDigitsPointThreeDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 1.012), "$1.01")
    }

    func testDisplayStringOneDigitsPointOneDigitsNegativeValue() throws {
        XCTAssertEqual(formatter.displayString(for: -1.1), "-$1.10")
    }
    
    func testDisplayStringFourDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.displayString(for: 1208.99), "$1,208.99")
    }

    // MARK: - editingString() cases
    
    func testEditingStringNilValue() throws {
        XCTAssertEqual(formatter.editingString(for: nil), "")
    }

    func testEditingStringZeroValue() throws {
        XCTAssertEqual(formatter.editingString(for: 0), "0.00")
    }

    func testEditingStringThreeDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 120.15), "120.15")
    }

    func testEditingStringZeroDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 0.15), "0.15")
    }

    func testEditingStringZeroDigitsPointOneDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 0.5), "0.50")
    }

    func testEditingStringTwoDigitsPointZeroDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 11), "11.00")
    }

    func testEditingStringOneDigitsPointThreeDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 1.012), "1.01")
    }

    func testEditingStringOneDigitsPointOneDigitsNegativeValue() throws {
        XCTAssertEqual(formatter.editingString(for: -1.1), "-1.10")
    }

    func testEditingStringFourDigitsPointTwoDigitsValue() throws {
        XCTAssertEqual(formatter.editingString(for: 1208.99), "1208.99")
    }

    // MARK: - value() cases
    
    func testValueEmptyString() throws {
        XCTAssertEqual(formatter.value(from: ""), nil)
    }

    func testValueInvalidString() throws {
        XCTAssertEqual(formatter.value(from: "blippo"), nil)
    }

    func testValueWholeNumberString() throws {
        guard let value = formatter.value(from: "1") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, 1.0, accuracy: 0.01)
    }

    func testValueWholeDollarString() throws {
        guard let value = formatter.value(from: "$1") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, 1.0, accuracy: 0.01)
    }

    func testValueTwoDigitsPointTwoDigitsDollarNegativeString() throws {
        guard let value = formatter.value(from: "-$12.59") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, -12.59, accuracy: 0.001)
    }

    func testValueOneDigitsPointTwoDigitsDollarString() throws {
        guard let value = formatter.value(from: "$1.59") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, 1.59, accuracy: 0.001)
    }

    func testValueOneDigitsPointThreeDigitsDollarString() throws {
        guard let value = formatter.value(from: "$1.592") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, 1.592, accuracy: 0.001)
    }

    func testValueFourDigitsPointTwoDigitsDollarString() throws {
        guard let value = formatter.value(from: "$1,208.99") else {
            XCTFail("invalid parsed value")
            return
        }
        XCTAssertEqual(value, 1208.99, accuracy: 0.001)
    }
}
