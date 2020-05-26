//
//  Utils.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/27/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import Foundation

public var dlStatus = false

//convert string to URL
public func convertToURL(URLString: String)->URL {
    let urlstr = URL(string: URLString)!
    return urlstr
}

public func downloadVideoFile(url: String) {
    var status = false
    let downloadTask = URLSession.shared.downloadTask(with: convertToURL(URLString: url)) {
        urlOrNil, responseOrNil, errorOrNil in
        // check for and handle errors:
        // * errorOrNil should be nil
        // * responseOrNil should be an HTTPURLResponse with statusCode in 200..<299
        
        guard let fileURL = urlOrNil else { return }
        do {
            let documentsURL = try
                FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            let savedURL = documentsURL.appendingPathComponent(fileURL.lastPathComponent)
            try FileManager.default.moveItem(at: fileURL, to: savedURL)
            
            status = true
            print("download complete")
            
        } catch {
            print ("file error: \(error)")
            status = false
        }
    }
    downloadTask.resume()
    
    DispatchQueue.main.async() {

        dlStatus = status

    }
    
}
