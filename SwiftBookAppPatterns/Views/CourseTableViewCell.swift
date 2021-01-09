//
//  CourseTableViewCell.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 09.01.2021.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(for course: Course) {
        textLabel?.text = course.name
        textLabel?.numberOfLines = 2
        
        imageView?.image = UIImage(data: ImageManager.shared.getImageData(from: course.imageUrl) ?? Data())
    }
}
