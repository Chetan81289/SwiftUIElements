//
//  SwiftUIElementsApp.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

/*
  @main tells Swift that this is the starting point of the program.
  App is a protocol that represents the app's structure and lifecycle.
  You don't use UIKit's AppDelegate here – SwiftUI manages everything.
 */

@main
struct SwiftUIElementsApp: App {
    /*
        @StateObject creates and OWNS an ObservableObject.
        The object is created only once and survives view redraws.
        Use @StateObject when THIS view is the original source of the object.
        Here we own the shared UserSettings, so we mark it @StateObject.
     
        In short: @StateObject = I create and I own this ObservableObject.
        It’s the SwiftUI way to keep reference‑type state alive and consistent across view redraws.
     */
    @StateObject private var userSettings = UserSettings()
    
    /*
        The body of an App returns one or more Scenes.
        WindowGroup is a scene that can contain a normal window (or multiple on iPad/mac).
        It automatically adapts to the platform.
     */
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                CategoryListView()
            }
            /*
                .environmentObject() injects an ObservableObject into the view hierarchy.
                Any child view can then access it via @EnvironmentObject, no manual passing.
             */
            .environmentObject(userSettings)
        }
    }
}
