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
        
        guard let stringURL = course.imageUrl else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageView?.image = UIImage(data: imageData)
    }
}
