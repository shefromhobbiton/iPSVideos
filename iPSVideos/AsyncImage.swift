//
//  ImageFetcher.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/26/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image
    
    init(url: URL, placeholder: Placeholder? = nil, cache: ImageCache? = nil, configuration: @escaping (Image) -> Image = { $0 }) {
        loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
        self.configuration = configuration
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                //Image(uiImage: loader.image!)
                configuration(Image(uiImage: loader.image!))
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
            } else {
                placeholder
            }
        }
    }
}

//struct AsyncImage<Placeholder: View>: View {
//    @ObservedObject private var loader: ImageLoader
//    private let placeholder: Placeholder?
//    private let configuration: (Image) -> Image
//
//    init(url: URL, cache: ImageCache? = nil, placeholder: Placeholder? = nil, configuration: @escaping (Image) -> Image = { $0 }) {
//        loader = ImageLoader(url: url, cache: cache)
//        self.placeholder = placeholder
//        self.configuration = configuration
//    }
//
//    var body: some View {
//        image
//            .onAppear(perform: loader.load)
//            .onDisappear(perform: loader.cancel)
//    }
//
//    private var image: some View {
//        Group {
//            if loader.image != nil {
//                configuration(Image(uiImage: loader.image!))
//            } else {
//                placeholder
//            }
//        }
//    }
//}
