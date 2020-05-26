//
//  VideoPlayer.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/27/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerView: UIViewControllerRepresentable {
    
    var videoURL: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlayerView>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player1 = AVPlayer(url: videoURL)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<PlayerView>) {
        
    }
}
