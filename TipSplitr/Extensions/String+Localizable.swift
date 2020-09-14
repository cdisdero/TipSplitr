//
//  String+Localizable.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: self)
    }
    
    func localizedForInt(_ value: Int) -> String {
        let formatString = NSLocalizedString(self, comment: "%d")
        return String(format: formatString, value)
    }
}
