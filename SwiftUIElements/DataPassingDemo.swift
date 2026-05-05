//
//  DataPassingDemo.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct DataPassingDemo: View {
    // @EnvironmentObject reads the shared UserSettings that was injected in the App.
    @EnvironmentObject var userSettings: UserSettings
    @State private var localName: String = ""
    var body: some View {
        Form{
            Section("Data from @EnvironmentObject (Shared)"){
                Text("Username: \(userSettings.username)")
                Text("Font size: \(userSettings.fontSize, specifier: "%.0f")")
                Button("Change username") {
                    userSettings.username = "New User"  // Updates all views observing this object
                }
                // Pass a binding to the child: use $ to create a Binding to the property
                NavigationLink("Edit Username (via Binding)") {
                    EditUsernameView(username: $userSettings.username)
                }
            }
            
            Section("Local @State (Private to this view)") {
                TextField("Enter local name", text: $localName)
                Text("Local name: \(localName)")
            }
            Section("Passing a Value to a Child View") {
                // NavigationLink can pass a value directly to the destination
                NavigationLink("Go to detail with a plain value") {
                    ValueReceivingView(selectedItem: "Hello from parent")
                }
            }
        }
        .navigationTitle("Data Passing")
    }
}

// Child view that MODIFIES the username via a Binding.
// A Binding is a two‑way connection: changes here also update the parent.
struct EditUsernameView: View {
    @Binding var username: String   // @Binding creates a reference to external state

    var body: some View {
        Form {
            TextField("Edit username", text: $username)
        }
        .navigationTitle("Edit Username")
    }
}

// Child view that receives a constant value (no binding needed).
struct ValueReceivingView: View {
    let selectedItem: String    // A simple let constant passed by the parent

    var body: some View {
        Text("Received: \(selectedItem)")
            .font(.title)
    }
}

