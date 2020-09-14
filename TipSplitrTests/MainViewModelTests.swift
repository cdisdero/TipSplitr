//
//  MainViewModelTests.swift
//  TipSplitrTests
//
//  Created by Christopher Disdero on 9/13/20.
//

import XCTest
import Combine
@testable import TipSplitr

class MainViewModelTests: XCTestCase {

    typealias CompletionResult = (
        expectation: XCTestExpectation,
        cancellable: AnyCancellable)
    
    /// Tests whether the publisher specified returns the expected value(s).
    /// - Parameters:
    ///   - publisher: The *Publisher* to test.
    ///   - publisherTitle: A string description of the *Publisher* to test.
    ///   - file: Current file name used for reporting if an error occurs
    ///   - line: Current line number used for reporting if an error occurs
    ///   - equals: One or more conditions involving the value from the *Publisher* which return a *Bool*
    /// - Returns: A *CompletionResult* tuple with the expectation that will be evaluated when the *Publisher* issues a value.
    /// - Note: If the value condition(s) are not met, the expectation times out.
    func expectValue<T: Publisher>(of publisher: T,
                                   publisherTitle: String,
                                   file: StaticString = #file,
                                   line: UInt = #line,
                                   equals: [(T.Output) -> Bool]) -> CompletionResult {
        let exp = expectation(description: "Correct value(s) of \(publisherTitle)")
        var mutableEquals = equals
        let cancellable = publisher
            .sink(receiveCompletion: { _ in },
                  receiveValue: { value in
                      if mutableEquals.first?(value) ?? false {
                          _ = mutableEquals.remove(at: 0)
                          if mutableEquals.isEmpty {
                              exp.fulfill()
                          }
                      }
                  }
            )
        return (exp, cancellable)
    }
    
    func testValidInputsForExpectedTotalPerPerson() throws {

        let viewModel = MainViewModel(tipPercentages: [0, 0.1, 0.2, 0.3], peopleNumberRange: 2..<100)
        
        let exp = expectValue(of: viewModel.$totalPerPerson, publisherTitle: "MainViewModel.totalPerPerson", equals: [{ value in
            value == 5
        }])

        viewModel.checkAmount = 100
        viewModel.numberOfPeopleIndexSelected = 0
        viewModel.tipPercentagesIndexSelected = 1

        wait(for: [exp.expectation], timeout: 2)
    }

    func testValidInputsForExpectedTotalAmount() throws {

        let viewModel = MainViewModel(tipPercentages: [0, 0.1, 0.2, 0.3], peopleNumberRange: 2..<100)
        
        let exp = expectValue(of: viewModel.$totalAmount, publisherTitle: "MainViewModel.totalAmount", equals: [{ value in
            value == 110
        }])

        viewModel.checkAmount = 100
        viewModel.numberOfPeopleIndexSelected = 0
        viewModel.tipPercentagesIndexSelected = 1

        wait(for: [exp.expectation], timeout: 2)
    }
}
