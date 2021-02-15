//
//  CourseTableViewCell.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 09.01.2021.
//  Copyright (c) 2021 Vladimir Stepanchikov. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(for course: CourseDisplayedFields) {
        var content = defaultContentConfiguration()
        
        content.text = course.courseName
        content.textProperties.numberOfLines = 2
        
        guard let imageData = course.imageData else { return }
        content.image = UIImage(data: imageData)
        
        contentConfiguration = content
    }
}
