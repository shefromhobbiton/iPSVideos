//
//  ContentView.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/25/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct ContentView: View {
    @ObservedObject var fetcher = Fetcher()
    @Environment(\.imageCache) var cache: ImageCache
    
    //let url = URL(string: "https://i.picsum.photos/id/477/2000/2000.jpg")!
    
    //NavigationLink(destination: DetailView())
    var body: some View {
        NavigationView {
            List {
                ForEach(fetcher.videoList) { videoList in
                    //Text(videoList.name)
                    ItemRow(video: videoList)
                }
            }
            .navigationBarTitle("Videos")
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

