//
//  ButtonsAndControlsView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct ButtonsAndControlsView: View {
    // Local state variables for various controls.
    @State private var isToggled = true
    @State private var selectedColor = "Red"
    @State private var birthdate = Date()
    @State private var volume = 50.0
    @State private var rating = 3
    @State private var stepperValue = 0
    let colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        Form {
            // Button – triggers an action.
            Section("Button"){
                Button("Tap Me") {
                    print("Button Tapped")
                }
                // Buttons can have roles like .destructive or .cancel.
                Button(role: .destructive) {
                    print("Delete")
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                // Custom styled button.
                Button {
                    print("Custom Tapped")
                } label: {
                    Text("Custom styled button")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            // Toggle – on/off switch.
            Section("Toggle – Boolean State"){
                Toggle("Enable notifications",isOn: $isToggled)
                    .toggleStyle(.switch)
                Text(isToggled ? "On" : "Off")
            }
            // Picker – select from a list of options.
            Section("Picker – Selection"){
                Picker("Favorite Color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented) // segmented, wheel, menu, etc.
                Text("You selected: \(selectedColor)")
            }
            // DatePicker – pick a date/time.
            Section("DatePicker") {
                DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                Text("Selected: \(birthdate.formatted(date: .long, time: .omitted))")
            }
            // Slider – choose a value in a range.
            Section("Slider – Continuous Value"){
                Slider(value: $volume, in: 0...100)
                Text("Volume:\(Int(volume))%")
            }
            // Stepper – increment/decrement a value.
            Section("Stepper – Step by Step"){
                Stepper("Rating: \(rating) stars",value: $rating, in: 1...5)
                Stepper("Count: \(stepperValue)", value: $stepperValue, in: 1...10)
            }
            // Menu – presents a list of actions.
            Section("Menu – Pop‑up Actions"){
                Menu("Options"){
                    Button("Share", action: { })
                    Button("Delete", role: .destructive, action: { })
                    Menu("Submenu"){
                        Button("Option 1", action: { })
                        Button("Option 2", action: { })
                    }
                }
            }
        }
        .navigationTitle("Buttons & Controls")
    }
}
