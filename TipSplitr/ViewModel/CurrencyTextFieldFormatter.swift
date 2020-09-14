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
        return NumberFormatter.currencyEditing.string(for: value) ?? ""
    }

    func value(from string: String) -> Decimal? {
        let formatter = NumberFormatter.currencyEditing
        let value = formatter.number(from: string)?.decimalValue
        let formattedString = value.map { formatter.string(for: $0) } as? String
        return formattedString.map { formatter.number(from: $0)?.decimalValue } as? Decimal
    }
}
