//
//  NavigationAndModalsView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct NavigationAndModalsView: View {
    // State variables to control alerts and sheets
    @State private var showAlert = false
    @State private var showSheet = false
    @State private var selectedTab = 0
    var body: some View {
        // TabView creates a tab‑bar interface.
        TabView(selection: $selectedTab) {
            // Each tab gets its own root view
            NavigationStack{
                VStack(spacing: 30){
                    Text("NavigationStack + Sheet / Alert")
                        .font(.title2)
                    
                    Button("Show Alert"){
                        showAlert = true
                    }
                    .alert("Important Message", isPresented: $showAlert){
                        Button("OK") {}
                        Button("Delete",role: .destructive) {}
                    } message: {
                        Text("Alert with multiple buttons")
                    }
                    // Button that presents a Sheet (modal)
                    Button("Show Sheet"){
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet){
                        SheetContentView()
                            .presentationDetents([.medium, .large])  // Allow half‑screen or full
                    }
                    // Push a new view onto the NavigationStack
                    NavigationLink("Push to Detail") {
                        DetailView()
                    }
                }
                .padding()
                .navigationTitle("Modals & Nav")
            }
            .tabItem {
                Label("Modals", systemImage: "rectangle.portrait")
            }
            .tag(0)   // Tags distinguish tabs
            
            // Second tab
            Text("Second Tab")
                .tabItem {
                    Label("Second", systemImage: "star")
                }
                .tag(1)
        }
    }
}

// A view that will be shown as a sheet.
struct SheetContentView: View {
    @Environment(\.dismiss) var dismiss   // Allows closing the sheet
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sheet Content")
                Button("Dismiss") { dismiss() }
            }
            .navigationTitle("Sheet")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

// A detail view pushed onto the navigation stack.
struct DetailView: View {
    @State private var text = ""

    var body: some View {
        Form {
            TextField("Write something", text: $text)
            Text("You wrote: \(text)")
        }
        .navigationTitle("Detail")
    }
}
