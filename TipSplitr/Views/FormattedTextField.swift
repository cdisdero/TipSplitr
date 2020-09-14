//
//  FormattedTextField.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/13/20.
//

import SwiftUI

struct FormattedTextField<Formatter: TextFieldFormatter>: View {
    @State private var isEditing: Bool = false
    @State private var editingValue: String = ""

    let title: String
    let value: Binding<Formatter.Value>
    let formatter: Formatter

    init(_ title: String,
                value: Binding<Formatter.Value>,
                formatter: Formatter) {
        self.title = title
        self.value = value
        self.formatter = formatter
    }

    var body: some View {
        HStack {
            TextField(title, text: Binding(get: {
                if self.isEditing {
                    return self.editingValue
                } else {
                    return self.formatter.displayString(for: self.value.wrappedValue)
                }
            }, set: { string in
                self.editingValue = string
                self.value.wrappedValue = self.formatter.value(from: string)
            }), onEditingChanged: { isEditing in
                self.isEditing = isEditing
                self.editingValue = self.formatter.editingString(for: self.value.wrappedValue)
            })
            
            Spacer()
            
            Image(systemName: "return")
                .foregroundColor(.secondary)
                .opacity(isEditing ? 1 : 0)
                .frame(width: 30, height: 30, alignment: .trailing)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }
    }
}
