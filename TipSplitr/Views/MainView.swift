//
//  ContentView.swift
//  TipSplitr
//
//  Created by Christopher Disdero on 9/12/20.
//

import SwiftUI

struct MainView: View {

    private let fieldInsets = EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("calculator.screen.header.amount".localized)) {
                    FormattedTextField("calculator.screen.textfield.placeholder.amount".localized,
                                       value: $viewModel.checkAmount,
                                       formatter: CurrencyTextFieldFormatter())
                        .padding(fieldInsets)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("calculator.screen.header.numberofpeople".localized)) {
                    Picker("\(viewModel.numberOfPeople)", selection: $viewModel.numberOfPeopleIndexSelected) {
                        ForEach(viewModel.peopleNumberRange) { index in
                            Text("\("split_people".localizedForInt(index))")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(fieldInsets)
                }
                Section(header: Text("calculator.screen.header.tippercentage".localized)) {
                    Picker("calculator.screen.picker.label.tippercentage".localized,
                           selection: $viewModel.tipPercentagesIndexSelected) {
                        ForEach(0..<viewModel.tipPercentages.count) { index in
                            Text("\(NumberFormatter.percents.string(for: self.viewModel.tipPercentages[index]) ?? "")")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(fieldInsets)
                }
                Section(header: Text("calculator.screen.header.amountperperson".localized)) {
                    Text(CurrencyTextFieldFormatter().displayString(for: viewModel.totalPerPerson))
                        .padding(fieldInsets)
                }
                Section(header: Text("calculator.screen.header.totalamount".localized)) {
                    Text(CurrencyTextFieldFormatter().displayString(for: viewModel.totalAmount))
                        .padding(fieldInsets)
                }
            }
            .navigationBarTitle("app.title".localized)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 11 Pro")
    }
}
