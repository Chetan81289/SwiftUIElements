//
//  TextAndLabelsView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct TextAndLabelsView: View {
    // @State allows a struct to hold mutable state. When the state changes, the view redraws.
    // Use @State for simple local data owned by this view.
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var bio: String = "Write about yourself..."
    
    // @EnvironmentObject reads an ObservableObject that was injected higher up (in the App).
    // Here we read the shared UserSettings without needing to pass it manually.
        @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        Form {
            // Section groups related content and adds a subtle header.
            Section("Text – Read‑only Styles") {
                Text("Simple text")
                Text("Bold").bold()
                Text("Italic").italic()
                Text("Underline").underline()
                Text("Strikethrough").strikethrough()
                Text("Colored").foregroundColor(.red)       // Foreground color
                Text("Large font").font(.largeTitle)        // Font size/style
                Text("This is a very long text that will wrap into multiple lines because it exceeds the available width.")
                    .lineLimit(3)                           // Max number of lines
                Text("**Markdown** is supported! *Italic*, ~strike~")   // Markdown
            }
            
            Section("Label – Icon + Text") {
                // Label combines an image and text in a single view.
                Label("Search", systemImage: "magnifyingglass")
                Label {
                    Text("Account")
                } icon: {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            
            Section("TextField – Two‑way Binding") {
                // TextField is an input field.
                // The $ prefix creates a Binding to the @State variable.
                // A Binding lets the view read AND write the value.
                TextField("Enter your name", text: $name)
                Text("Hello, \(name.isEmpty ? "Guest" : name)")
            }
            
            Section("SecureField – Hidden Input") {
                SecureField("Password", text: $password)
                Text("Password length: \(password.count)")
            }
            
            Section("TextEditor – Multiline Text") {
                TextEditor(text: $bio)
                    .frame(height: 100)
                    .border(.gray)
                Text("Character count: \(bio.count)")
            }
            
            Section("Dynamic Font Size (Two‑way)") {
                // Slider is another input control. It also uses a binding.
                Slider(value: $userSettings.fontSize, in: 12...30, step: 1)
                Text("Preview font size \(userSettings.fontSize, specifier: "%.0f")")
                    .font(.system(size: userSettings.fontSize))
            }
        }
        .navigationTitle("Text & Labels")
    }
    }

