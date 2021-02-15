//
//  CourseDetailsWorker.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 15.02.2021.
//  Copyright (c) 2021 Vladimir Stepanchikov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

class CourseDetailsWorker {
    func fetchImage(from imageUrl: String?) -> Data? {
        ImageManager.shared.getImageData(from: imageUrl)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        DataManager.shared.loadFavoriteStatus(for: courseName)
    }
    
    func setNewFavoriteStatus(for courseName: String, with status: Bool) {
        DataManager.shared.saveFavoriteStatus(for: courseName, with: status)
    }
}
