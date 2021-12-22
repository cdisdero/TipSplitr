//
//  TipCalculator.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import Foundation

class TipCalculator {
    
    var checkAmount: Decimal = 0
    var numberOfPeople = 1
    var tipPercentage: Decimal = 0
    
    var totalAmount: Decimal {
        return checkAmount + (Decimal(numberOfPeople) * totalPerPerson)
    }
    
    var totalPerPerson: Decimal {
        let peopleCount = Decimal(numberOfPeople)
        guard peopleCount > 0 else {
            return 0
        }
        let rawAmount = (checkAmount * tipPercentage) / peopleCount
        return rawAmount.rounded(places: NumberFormatter.currency.minimumFractionDigits)
    }
}
