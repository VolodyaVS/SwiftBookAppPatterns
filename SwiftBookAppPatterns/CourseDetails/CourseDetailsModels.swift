//
//  CourseDetailsModels.swift
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

enum CourseDetails {
    
    // MARK: Use cases
    enum ShowDetails {
        struct Request {
        }
        
        struct Response {
            let courseName: String?
            let numberOfLessons: Int?
            let numberOfTests: Int?
            let imageData: Data?
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let courseName: String
            let numberOfLessons: String
            let numberOfTests: String
            let imageData: Data?
            let isFavorite: Bool
        }
    }
    
    enum SetFavoriteStatus {
        struct Response {
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let isFavorite: Bool
        }
    }
}