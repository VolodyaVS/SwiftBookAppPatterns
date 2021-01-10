//
//  CourseTableViewCell.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 09.01.2021.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    var viewModel: CourseTableViewCellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.courseName
            textLabel?.numberOfLines = 2
            
            guard let imageData = viewModel.imageData else { return }
            imageView?.image = UIImage(data: imageData)
        }
    }
    
}
