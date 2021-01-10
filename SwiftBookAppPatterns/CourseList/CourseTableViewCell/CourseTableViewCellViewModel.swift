//
//  CourseTableViewCellViewModel.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 10.01.2021.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

class CourseTableViewCellViewModel: CourseTableViewCellViewModelProtocol {
    var courseName: String {
        course.name ?? ""
    }
    
    var imageData: Data? {
        ImageManager.shared.getImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
}
