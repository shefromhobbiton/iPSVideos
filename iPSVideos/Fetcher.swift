//
//  Fetcher.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/25/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI

// MARK: - Root
struct Root: Codable {
    let videos: [Videos]
}

// MARK: - Videos
struct Videos: Codable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: String
    let videoDescription: String
    let videoLink: String

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail
        case videoDescription = "description"
        case videoLink = "video_link"
    }
    
    #if DEBUG
    static let example = Videos(id: 1, name: "Test Video", thumbnail: "https://i.picsum.photos/id/477/2000/2000.jpg", videoDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", videoLink: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
    #endif
}

public class Fetcher: ObservableObject {
    
    @Published var videoList = [Videos]()
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://iphonephotographyschool.com/test-api/videos")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(Root.self, from: d)
                    //_ = try JSONDecoder().decode(Root.self, from: d)
                    DispatchQueue.main.async {
                        self.videoList = decodedLists.videos
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
                print(error)
            }
            
        }.resume()
    }
}
