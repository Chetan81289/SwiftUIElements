//
//  UserSettings.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import Foundation
import Combine

/*
    ObservableObject is a protocol that allows an object to broadcast changes.
    SwiftUI views can watch this object and redraw when @Published properties change.
 */

class UserSettings: ObservableObject {
    // @Published marks a property so that SwiftUI updates any view that depends on it.
    @Published var isLoggedIn: Bool = false
    @Published var username: String = "iOS Dev"
    @Published var fontSize: Double = 16
    
    
}
