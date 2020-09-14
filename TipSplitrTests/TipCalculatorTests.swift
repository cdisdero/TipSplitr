//
//  TipCalculatorTests.swift
//  TipSplitrTests
//
//  Created by Christopher Disdero on 9/13/20.
//

import XCTest
@testable import TipSplitr

class TipCalculatorTests: XCTestCase {
    
    func testValidInputsAllSpecified() throws {
        let calculator = TipCalculator()
        
        calculator.checkAmount = 100
        calculator.numberOfPeople = 2
        calculator.tipPercentage = 0.10
        XCTAssertEqual(5, calculator.totalPerPerson)
        XCTAssertEqual(110, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = 1
        calculator.tipPercentage = 0.10
        XCTAssertEqual(10, calculator.totalPerPerson)
        XCTAssertEqual(110, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = 4
        calculator.tipPercentage = 0.20
        XCTAssertEqual(5, calculator.totalPerPerson)
        XCTAssertEqual(120, calculator.totalAmount)
    }

    func testInvalidInputsAllSpecified() throws {
        let calculator = TipCalculator()
        
        calculator.checkAmount = 0
        calculator.numberOfPeople = 2
        calculator.tipPercentage = 0.10
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = 0
        calculator.tipPercentage = 0.10
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(110, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = 4
        calculator.tipPercentage = 0
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(100, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = -2
        calculator.tipPercentage = 0.20
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(120, calculator.totalAmount)

        calculator.checkAmount = 100
        calculator.numberOfPeople = -2
        calculator.tipPercentage = -0.20
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(80, calculator.totalAmount)

        calculator.checkAmount = 0
        calculator.numberOfPeople = 0
        calculator.tipPercentage = 0
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)
    }

    func testValidInputsAmountAndNumberPeopleSpecified() throws {
        let calculator = TipCalculator()
        
        calculator.checkAmount = 100
        calculator.numberOfPeople = 2
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(100, calculator.totalAmount)
    }

    func testValidInputsAmountAndPercentageSpecified() throws {
        let calculator = TipCalculator()
        
        calculator.checkAmount = 100
        calculator.tipPercentage = 0.20
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(120, calculator.totalAmount)
    }

    func testValidInputsPercentageAndNumberPeopleSpecified() throws {
        let calculator = TipCalculator()

        calculator.numberOfPeople = 2
        calculator.tipPercentage = 0.20
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)
    }

    func testValidInputsPercentageSpecified() throws {
        let calculator = TipCalculator()

        calculator.tipPercentage = 0.20
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)
    }

    func testValidInputsAmountSpecified() throws {
        let calculator = TipCalculator()

        calculator.checkAmount = 100
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(100, calculator.totalAmount)
    }

    func testValidInputsNumberPeopleSpecified() throws {
        let calculator = TipCalculator()

        calculator.numberOfPeople = 2
        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)
    }

    func testNoInputsSpecified() throws {
        let calculator = TipCalculator()

        XCTAssertEqual(0, calculator.totalPerPerson)
        XCTAssertEqual(0, calculator.totalAmount)
    }
}
