//
//  CategoryListView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct CategoryListView: View {
    // The body property returns the view's content.
    var body: some View {
        // List creates a scrollable list of rows, similar to UITableView.
        List {
            // NavigationLink pushes a new view onto the NavigationStack.
                NavigationLink("Core Layout & Containers") { CoreLayoutContainersView() }
                NavigationLink("Text & Labels") { TextAndLabelsView() }
                NavigationLink("Buttons & Controls") { ButtonsAndControlsView() }
                NavigationLink("Images & Media") { ImagesAndMediaView() }
                NavigationLink("Navigation & Modals") { NavigationAndModalsView() }
                NavigationLink("Data Passing Demo") { DataPassingDemo() }
        }
        .navigationTitle("SwiftUI Elements")
    }
}

#Preview {
    CategoryListView()
}
