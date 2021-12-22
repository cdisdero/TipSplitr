//
//  CurrencyTextFieldFormatter.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import Foundation

struct CurrencyTextFieldFormatter: TextFieldFormatter {
    typealias Value = Decimal?

    func displayString(for value: Decimal?) -> String {
        guard let value = value else { return "" }
        return NumberFormatter.currency.string(for: value) ?? ""
    }

    func editingString(for value: Decimal?) -> String {
        guard let value = value else { return "" }
        return NumberFormatter.decimal.string(for: value) ?? ""
    }

    func value(from string: String) -> Decimal? {
        guard !string.isEmpty else { return nil }
        return NumberFormatter.decimal.number(from: string)?.decimalValue ?? NumberFormatter.currency.number(from: string)?.decimalValue
    }
}
