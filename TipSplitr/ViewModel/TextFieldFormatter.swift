//
//  TextFieldFormatter.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import Foundation

protocol TextFieldFormatter {
    associatedtype Value
    
    func displayString(for value: Value) -> String
    func editingString(for value: Value) -> String
    func value(from string: String) -> Value
}
