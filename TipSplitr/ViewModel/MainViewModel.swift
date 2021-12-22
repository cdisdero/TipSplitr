//
//  MainViewModel.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    private let tipCalculator: TipCalculator
    
    let tipPercentages: [Decimal]
    let peopleNumberRange: Range<Int>
    
    init(
        tipPercentages: [Decimal] = [0, 0.1, 0.18, 0.25, 0.30],
        peopleNumberRange: Range<Int> = 1..<101) {
        self.tipPercentages = tipPercentages
        self.peopleNumberRange = peopleNumberRange
        self.tipCalculator = TipCalculator()
    }
    
    @Published var checkAmount: Decimal? {
        didSet {
            tipCalculator.checkAmount = checkAmount ?? 0
            compute()
        }
    }
    
    @Published var tipPercentagesIndexSelected = 0 {
        didSet {
            tipCalculator.tipPercentage = Array(tipPercentages)[tipPercentagesIndexSelected]
            compute()
        }
    }
    
    @Published var numberOfPeopleIndexSelected = 0 {
        didSet {
            tipCalculator.numberOfPeople = Array(peopleNumberRange)[numberOfPeopleIndexSelected]
            compute()
        }
    }
    
    @Published var totalPerPerson: Decimal?
    
    @Published var totalAmount: Decimal?

    var numberOfPeople: Int {
        tipCalculator.numberOfPeople = Array(peopleNumberRange)[numberOfPeopleIndexSelected]
        return tipCalculator.numberOfPeople
    }
    
    private func compute() {
        totalPerPerson = tipCalculator.totalPerPerson
        totalAmount = tipCalculator.totalAmount
    }
}
