//
//  CoreLayoutContainersView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct CoreLayoutContainersView: View {
    // A local array of colors just for demonstration.
    let colors: [Color] = [.red, .blue, .green, .orange, .purple]
    
    var body: some View {
        // ScrollView allows content to be scrolled if it exceeds the screen height.
        ScrollView{
            // VStack arranges its children vertically with a given spacing.
            VStack(spacing: 20) {
                // GroupBox is a built-in container with a label and background.
                // It's perfect for grouping related content.
                GroupBox("VStack – Vertical Stack"){
                    VStack(spacing: 8){
                        ForEach(0..<3){ i in
                            Text("Row \(i+1)")   // Text is a read-only label
                                .padding()      // Adds extra space inside the view
                                .background(colors[i])
                                .cornerRadius(8)
                        }
                    }
                }
                GroupBox("HStack – Horizontal Stack"){
                    HStack(spacing: 8){
                        ForEach(0..<4){ i in
                            Text("Col \(i+1)")
                                .padding()
                                .background(colors[i])
                                .cornerRadius(8)
                        }
                    }
                }
                GroupBox("ZStack – Overlay"){
                    // Views are drawn back to front.
                    ZStack{
                        Circle()
                            .fill(.blue)
                            .frame(width: 100,height: 100)
                        Text("Top")       // This appears on top of the circle
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                GroupBox("List (Static)"){
                    List {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .frame(height: 100)
                }
                GroupBox("Form - Data Entery") {
                    Form {
                        Text("Settings")
                        Toggle("Airplane Mode", isOn: .constant(false))  // Toggle is a control for boolean values.
                    }
                    .frame(height: 120)
                }
                GroupBox("ScrollView – This View is Scrollable") {
                    Text("ScrollView lets you place content larger than the screen.")
                        .frame(height: 100)
                        .background(.yellow.opacity(0.3))
                }
                GroupBox("Grid (iOS 16+) – Table-like layout") {
                    Grid {
                        GridRow {
                            Text("Row 1, Col 1").border(.gray)
                            Text("Row 1, Col 2").border(.gray)
                        }
                        .padding(8)
                        GridRow {
                            Text("Row 2, Col 1").border(.gray)
                            Text("Row 2, Col 2").border(.gray)
                        }
                    }
                }
                GroupBox("Spacer & Divider") {
                    VStack {
                        HStack {
                            Text("Left")
                            // Spacer pushes views apart. It takes all available remaining space.
                            Spacer()
                            Text("Right")
                        }
                        Divider()           // A simple horizontal line
                        Text("Below divider")
                    }
                }
                .padding()
            }
            .navigationTitle("Layout & Containers")
        }
    }
}

#Preview {
    CoreLayoutContainersView()
}
