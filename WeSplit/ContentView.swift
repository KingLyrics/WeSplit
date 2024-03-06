//
//  ContentView.swift
//  WeSplit
//
//  Created by Ekomobong Edeme on 04/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount:Double = 0.0
    @State private var numberOfPeople:Int = 2
    @State private var tipPercentage:Int = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson:Double{
        
        let peopleCount = Double(numberOfPeople + 2)
        
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var FullTotal:Double{
        let tipSelection = Double(tipPercentage)

        
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        
       return grandTotal
    }
 
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Amount", 
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section("How much do you want to tip?"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Total amount for the check"){
                    Text(FullTotal, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}


#Preview {
    ContentView()
}
