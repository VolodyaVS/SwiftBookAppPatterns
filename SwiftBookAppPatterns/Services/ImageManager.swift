//
//  ImageManager.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 09.01.2021.
//  Copyright (c) 2021 Vladimir Stepanchikov. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func getImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        
        return imageData
    }
}
