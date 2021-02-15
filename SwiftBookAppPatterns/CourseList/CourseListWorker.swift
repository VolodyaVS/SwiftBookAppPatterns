//
//  CourseListWorker.swift
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

class CourseListWorker {
    func getCourseList(from courses: [Course]) -> [CourseDisplayedFields] {
        var courseList: [CourseDisplayedFields] = []
        
        courses.forEach { course in
            let courseName = course.name
            let imageData = fetchImageData(from: course.imageUrl)
            
            let courseDisplayedFileds = CourseDisplayedFields(
                courseName: courseName ?? "",
                imageData: imageData
            )
            courseList.append(courseDisplayedFileds)
        }
        
        return courseList
    }
    
    private func fetchImageData(from imageUrl: String?) -> Data? {
        ImageManager.shared.getImageData(from: imageUrl)
    }
}