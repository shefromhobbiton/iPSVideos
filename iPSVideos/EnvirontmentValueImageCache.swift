//
//  EnvirontmentValueImageCache.swift
//  iPSVideos
//
//  Created by She Razon-Bulalaque on 5/27/20.
//  Copyright © 2020 She Razon-Bulalaque. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
