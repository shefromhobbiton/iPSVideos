//
//  ContentView.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/25/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     @ObservedObject var fetcher = Fetcher()
    
    var body: some View {
        //Text("Hello World")
        VStack {
            List(fetcher.videoList) { videoList in
                VStack (alignment: .leading) {
                    Text(videoList.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
