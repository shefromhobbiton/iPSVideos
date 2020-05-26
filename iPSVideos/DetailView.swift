//
//  DetailView.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/26/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var video: Videos
    
    @State private var showAlert = false
    @State private var message = ""
    
    //alert placeholder
    var alert: Alert {
        Alert(title: Text("iPSVideos"), message: Text(message), dismissButton: .default(Text("Close")))
    }


    var body: some View {
        VStack {
            PlayerView(videoURL: convertToURL(URLString: video.videoLink)).frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 3)
                .cornerRadius(5)
            
            Text(video.name).fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            
            
            Text(video.videoDescription)
                .padding()
        }
        .navigationBarItems(trailing:
            Button("Download Video") {
                //print("Download tapped!")
                downloadVideoFile(url: self.video.videoLink)
                if dlStatus {
                    self.message = "Video Downloaded Successfully"
                } else {
                    self.message = "Failed to download video. Please try again"
                }
                
                self.showAlert.toggle()
            }
            .alert(isPresented: $showAlert, content: { self.alert })
            
        )
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(video: Videos.example)
        }
    }
}
