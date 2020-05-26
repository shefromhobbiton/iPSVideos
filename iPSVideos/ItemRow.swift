//
//  ItemRow.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/26/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct ItemRow: View {
    var video: Videos
    
    var body: some View {
        NavigationLink(destination: DetailView(video: video)) {
            HStack {
                //thumbnail image
                AsyncImage(
                    url: convertToURL(URLString: video.thumbnail),
                    placeholder: Text("Loading ...")
                )

                //video name
                Text(video.name)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(video: Videos.example)
    }
}


