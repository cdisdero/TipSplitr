//
//  Decimal+Rounding.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 12/20/21.
//

import Foundation

extension Decimal {
    func rounded(places: Int, roundingMode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var original = self
        var rounded = Decimal()
        NSDecimalRound(&rounded, &original, places, roundingMode)
        return rounded
    }
}
