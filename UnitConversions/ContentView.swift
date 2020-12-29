//
//  ContentView.swift
//  UnitConversions
//
//  Created by Channabasavesh Chandrappa Budihal on 12/23/20.
//

import SwiftUI

struct ContentView: View {
    
    // Temperature conversion: Celsius, Farenheit, Kelvin
    // Length conversion: meters, kilometers, feet, yards, or miles
    // Time conversion: seconds, minutes, hours, or days.
    // Volume Conversion: milliliters, litres, cups, pints, gallons
    
    //Length conversion
    // Select an input unit. A segmented control for meters, kilometers, feet, yard, miles @State
    // Select an output unit. "" @State
    // Enter a value. Textfield. Number. @State
    // See the output. TextView. After conversion.
    
    // A textfield, two segmented controls, a textView for output.
    
    // Idea is to convert the user's input to a single base unit, then convert from there to the target unit.
    
    // Rather than writing code to convert from litres to millilitres, and from liters to cups, and from litres to pints, and so on, a better idea is to convert the user's input into millilitres (the lowest common denominator), then convert from there to whatever output unit they want.
    
    @State private var enteredValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    var outputValue : Double {
        let enteredNumber = Double(enteredValue) ?? 0
        var enteredNumberInMetres = 0.00
        if inputUnit == 0 {
            enteredNumberInMetres = enteredNumber
        } else if inputUnit == 1 {
            enteredNumberInMetres = enteredNumber * 1000
        } else if inputUnit == 2 {
            enteredNumberInMetres = enteredNumber * 0.3048
        } else if inputUnit == 3 {
            enteredNumberInMetres = enteredNumber * 0.9144
        } else if inputUnit == 4 {
            enteredNumberInMetres = enteredNumber * 1609.344
        }
        
        var outputNumber = 0.00
        if outputUnit == 0 {
            outputNumber = enteredNumberInMetres
        } else if outputUnit == 1 {
            outputNumber = enteredNumberInMetres / 1000
        } else if outputUnit == 2 {
            outputNumber = enteredNumberInMetres * 3.2808399
        } else if outputUnit == 3 {
            outputNumber = enteredNumberInMetres * 1.0936133
        } else if outputUnit == 4 {
            outputNumber = enteredNumberInMetres * 0.0006213
        }
        return outputNumber
    }
    let lengthUnits = ["Metres", "Kilometres", "Feet", "Yard", "Miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select an input unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select an output unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                TextField("Enter a value", text: $enteredValue)
                    .keyboardType(.numberPad)
                Section(header: Text("Output value")) {
                    Text("\(outputValue)")
                }
            }
            .navigationBarTitle("Unit Conversions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
