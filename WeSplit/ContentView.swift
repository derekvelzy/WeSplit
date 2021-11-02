//
//  ContentView.swift
//  WeSplit
//
//  Created by Derek Velzy on 10/12/21.
//

// Custom Modifier
struct Total: View {
    var tip: Int
    var text: Text
    
    var body: some View {
        text
            .foregroundColor(tip == 0 ? .red : .black)
    }
}

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentageIndex = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    
    var totalAmount: Double {
        Double(checkAmount) ?? 0 // nil coalecing. returns 0 if invalid input
    }
    
    var totalPerPerson: Double {
        // calculates the total per person here
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentages[tipPercentageIndex])
        let amountPerPerson = totalAmount * (1 + (tipSelection / 100)) / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<20) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentageIndex) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
//                    Text("Total: $\(totalAmount, specifier: "%.2f")")
//                    Text("$\(totalPerPerson, specifier: "%.2f")")
                    Total(
                        tip: tipPercentages[tipPercentageIndex],
                        text: Text("Total: $\(totalAmount, specifier: "%.2f")")
                    )
                    Total(
                        tip: tipPercentages[tipPercentageIndex],
                        text: Text("$\(totalPerPerson, specifier: "%.2f")")
                    )
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Textfield(~placeholder~, text: ~the state~)

// Picker(~label~, selection: ~the state~)
    // .pickerStyle: what kind of picker do you want to use

// Section() can take in other parameters like header
