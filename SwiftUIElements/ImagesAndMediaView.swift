//
//  ImagesAndMediaView.swift
//  SwiftUIElements
//
//  Created by Chetan purohit on 05/05/26.
//

import SwiftUI

struct ImagesAndMediaView: View {
    // A real image URL from the web.
    let imageURL = URL(string: "https://www.sciencenews.org/wp-content/uploads/sites/2/2019/09/092719_mt_blackhole_feat.jpg?resize=1030,574")
    let sfSymbols = ["star.fill", "heart", "leaf", "flag", "bookmark.fill"]
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                GroupBox("Local Image - Asset Catalog"){
                    // Image from SF Symbols (system icons).
                    Image(systemName: "swift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                    // Image from Assets.xcassets (add your own image named "placeholder").
                    Image("Placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                GroupBox("AsyncImage – Load from URL"){
                    AsyncImage(url: imageURL) { phase in
                        // phase lets you handle loading, success, and failure.
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        case .failure:
                            Text("Failed to load image")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                GroupBox("SF Symbols – System Icons"){
                    // LazyVGrid creates a grid that loads views lazily.
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 5)){
                       ForEach(sfSymbols, id: \.self){ symbol in
                            Image(systemName: symbol)
                               .font(.largeTitle)
                               .padding()
                               .symbolRenderingMode(.multicolor)
                        }
                    }
                }
                GroupBox("VideoPlayer (placeholder)"){
                    // In real app you'd import AVKit and use VideoPlayer.
                    Text("VideoPlayer requires AVKit import")
                        .padding()
                        .background(.gray.opacity(0.2))
                }
            }
            .padding()
        }
        .navigationTitle("Images & Media")
    }
}

